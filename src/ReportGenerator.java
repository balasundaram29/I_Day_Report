
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
import jxl.format.Border;
import jxl.format.BorderLineStyle;
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
public class ReportGenerator {

    ResultSet rs;
    String[] types;//= {"AE50", "AE100", "AE130"};
    public static int CURR_ROW;
    public static int CURR_COL_PR = 0;
    public static int NAME_COL_PR = 3;
    public static int NAME_ROW_PR = 3;
    Connection conn;
    public static int TABLE_START_COL = 1;
    HashMap<String, Integer> typewiseTotal = new HashMap<String, Integer>();

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

    public ReportGenerator() {
        conn = null;
        try {
            conn = Utilities.getConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
            ;
            System.exit(1);
        }
        /* try {
        ;
        }

        } catch (Exception ex) {
        ex.printStackTrace();
        }
        /*
        for (int i = 0; i < types.length; i++) {
        System.out.println("types :??? " + i + " ---" + types[i]);
        typewiseTotal.put(types[i], 0);
        }*/

    }

    public static void main(String[] args) {
        new ReportGenerator().go();
    }

    public void go() {

        try {

            JFrame gui = new JFrame("Generate Reports");
            gui.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            gui.setLocation(200, 200);

            JPanel pane = new JPanel();
            pane.setLayout(new GridLayout(0, 5, 10, 2));
            pane.add(new JLabel("                  From : "));
            final JDateChooser calendarFrom = new JDateChooser(new Date(), "dd-MM-yyyy");
            pane.add(calendarFrom);
            pane.add(new JLabel("                   "));
            pane.add(new JLabel("                  To : "));
            final JDateChooser calendarTo = new JDateChooser(new Date(), "dd-MM-yyyy");
            pane.add(calendarTo);
            Date date = calendarFrom.getDate();
            //String dateFrom=""+(date.getYear()+1900)+"-"+(date.getMonth()+1)+"-"+(date.getDate());

            JButton button = new JButton("Generate Reports");
            // final ReportGenerator genr = new ReportGenerator();
            button.addActionListener(new ActionListener() {

                public void actionPerformed(ActionEvent ae) {
                    Date date1 = calendarFrom.getDate();
                    ArrayList months=new ArrayList();
                    String dateFrom = (date1.getYear() + 1900) + "-" + (date1.getMonth() + 1) + "-" + (date1.getDate());
                    System.out.println(dateFrom);
                    Date date2 = calendarTo.getDate();
                    String dateTo = (date2.getYear() + 1900) + "-" + (date2.getMonth() + 1) + "-" + (date2.getDate());
                    System.out.println(dateTo);
                    currMonthIndex=
                    while

                    try {
                        generateTable(conn, dateFrom, dateTo);
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

            //pane.add(one);
            //generateTable(conn, "db_for_bis_mb");
        } catch (Exception ex) {
            Logger.getLogger(ReportGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void generateTable(Connection con, String dateFrom, String dateTo)
            throws SQLException {
        Statement stmt = conn.createStatement();
        String query = "SET @start_date=" + "'" + dateFrom + "'";
        stmt.executeUpdate(query);
        query = "SET @end_date =" + "'" + dateTo + "'";
        stmt.executeUpdate(query);
        query = "SELECT `alltypes`.`type` , SUM(`production`.`quantity`) FROM `alltypes` NATURAL JOIN"
                + "`production` WHERE   `alltypes`.`type` =`production`.`at_type` AND "
                + " `production`.`date` BETWEEN @start_date AND @end_date GROUP BY `type`  ";
        rs = stmt.executeQuery(query);
        int k = getLength(rs);
        System.out.println("types lengh is " + k);

        types = new String[k];
        int j = 0;
        rs.beforeFirst();
        while (rs.next()) {
            types[j] = rs.getString("type");
            j++;
        }
        for (int i = 0; i < types.length; i++) {
            System.out.println("types :??? " + i + " ---" + types[i]);
            typewiseTotal.put(types[i], 0);
        }

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

            File varFile = new File("VarReport.xls");

            //Workbook wb = Workbook.getWorkbook(in);
            WritableWorkbook varBook = Workbook.createWorkbook(varFile);
            WritableSheet sheet = varBook.createSheet("First sheet", 0);
            Label lbl = new Label(NAME_COL_PR, NAME_ROW_PR, "Firm : Annai Engineering Company,Coimbatore. ");
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            WritableCellFormat wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);

            lbl = new Label(NAME_COL_PR, NAME_ROW_PR + 2, "Variation Report for the period from  " + indianDateFrom + " to " + indianDateTo);
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            CURR_COL_PR = TABLE_START_COL;

            CURR_ROW = NAME_ROW_PR + 4;

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
            varBook.write();
            varBook.close();

            String[] commands = {"cmd", "/c", "start", "\"DummyTitle\"", "VarReport.xls"};//
            Runtime.getRuntime().exec(commands);

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
            query = "SELECT "
                    + " MONTHNAME(STR_TO_DATE(`NMonth`, '%m')) AS `Month`,`Year`,";
            for (int i = 0; i < types.length; i++) {
                query = query + " MAX(IF(`Type` = '" + types[i] + "', `Quantity`,NULL)) AS `" + types[i] + "`";
                // query = query + " `Quantity` AS `" + types[i] + "`";
                if (i != types.length - 1) {
                    query = query + ",";
                }
            }

            query = query + " FROM `MonthView` GROUP BY `Month` ORDER BY `Year`  ,`NMonth`";
            // + " INTO OUTFILE 'C:/prodn.csv' "
            // + " FIELDS TERMINATED BY ','  "
            // + " OPTIONALLY ENCLOSED BY '\"'  LINES TERMINATED BY '\n'";
            rs = stmt.executeQuery(query);

            times = new WritableFont(WritableFont.TIMES, 11, WritableFont.NO_BOLD);
            wcf = new WritableCellFormat(times);
            wcf.setBorder(Border.ALL, BorderLineStyle.MEDIUM);

            File in = new File("mysqlxlReport.xls");
            File out = new File("ProductionReport.xls");
            //Workbook wb = Workbook.getWorkbook(in);
            WritableWorkbook out1 = Workbook.createWorkbook(out);
            sheet = out1.createSheet("First sheet", 0);
            lbl = new Label(NAME_COL_PR - 2, NAME_ROW_PR, "Annai Engineering Company,Coimbatore. ");
            times = new WritableFont(WritableFont.TIMES, 16, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            lbl = new Label(NAME_COL_PR - 2, NAME_ROW_PR + 2, "Production for the period  from  " + indianDateFrom + " to " + indianDateTo);
            times = new WritableFont(WritableFont.TIMES, 13, WritableFont.BOLD);
            wcf1 = new WritableCellFormat(times);
            lbl.setCellFormat(wcf1);
            sheet.addCell(lbl);
            CURR_COL_PR = NAME_ROW_PR + 2;

            CURR_ROW = NAME_ROW_PR + 4;
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

            CURR_ROW = CURR_ROW + 1;

            int t = 0;
            int monthwiseTotal;
            while (rs.next()) {
                monthwiseTotal = 0;
                CURR_COL_PR = TABLE_START_COL;

                lbl = new Label(CURR_COL_PR, CURR_ROW, rs.getString("Month") + " " + rs.getString("Year"));
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
                //System.out.println(" type wise total is"+t);
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
            out1.write();
            out1.close();

            String[] commands1 = {"cmd", "/c", "start", "\"DummyTitle\"", "ProductionReport.xls"};//
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
