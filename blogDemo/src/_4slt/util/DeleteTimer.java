package _4slt.util;

import _4slt.dao.BaseDao;

import javax.servlet.ServletContext;
import java.util.TimerTask;

/**
 * 定时器，定时删除mysql的4slt_visits中id=2的visit_count(今日访问量)
 */
public class DeleteTimer extends TimerTask {

    private static boolean isRunning = false;

    private ServletContext context = null;

    public DeleteTimer() {
        super();
    }

    public DeleteTimer(ServletContext context) {
        this.context = context;
    }

    @Override
    public void run() {
        if (!isRunning) {

            context.log("开始执行指定任务");

            new BaseDao().resetCountToday();

            isRunning = false;
            context.log("指定任务执行结束");
        } else {
            context.log("上一次任务执行还未结束");
        }
    }
}
