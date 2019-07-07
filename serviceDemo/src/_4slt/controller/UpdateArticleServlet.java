package _4slt.controller;

import _4slt.dao.BaseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateArticleServlet")
public class UpdateArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //凡是从前台接收数据都必须加
        request.setCharacterEncoding("utf-8");

        int articleID = Integer.parseInt(request.getParameter("articleID"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String keywords = request.getParameter("keywords");
        String picture = request.getParameter("titlepic");

        BaseDao baseDao=new BaseDao();

        baseDao.TruncateSorts();
        baseDao.UpdateArticle(articleID,title,content,keywords,picture);

        request.getRequestDispatcher("/ReFreshKeywordServlet").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
