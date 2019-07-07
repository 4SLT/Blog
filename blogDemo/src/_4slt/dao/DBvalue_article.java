package _4slt.dao;

import _4slt.entity.Article;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBvalue_article {

    private int id;
    private String title;
    private String author;
    private String content;
    private String keywords;
    private String date;
    private String picture;
    private int comments;

    private Article article;
    private List<Article> articleList = new ArrayList<>();
    private Article[] articles;
    private int size;


    public DBvalue_article() {
    }

    public DBvalue_article(String sql) {
        this.init(sql);
    }


    public void init(String sql) {

        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        try {
            dBconnect.resultSet = dBconnect.statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            while (dBconnect.resultSet.next()) {

                id = dBconnect.resultSet.getInt("article_id");
                title = dBconnect.resultSet.getString("article_title");
                author = dBconnect.resultSet.getString("article_author");
                content = dBconnect.resultSet.getString("article_content");
                keywords = dBconnect.resultSet.getString("article_keywords");
                date = dBconnect.resultSet.getString("article_date");
                picture = dBconnect.resultSet.getString("picture_url");
                comments = dBconnect.resultSet.getInt("article_comments");


                article = new Article();
                article.setId(String.valueOf(id));
                article.setTitle(title);
                article.setAuthor(author);
                article.setContent(content);
                article.setKeywords(keywords);
                article.setDate(date);
                article.setPicture_url(picture);
                article.setComments(comments);


                articleList.add(article);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }


        //将arrayList转换为数组
        size = articleList.size();
        articles = new Article[size];


        for (int i = 0; i < size; i++) {
            articles[i] = articleList.get(i);
        }


    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getKeywords() {
        return keywords;
    }

    public String getDate() {
        return date;
    }

    public String getPicture() {
        return picture;
    }

    public List<Article> getArticleList() {
        return articleList;
    }

    public Article[] getArticles() {
        return articles;
    }

    public int getSize() {
        return size;
    }

    public String getAuthor() {
        return author;
    }

    public Article getArticle() {
        return article;
    }

    public int getComments() {
        return comments;
    }
}
