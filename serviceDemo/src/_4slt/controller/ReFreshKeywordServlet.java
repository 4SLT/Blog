package _4slt.controller;

import _4slt.dao.BaseDao;
import _4slt.dao.DBvalue_keywords;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReFreshKeywordServlet")
public class ReFreshKeywordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DBvalue_keywords dBvalue_keywords=new DBvalue_keywords();
        BaseDao baseDao=new BaseDao();
        baseDao.saveKeywords(dBvalue_keywords.getKeywordList());

        request.getRequestDispatcher("/article.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
