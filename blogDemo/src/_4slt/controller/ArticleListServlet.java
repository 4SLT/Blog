package _4slt.controller;

import _4slt.dao.BaseDao;
import _4slt.entity.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ArticleListServlet")
public class ArticleListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //读取需要查看的文章
        BaseDao baseDao = new BaseDao();
//        Article article=baseDao.searchArticle("key");

        //显示到浏览器
        response.setContentType("text/html;charset=utf-8");

        List<Article> list = new BaseDao().searchArticles();



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
