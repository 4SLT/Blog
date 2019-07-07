package _4slt.dao;

import _4slt.entity.Article;
import _4slt.entity.Message;

import java.util.List;

public interface BaseDB {

    //增
    public void saveArticle(String title, String author, String content, String keywords, String date, String picture);

    public void saveKeywords(String[] keywordlist);


    //删
    public void DeleteArticle(int article_id);
    public void DeleteMessage(int message_id);
    public void TruncateSorts();

    //改
    public void UpdateArticle(int articleID, String title, String content, String keywords, String picture);

    //查
    public List<Article> searchArticles();
    public Article searchArticle(int index);
    public List<Message> searchMessage();


}
