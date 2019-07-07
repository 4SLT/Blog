package _4slt.dao;


import java.sql.SQLException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class DBvalue_keywords {

    private int id=0;
    private String[] keywordList;
    private int size;


    public DBvalue_keywords() {
        this.init();
    }

    public void init() {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        try {
            String sql = "SELECT article_keywords FROM 4slt_article";
            dBconnect.resultSet = dBconnect.statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        try {
            String keywords = "";
            while (dBconnect.resultSet.next()) {
                //得到所有keyword组成的String，用，分割
                keywords += dBconnect.resultSet.getString("article_keywords") + ",";
            }
            String[] keyword = keywords.split(",|，");

            Set<String> set = new HashSet<>();
            for (int i = 0; i < keyword.length; i++) {
                set.add(keyword[i]);
            }

            keywordList = new String[set.size()];

            Iterator<String> value =set.iterator();
            while (value.hasNext()){
                keywordList[id++]=value.next();
            }
            size = keywordList.length;


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

    public String[] getKeywordList() {
        return keywordList;
    }

    public void setKeywordList(String[] keywordList) {
        this.keywordList = keywordList;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
