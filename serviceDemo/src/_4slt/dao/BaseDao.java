package _4slt.dao;

import _4slt.entity.Article;
import _4slt.entity.Message;

import java.sql.*;
import java.util.List;

public class BaseDao implements BaseDB {

    @Override
    public void saveArticle(String title, String author, String content, String keywords, String date, String picture) {
        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        String sql = "INSERT INTO 4slt_article(article_title,article_author,article_content,article_keywords,article_date,picture_url)" +
                " VALUES('" + title + "','" + author + "','" + content + "','" + keywords + "','" + date + "','" + picture + "')";

        try {
            int count = dBconnect.statement.executeUpdate(sql);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }
    }


    @Override
    public void saveKeywords(String[] keywordlist) {
        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        String sql = "";

        try {
            for (int i = 0; i < keywordlist.length; ++i) {
                sql = "insert into 4slt_sorts(sort_name) select '" + keywordlist[i] + "' from dual where not exists(select * from 4slt_sorts where sort_name='" + keywordlist[i] + "');";
                dBconnect.statement.executeUpdate(sql);
            }
        } catch (SQLException e) {
            System.out.println("存入关键词失败");
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }
    }

    /**
     * 删除指定id的article
     *
     * @param article_id
     */
    @Override
    public void DeleteArticle(int article_id) {
        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        String sql = "delete from 4slt_article where article_id='" + article_id + "'";

        try {
            dBconnect.statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }
    }

    /**
     * 删除指定评论
     * @param message_id
     */
    @Override
    public void DeleteMessage(int message_id) {
        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        String sql = "delete from user_message where user_id='" + message_id + "'";

        try {
            dBconnect.statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }
    }

    /**
     * 删除sorts,用于更新关键字列表
     */
    @Override
    public void TruncateSorts() {
        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        String sql="truncate table 4slt_sorts";

       try {
            dBconnect.statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }
    }


    /**
     *更新文章
     * @param articleID
     * @param title
     * @param content
     * @param keywords
     * @param picture
     */
    @Override
    public void UpdateArticle(int articleID,String title, String content, String keywords, String picture) {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        String sql = "UPDATE 4slt_article SET article_title='"+title+"',article_content='"+content+"'," +
                "article_keywords='"+keywords+"',picture_url='"+picture+"' WHERE article_id="+articleID+"";

        try {
            dBconnect.statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }

    }


    @Override
    public List<Article> searchArticles() {

        String sql = "select * from 4slt_article";

        DBvalue_article dbvalue_article = new DBvalue_article(sql);
        return dbvalue_article.getArticleList();
    }

    /**
     * 根据article_id查找文章
     *
     * @param index
     * @return
     */
    @Override
    public Article searchArticle(int index) {
        String sql = "SELECT * FROM 4slt_article WHERE article_id in (" + index + ")";
        DBvalue_article dBvalue_article = new DBvalue_article(sql);

        return dBvalue_article.getArticle();
    }

    /**
     * 查找所有留言
     * @return
     */
    @Override
    public List<Message> searchMessage() {
        DBvalue_message dBvalue_message=new DBvalue_message();
        return dBvalue_message.getMessageList();
    }


}
