package _4slt.controller;

/**
 * 接收add-article.html页面表单发送的内容，进行处理并存入数据库
 */

import _4slt.dao.BaseDao;
import com.sun.org.apache.xerces.internal.impl.io.UTF8Reader;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class AddContentServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        //凡是从前台接收数据都必须加
        request.setCharacterEncoding("utf-8");


        String title = request.getParameter("title");
        String author=request.getParameter("author");
        String content = request.getParameter("content");
        String keywords = request.getParameter("keywords");
        String pricture = request.getParameter("titlepic");
        Date dateTime = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String date = simpleDateFormat.format(dateTime);

        new BaseDao().saveArticle(title,author, content, keywords, date, pricture);

        request.getRequestDispatcher("/AddKeywordServlet").forward(request,response);

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        this.doPost(request, response);
    }
}
