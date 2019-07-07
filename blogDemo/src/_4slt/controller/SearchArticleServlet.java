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

@WebServlet(name = "SearchArticleServlet")
public class SearchArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //凡是从前台接收数据都必须加
        request.setCharacterEncoding("utf-8");

        String keyword = request.getParameter("searchbox");

        BaseDao baseDao = new BaseDao();
        List<Article> articleList = baseDao.searchArticle(keyword);

        request.setAttribute("searchresult", articleList);

        request.getRequestDispatcher("/list.jsp").forward(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
