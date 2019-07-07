package _4slt.controller;

import _4slt.dao.BaseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "SaveMessageServlet")
public class SaveMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //凡是从前台接收数据都必须加
        request.setCharacterEncoding("utf-8");

        String name = request.getParameter("name");
        String mail=request.getParameter("email");
        String message=request.getParameter("message");
        Date dateTime = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String date = simpleDateFormat.format(dateTime);

        new BaseDao().saveUserMessage(name,mail,message,date);

        request.getRequestDispatcher("/contact.html").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doPost(request,response);

    }
}
