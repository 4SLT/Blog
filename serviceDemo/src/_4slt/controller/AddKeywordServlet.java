package _4slt.controller;

import _4slt.dao.BaseDao;
import _4slt.dao.DBvalue_keywords;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddKeywordServlet")
public class AddKeywordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //凡是从前台接收数据都必须加
        request.setCharacterEncoding("utf-8");

        DBvalue_keywords dBvalue_keywords=new DBvalue_keywords();


        new BaseDao().saveKeywords(dBvalue_keywords.getKeywordList());

        request.getRequestDispatcher("/article.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
