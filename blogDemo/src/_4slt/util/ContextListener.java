package _4slt.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

public class ContextListener implements ServletContextListener {


    public ContextListener() {
    }

    private Timer timer = null;


    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        timer = new Timer(true);

        servletContextEvent.getServletContext().log("定时器已启动");

        //设置执行时间
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);//每天

        //每天的1:00:00执行，
        calendar.set(year, month, day, 01, 00, 00);

        //第一次执行任务的时间
        Date date = calendar.getTime();
        System.out.println("服务器部署时间："+date);

        //如果部署项目的时间晚于指定执行定时器时间，则第一次执行时间加一天
        if (date.before(new Date())) {
            date = this.addDay(date, 1);
        }

        System.out.println("执行定时任务时间："+date);

        int period = 24 * 60 * 60 * 1000;
        //每天的date时刻执行task，每隔persion 时间重复执行
        timer.schedule(new DeleteTimer(servletContextEvent.getServletContext()), date, period);


        servletContextEvent.getServletContext().log("已添加任务调度");

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

        timer.cancel();

        servletContextEvent.getServletContext().log("定时器已销毁");

    }

    //当前时间增加或者减少一天
    public Date addDay(Date date, int num) {
        Calendar startDT = Calendar.getInstance();
        startDT.setTime(date);
        startDT.add(Calendar.DAY_OF_MONTH, num);
        return startDT.getTime();
    }


}
