
import com.toedter.calendar.JCalendar;
import com.toedter.calendar.JDateChooser;
import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.PageOrientation;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ANNAIENG
 */
public class ReportGenerator2 {

    ArrayList months;
    ResultSet rs;
    String[] types;//= {"AE50", "AE100", "AE130"};
    public static int CURR_ROW;
    public static int CURR_COL_PR = 0;
    public static int NAME_COL_PR = 3;
    public static int NAME_ROW_PR = 3;
    Connection conn;
    public static int TABLE_START_COL = 1;
    HashMap<String, Integer> typewiseTotal = new HashMap<String, Integer>();
    HashMap<Integer, String> monthMap = getMonthMap();

    public HashMap getMonthMap() {
        HashMap<Integer, String> monthMap = new HashMap<Integer, String>();
        monthMap.put(1, "January");
        monthMap.put(2, "February");
        monthMap.put(3, "March");
        monthMap.put(4, "April");
        monthMap.put(5, "May");
        monthMap.put(6, "June");
        monthMap.put(7, "July");
        monthMap.put(8, "August");
        monthMap.put(9, "September");
        monthMap.put(10, "October");
        monthMap.put(11, "November");
        monthMap.put(12, "December");
        return monthMap;

    }

    public int getLength(ResultSet rs) {

        int i = 0;
        try {
            rs.beforeFirst();
            while (rs.next()) {
                i++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        }
        return i;
    }

    public String createMonthString(int year, int month) {

        return monthMap.get(month) + " " + year;

    }

    public ReportGenerator2() {

        conn = null;
        /* try {
        conn = Utilities.getConnection();
        } catch (Exception ex) {
        ex.printStackTrace();
        ;
        System.exit(1);
        }*/


    }

    public static void main(String[] args) {
        new ReportGenerator2().go();
    }

    public void go() {

        try {

            JFrame gui = new JFrame("Generate Reports");
            gui.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            gui.setLocation(200, 200);

            JPanel pane = new JPanel();
            pane.setLayout(new GridLayout(0, 5, 10, 2));
            pane.add(new JLabel("                   "));
            pane.add(new JLabel("           Report Date : "));
           
            final JDateChooser calendarReportDate = new JDateChooser(new Date(), "dd-MM-yyyy");
            pane.add(calendarReportDate);
             pane.add(new JLabel("                   "));
            pane.add(new JLabel("                   "));
            pane.add(new JLabel("                  From : "));
            final JDateChooser calendarFrom = new JDateChooser(new Date(), "dd-MM-yyyy");
            pane.add(calendarFrom);
            pane.add(new JLabel("                   "));
            pane.add(new JLabel("                  To : "));
            final JDateChooser calendarTo = new JDateChooser(new Date(), "dd-MM-yyyy");
            pane.add(calendarTo);
            Date date = calendarFrom.getDate();
            JButton button = new JButton("Generate Reports");
            button.addActionListener(new ActionListener() {

                public void actionPerformed(ActionEvent ae) {


                    try {
                        generateTable(calendarReportDate,calendarFrom, calendarTo, "sub");
                        generateTable(calendarReportDate,calendarFrom, calendarTo, "mb");
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                }
            });
            pane.add(new JLabel("                   "));
            pane.add(new JLabel("                   "));
            pane.add(button);
            gui.setContentPane(pane);
            gui.pack();
            gui.setVisible(true);

        } catch (Exception ex) {
            Logger.getLogger(ReportGenerator2.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void generateTable(JDateChooser  calendarReportDate,JDateChooser calendarFrom, JDateChooser calendarTo, String licenceSuffix)
            throws SQLException {
        String dbName = "db_for_bis_" + licenceSuffix;
        String licenceDetails;
        if (licenceSuffix == "sub") {
            licenceDetails = "Openwell Submersible Pumpsets; IS 14220; CM/L No :6610865";
        } else {
            licenceDetails = "Centrifugal Monoblock Pumpsets; IS 9079; CM/L No :6782793";
        }
        conn = Utilities.getConnection(dbName);
        Date dateR = calendarReportDate.getDate();
        months = new ArrayList();
        String dateOfReport = (dateR.getYear() + 1900) + "-" + (dateR.getMonth() + 1) + "-" + (dateR.getDate());
        String[] splittedDateOfReport = dateOfReport.split("-");
        if (splittedDateOfReport[1].length() < 2) {
            splittedDateOfReport[1] = "0" + splittedDateOfReport[1];
        }
        if (splittedDateOfReport[2].length() < 2) {
            splittedDateOfReport[2] = "0" + splittedDateOfReport[2];
        }
        String indianDateOfReport = splittedDateOfReport[2] + "-" + splittedDateOfReport[1] + "-" + splittedDateOfReport[0];
        System.out.println(dateOfReport);
        Date date1 = calendarFrom.getDate();
        String dateFrom = (date1.getYear() + 1900) + "-" + (date1.getMonth() + 1) + "-" + (date1.getDate());
        System.out.println(dateFrom);
        Date date2 = calendarTo.getDate();
        String dateTo = (date2.getYear() + 1900) + "-" + (date2.getMonth() + 1) + "-" + (date2.getDate());
        System.out.println(dateTo);

        int monthIndex = date1.getMonth() + 1;
        int yearIndex = date1.getYear() + 1900;
        int finalMonthIndex = date2.getMonth() + 1;
        int finalYearIndex = date2.getYear() + 1900;
        boolean yearChange = false;
        if (date1.getMonth() + 1 == 12) {
            yearChange = true;
        }
        String currMonthString = createMonthString(yearIndex, monthIndex);
        months.add(currMonthString);
        System.out.println("current Month is" + currMonthString);

        //currMonthString!=finalMonthString
        while (true) {
            if (monthIndex == finalMonthIndex && yearIndex == finalYearIndex) {
                break;
            }
            if (monthIndex == 12) {
                monthIndex = 1;
                yearIndex = yearIndex + 1;
            } else {
                monthIndex++;
            }
            currMonthString = createMonthString(yearIndex, monthIndex);
            months.add(currMonthString);
            System.out.println("current Month is" + currMonthString);
            System.out.println("final  Month is" + createMonthString(finalYearIndex, finalMonthIndex));

        }
        Statement stmt = conn.createStatement();
        String query = "SET @start_date=" + "'" + dateFrom + "'";
        stmt.executeUpdate(query);
        query = "SET @end_date =" + "'" + dateTo + "'";
        stmt.executeUpdate(query);
        
        String[] splittedDateFrom = dateFrom.split("-");
        if (splittedDateFrom[1].length() < 2) {
            splittedDateFrom[1] = "0" + splittedDateFrom[1];
        }
        if (splittedDateFrom[2].length() < 2) {
            splittedDateFrom[2] = "0" + splittedDateFrom[2];
        }
        String indianDateFrom = splittedDateFrom[2] + "-" + splittedDateFrom[1] + "-" + splittedDateFrom[0];
        String[] splittedDateTo = dateTo.split("-");
        if (splittedDateTo[1].length() < 2) {
            splittedDateTo[1] = "0" + splittedDateTo[1];
        }
        if (splittedDateTo[2].length() < 2) {
            splittedDateTo[2] = "0" + splittedDateTo[2];
        }
        String indianDateTo = splittedDateTo[2] + "-" + splittedDateTo[1] + "-" + splittedDateTo[0];

        query = "select 'Type','RHeadMax','RHeadMin','RDischMax','RDischMin','OAEffMax','OAEffMin','MaxCurrMax','MaxCurrMin'"
                + "union all"
                + "(SELECT `at_type` AS 'Type',"
                + " ROUND(max(`rhead`), 2) AS 'RHeadMax',ROUND(min(`rhead`), 2) AS 'RHeadMin',"
                + " ROUND(max(`rdisch`), 2) AS 'RDischMax',"
                + "  ROUND(min(`rdisch`), 2) AS 'RDischMin',"
                + " ROUND(max(`oaeff`), 2) AS 'OAEffMax',"
                + " ROUND(min(`oaeff`), 2) AS 'OAEffMin',"
                + " ROUND(max(`maxcurrent`), 2) AS 'MaxCurrMax',"
                + " ROUND(min(`maxcurrent`), 2) AS 'MaxCurrMin' "
                + " FROM    `observed_values` "
                + " WHERE  `date` BETWEEN @start_date AND @end_date"
                + " GROUP BY `Type`"
                + " )";
        // + "INTO OUTFILE 'C:/file1.csv' "
        //+ "FIELDS TERMINATED BY ','  "
        //+ " OPTIONALLY ENCLOSED BY '\"'  LINES TERMINATED BY '\n')";
        try {

            rs = stmt.executeQuery(query);
            WritableFont times = new WritableFont(WritableFont.TIMES, 11, WritableFont.NO_BOLD);
            WritableCellFormat wcf = new WritableCellFormat(times);
            wcf.setBorder(Border.ALL, BorderLineStyle.MEDIUM);
            String varFileName = "VarReport" + licenceSuffix.toUpperCase() + ".xls";
            System.out.println("VarFile name is "+varFileName);
            File varFile = new File(varFileName);

            //Workbook wb = Workbook.getWorkbook(in);
            WritableWorkbook varBook = Workbook.createWorkbook(varFile);
            WritableSheet sheet = varBook.createSheet("First sheet", 0);
            Label lbl = new Label(NAME_COL_PR, NAME_ROW_PR, "Firm : Annai Engineering Company,Coimbatore. ");
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            WritableCellFormat wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            lbl = new Label(NAME_COL_PR+6, NAME_ROW_PR+1, "Date: "+indianDateOfReport);
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            wcf1.setAlignment(Alignment.RIGHT);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            lbl = new Label(NAME_COL_PR, NAME_ROW_PR + 3, licenceDetails);
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            lbl = new Label(NAME_COL_PR, NAME_ROW_PR + 5, "Variation Report for the period from  " + indianDateFrom + " to " + indianDateTo);
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            CURR_COL_PR = TABLE_START_COL;

            CURR_ROW = NAME_ROW_PR + 7;

            while (rs.next()) {
                CURR_COL_PR = TABLE_START_COL;
                for (int i = 1; i < 10; i++) {
                    System.out.println(rs.getString(i));
                    lbl = new Label(CURR_COL_PR, CURR_ROW, rs.getString(i));
                    lbl.setCellFormat(wcf);
                    sheet.addCell(lbl);
                    sheet.setColumnView(CURR_COL_PR, 12);
                    CURR_COL_PR = CURR_COL_PR + 1;
                }
                CURR_ROW = CURR_ROW + 1;
            }
            sheet.setPageSetup(PageOrientation.LANDSCAPE);
            varBook.write();
            varBook.close();

            String[] commands = {"cmd", "/c", "start", "\"DummyTitle\"", varFileName};//
            Runtime.getRuntime().exec(commands);
            query = "DROP TABLE IF EXISTS  `AllMonths`";
            stmt.executeUpdate(query);
            query = "CREATE TEMPORARY TABLE `AllMonths` "
                    + "("
                    + "month_str VARCHAR(20)"
                    + ")";
            stmt.executeUpdate(query);

            for (int i = 0; i < months.size(); i++) {
                query = "INSERT INTO `AllMonths` VALUES ('" + months.get(i) + "');";
                System.out.println(query);
                stmt.executeUpdate(query);
            }

            query = "DROP TABLE IF EXISTS  `MonthView`";
            stmt.executeUpdate(query);
            query = "DROP VIEW IF EXISTS  `MonthView`";
            stmt.executeUpdate(query);
            query = "CREATE  TEMPORARY TABLE `MonthView` AS "
                    + "SELECT month(`date`) AS  'NMonth',year(`date`) AS 'Year', "
                    + "`at_type` AS 'Type' ,sum( `quantity`)  AS 'Quantity' FROM  `production`"
                    + "WHERE  `date` BETWEEN @start_date AND @end_date  "
                    + "GROUP BY month(`date`) ,`at_type` "
                    + "ORDER BY  `at_type`,year(`date`),month(`date`)";
            stmt.executeUpdate(query);
            query = "SELECT DISTINCT `Type` FROM `MonthView`";//alltypes` NATURAL JOIN"
                //+ "`production` WHERE   `alltypes`.`type` =`production`.`at_type` AND "
                //+ " `production`.`date` BETWEEN @start_date AND @end_date GROUP BY `type`  ";
        rs = stmt.executeQuery(query);
        int k = getLength(rs);
        System.out.println("types lengh is " + k);

        types = new String[k];
        int j = 0;
        rs.beforeFirst();
        while (rs.next()) {
            types[j] = rs.getString("Type");
            System.out.println("type ["+j+"]  is "+types[j]);
            j++;
        }
        for (int i = 0; i < types.length; i++) {
            System.out.println("types :??? " + i + " ---" + types[i]);
            typewiseTotal.put(types[i], 0);
        }

            query = "DROP TABLE IF EXISTS  `MonthView2`";
            stmt.executeUpdate(query);
            query = "DROP TABLE IF EXISTS  `results`";
            stmt.executeUpdate(query);

            query = " CREATE TEMPORARY TABLE MonthView2 AS SELECT "
                    + " CONCAT(MONTHNAME(STR_TO_DATE(`NMonth`, '%m')),' ',CAST(`Year` AS CHAR)) AS `Month`,";//,`Year`,";
            for (int i = 0; i < types.length; i++) {
                query = query + " MAX(IF(`Type` = '" + types[i] + "', `Quantity`,NULL)) AS `" + types[i] + "`";

                if (i != types.length - 1) {
                    query = query + ",";
                }
            }

            query = query + " FROM `MonthView` GROUP BY `Month` ORDER BY `Year`  ,`NMonth`";/*
            + " INTO OUTFILE 'prodn.csv' "
            + " FIELDS TERMINATED BY ','  "
            + " OPTIONALLY ENCLOSED BY '\"'  LINES TERMINATED BY '\n'";*/

            stmt.executeUpdate(query);

            query = "CREATE TEMPORARY TABLE results AS SELECT `month_str`,";
            for (int i = 0; i < types.length; i++) {
                query = query + "COALESCE(" + types[i] + ",0) AS `" + types[i] + "`";
                if (i + 1 != types.length) {
                    query = query + ",";
                }
            }
            query = query + " FROM `AllMonths` LEFT OUTER JOIN `MonthView2` ON"
                    + "`AllMonths`.`month_str`=`MonthView2`.`Month`";
            stmt.executeUpdate(query);

            query = "SELECT * FROM `results`";
            rs = stmt.executeQuery(query);
            times = new WritableFont(WritableFont.TIMES, 11, WritableFont.NO_BOLD);
            wcf = new WritableCellFormat(times);
            wcf.setBorder(Border.ALL, BorderLineStyle.MEDIUM);

            String prodFileName = "ProductionReport" + licenceSuffix.toUpperCase() + ".xls";
            File prodFile = new File(prodFileName);

            WritableWorkbook prodBook = Workbook.createWorkbook(prodFile);
            sheet = prodBook.createSheet("First sheet", 0);
            lbl = new Label(NAME_COL_PR - 2, NAME_ROW_PR, "Annai Engineering Company,Coimbatore. ");
            times = new WritableFont(WritableFont.TIMES, 16, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
             lbl = new Label(NAME_COL_PR+4, NAME_ROW_PR+1, "Date: "+indianDateOfReport);
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            wcf1.setAlignment(Alignment.RIGHT);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            lbl = new Label(NAME_COL_PR - 2, NAME_ROW_PR + 3,licenceDetails );
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);

            lbl = new Label(NAME_COL_PR - 2, NAME_ROW_PR + 5, "Production for the period  from  " + indianDateFrom + " to " + indianDateTo);
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
       

            CURR_ROW = NAME_ROW_PR + 7;
            lbl = new Label(TABLE_START_COL, CURR_ROW, "Month");
            lbl.setCellFormat(wcf);
            sheet.addCell(lbl);
            sheet.setColumnView(TABLE_START_COL, 20);
            CURR_COL_PR = TABLE_START_COL;
            for (int i = 0; i < types.length; i++) {
                CURR_COL_PR = CURR_COL_PR + 1;
                lbl = new Label(CURR_COL_PR, CURR_ROW, types[i]);
                lbl.setCellFormat(wcf);
                sheet.addCell(lbl);
            }
            CURR_COL_PR = CURR_COL_PR + 1;
            lbl = new Label(CURR_COL_PR, CURR_ROW, "Total");
            lbl.setCellFormat(wcf);
            sheet.addCell(lbl);
//fill first with zeros
            CURR_ROW = CURR_ROW + 1;

            int t = 0;
            //  int index = 0;
            int monthwiseTotal;
            // CURR_ROW = SAVED_ROW;
            while (rs.next()) {
                monthwiseTotal = 0;
                CURR_COL_PR = TABLE_START_COL;

                lbl = new Label(CURR_COL_PR, CURR_ROW, rs.getString("month_str"));
                lbl.setCellFormat(wcf);
                sheet.addCell(lbl);

                for (int i = 0; i < types.length; i++) {
                    CURR_COL_PR = CURR_COL_PR + 1;
                    t = typewiseTotal.get(types[i]) + rs.getInt(types[i]);
                    typewiseTotal.put(types[i], t);
                    monthwiseTotal = monthwiseTotal + rs.getInt(types[i]);
                    lbl = new Label(CURR_COL_PR, CURR_ROW, Integer.toString(rs.getInt(types[i])));
                    lbl.setCellFormat(wcf);
                    sheet.addCell(lbl);
                }
                CURR_COL_PR = CURR_COL_PR + 1;

                lbl = new Label(CURR_COL_PR, CURR_ROW, Integer.toString(monthwiseTotal));

                lbl.setCellFormat(wcf);
                sheet.addCell(lbl);
                CURR_ROW = CURR_ROW + 1;
                System.out.println("Current row after inc is " + CURR_ROW);
            }

            int a;

            CURR_COL_PR = TABLE_START_COL;
            lbl = new Label(CURR_COL_PR, CURR_ROW, "Total");
            lbl.setCellFormat(wcf);
            sheet.addCell(lbl);
            CURR_COL_PR = CURR_COL_PR + 1;

            for (int i = 0; i < types.length; i++) {
                a = typewiseTotal.get(types[i]);
                lbl = new Label(CURR_COL_PR, CURR_ROW, typewiseTotal.get(types[i]).toString());
                lbl.setCellFormat(wcf);
                sheet.addCell(lbl);
                CURR_COL_PR = CURR_COL_PR + 1;
            }

            t = 0;
            for (String key : typewiseTotal.keySet()) {
                t = t + typewiseTotal.get(key);
            }
            lbl = new Label(CURR_COL_PR, CURR_ROW, Integer.toString(t));
            lbl.setCellFormat(wcf);
            sheet.addCell(lbl);
            CURR_ROW = CURR_ROW + 2;
            lbl = new Label(TABLE_START_COL, CURR_ROW, "For Annai Engineering Company");
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            CURR_ROW = CURR_ROW + 3;
            lbl = new Label(TABLE_START_COL, CURR_ROW, "Proprietor");
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            prodBook.write();
            prodBook.close();

            String[] commands1 = {"cmd", "/c", "start", "\"DummyTitle\"", prodFileName};//
            Runtime.getRuntime().exec(commands1);
            System.out.println("Executed sqls");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
    }
}
