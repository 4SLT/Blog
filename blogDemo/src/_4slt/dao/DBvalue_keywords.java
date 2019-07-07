package _4slt.dao;

import _4slt.entity.Sort;

import java.sql.SQLException;
import java.util.*;

public class DBvalue_keywords {

    private int id;
    private String keyword = "";
    private String name;
    private int size;
    private Sort sort;
    private List<String> keywordList = new ArrayList<>();
    private List<Sort> sortList = new ArrayList<>();


    public DBvalue_keywords() {
        this.init();

    }

    public void init() {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        try {
            String sql = "SELECT * FROM 4slt_sorts";
            dBconnect.resultSet = dBconnect.statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        try {
            while (dBconnect.resultSet.next()) {

                id = dBconnect.resultSet.getInt("sort_id");
                name = dBconnect.resultSet.getString("sort_name");

                sort = new Sort();
                sort.setId(id);
                sort.setName(name);

                sortList.add(sort);

                keywordList.add(dBconnect.resultSet.getString("sort_name"));

            }

            size = keywordList.size();

        } catch (SQLException e) {
            System.out.println("keywords整合出错");
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<String> getKeywordList() {
        return keywordList;
    }

    public void setKeywordList(List<String> keywordList) {
        this.keywordList = keywordList;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
