package _4slt.dao;

import _4slt.entity.Message;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBvalue_message {

    private int id;
    private String name;
    private String mail;
    private String content;
    private String date;

    private Message message;
    private List<Message> messageList = new ArrayList<>();

    public DBvalue_message() {
        this.init();

    }

    public void init() {
        DBconnect dBconnect = new DBconnect();
        dBconnect.dbConnect();

        try {
            String sql = "SELECT * FROM user_message";
            dBconnect.resultSet = dBconnect.statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            while (dBconnect.resultSet.next()) {

                id = dBconnect.resultSet.getInt("user_id");
                name = dBconnect.resultSet.getString("user_name");
                mail = dBconnect.resultSet.getString("user_mail");
                content = dBconnect.resultSet.getString("user_message");
                date = dBconnect.resultSet.getString("user_date");

                message=new Message();
                message.setId(id);
                message.setName(name);
                message.setMail(mail);
                message.setMessage(content);
                message.setDate(date);

                messageList.add(message);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBconnect.dbDisconnect();
        }
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public List<Message> getMessageList() {
        return messageList;
    }

    public void setMessageList(List<Message> messageList) {
        this.messageList = messageList;
    }
}
