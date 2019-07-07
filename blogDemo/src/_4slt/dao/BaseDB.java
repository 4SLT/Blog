package _4slt.dao;

import _4slt.entity.Article;

import java.util.List;

public interface BaseDB {

    //增
    public void saveUserMessage(String name, String mail, String message, String date);

    public void saveCount(int count);


    //改
    public void alterCount();

    public void alterCountToday();

    public void resetCountToday();

    public void alterArticleCount(int articleID);


    //查
    public List<Article> searchArticle(String key);

    public Article searchArticle(int index);

    public List<Article> searchArticles();

    public Article[] searchArticleByComments();

    public List<String> searchKeywords();

    public int searchCount();

    public int searchCountToday();

    public int searchArticleCount(int articleID);
}
