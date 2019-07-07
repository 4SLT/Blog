package _4slt.dao;

import _4slt.entity.Article;

import java.sql.SQLException;
import java.util.List;

public class BaseDao implements BaseDB {

    /**
     * 根据keywords查找文章，用于搜索栏
     *
     * @param key
     * @return
     */
    @Override
    public List<Article> searchArticle(String key) {

        String sql = "SELECT * FROM 4slt_article WHERE article_keywords like '%" + key + "%'";

        DBvalue_article dBvalue_article = new DBvalue_article(sql);

        return dBvalue_article.getArticleList();

    }


    /**
     * 根据index查找文章，用于标签
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
     * 返回数据库中所有文章的对象
     *
     * @return
     */
    @Override
    public List<Article> searchArticles() {

        String sql = "select * from 4slt_article order by article_id desc";

        DBvalue_article dbvalue_article = new DBvalue_article(sql);

        return dbvalue_article.getArticleList();
    }

    /**
     * 按评论数排序所有文章(暂时为文章访问量)
     *
     * @return
     */
    @Override
    public Article[] searchArticleByComments() {
        String sql = "select * from 4slt_article order by article_comments desc";

        DBvalue_article dbvalue_article = new DBvalue_article(sql);

        return dbvalue_article.getArticles();
    }

    /**
     * 返回数据库中所有文章分类
     *
     * @return
     */
    @Override
    public List<String> searchKeywords() {

        DBvalue_keywords dBvalue_keywords = new DBvalue_keywords();

        return dBvalue_keywords.getKeywordList();

    }


    /**
     * 查询网站访问量
     *
     * @return
     */
    @Override
    public int searchCount() {
        DBvalue_visits dBvalue_visits = new DBvalue_visits();
        return dBvalue_visits.getCount();
    }

    /**
     * 查询网站今日访问量
     *
     * @return
     */
    @Override
    public int searchCountToday() {
        DBvalue_visits dBvalue_visits = new DBvalue_visits();
        return dBvalue_visits.getCountToday();
    }


    /**
     * 查询指定文章ID的访问量comments
     *
     * @return
     */
    @Override
    public int searchArticleCount(int articleID) {
        BaseDao baseDao = new BaseDao();

        return baseDao.searchArticle(articleID).getComments();
    }


    /**
     * 保存访问量(暂时没有用)
     */
    @Override
    public void saveCount(int count) {
        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        String sql = "insert into 4slt_visits(visit_count) values('" + count + "')";

        try {
            dBconnect.statement.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("访问量统计失败");
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }
    }


    /**
     * 修改4slt_visits中的visit_count（网站访问量）,自加1
     */
    @Override
    public void alterCount() {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        int count = new BaseDao().searchCount();
        count++;

        String sql = "update 4slt_visits set visit_count ='" + count + "' where visit_id = '1'";

        synchronized (BaseDao.class) {

            try {
                dBconnect.statement.executeUpdate(sql);
            } catch (SQLException e) {
                System.out.println("修改网站访问量失败");
                e.printStackTrace();
            } finally {
                dBconnect.dbDisconnect();

            }

        }
    }

    /**
     * 今日访问量自加1
     */
    @Override
    public void alterCountToday() {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        int count = new DBvalue_visits().getCountToday();
        count++;

        String sql = "update 4slt_visits set visit_count ='" + count + "' where visit_id = '2'";

        synchronized (BaseDao.class) {

            try {
                dBconnect.statement.executeUpdate(sql);
            } catch (SQLException e) {
                System.out.println("修改今日访问量失败");
                e.printStackTrace();
            } finally {
                dBconnect.dbDisconnect();

            }

        }

    }

    /**
     * 每天定时复位访问量
     */
    @Override
    public void resetCountToday() {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        String sql = "update 4slt_visits set visit_count ='0' where visit_id = '2'";

        try {
            dBconnect.statement.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("重置今日访问量失败");
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }

    }


    /**
     * 修改文章的访问量，自加1
     */
    @Override
    public void alterArticleCount(int articleID) {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        int count = new BaseDao().searchArticleCount(articleID);

        count = count + 1;

        String sql = "update 4slt_article set article_comments='" + count + "' where article_id='" + articleID + "'";

        try {
            dBconnect.statement.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("修改文章访问量失败");
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }

    }


    /**
     * 用于保存读者来信
     *
     * @param name
     * @param mail
     * @param message
     */
    @Override
    public void saveUserMessage(String name, String mail, String message, String date) {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        String sql = "INSERT INTO user_message(user_name,user_mail,user_message,user_date) " +
                "VALUES ('" + name + "','" + mail + "','" + message + "','" + date + "');";

        try {
            dBconnect.statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }

    }


}
