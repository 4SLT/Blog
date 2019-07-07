package _4slt.dao;

import java.sql.SQLException;

/**
 * 该数据表中，id=1记录网站总访问量
 *           id=2记录网站当日访问量
 */

public class DBvalue_visits {

    private int count;
    private int countToday;

    public DBvalue_visits() {
        this.init();
    }

    public void init() {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        try {
            String sql = "SELECT * FROM 4slt_visits";
            dBconnect.resultSet = dBconnect.statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {

            //id=1
            dBconnect.resultSet.next();
            count = dBconnect.resultSet.getInt("visit_count");

            //id=2
            dBconnect.resultSet.next();
            countToday=dBconnect.resultSet.getInt("visit_count");



        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }


    }


    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCountToday() {
        return countToday;
    }

    public void setCountToday(int countToday) {
        this.countToday = countToday;
    }
}
