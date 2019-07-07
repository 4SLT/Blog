<%@ page import="_4slt.dao.BaseDao" %>
<%@ page import="_4slt.entity.Message" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Bear
  Date: 2018/9/25
  Time: 0:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page
        contentType="text/html;charset=UTF-8"
        language="java"
        pageEncoding="UTF-8"
%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=utf-8");
    BaseDao baseDao = new BaseDao();
    List<Message> messageList = baseDao.searchMessage();
%>

<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>留言 - 粽子博客管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
    <link rel="shortcut icon" href="images/icon/favicon.ico">
    <script src="js/jquery-2.1.4.min.js"></script>
    <!--[if gte IE 9]>
    <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="js/html5shiv.min.js" type="text/javascript"></script>
    <script src="js/respond.min.js" type="text/javascript"></script>
    <script src="js/selectivizr-min.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href = 'upgrade-browser.html';</script>
    <![endif]-->
</head>

<body class="user-select">
<section class="container-fluid">

    <%--顶部导航栏--%>
    <header>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false"><span
                            class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                        <span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="/">YlsatCMS</a></div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="">消息 <span class="badge">1</span></a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                aria-haspopup="true" aria-expanded="false">admin <span
                                class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
                            </ul>
                        </li>
                        <li><a href="login.html" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
                        <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
                    </ul>
                    <form action="" method="post" class="navbar-form navbar-right" role="search">
                        <div class="input-group">
                            <input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索"
                                   maxlength="15">
                            <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
              </span></div>
                    </form>
                </div>
            </div>
        </nav>
    </header>

    <div class="row">
        <!--左侧导航栏-->
        <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="index.html">报告</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="article.jsp">文章</a></li>
                <li><a href="comment.html">评论</a></li>
                <li class="active"><a href="notice.html">留言</a></li>
            </ul>

            <ul class="nav nav-sidebar">
                <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">用户</a>
                    <ul class="dropdown-menu" aria-labelledby="userMenu">
                        <li><a href="manage-user.html">管理用户</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="loginlog.html">管理登录日志</a></li>
                    </ul>
                </li>
            </ul>
        </aside>

        <!--具体内容-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <form action="/Article/checkAll" method="post">
                <h1 class="page-header">管理 <span class="badge">3</span></h1>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">

                        <thead>
                        <tr>
                            <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span>
                            </th>
                            <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">留言</span></th>
                            <th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">用户</span></th>
                            <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                            <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                        </tr>
                        </thead>

                        <tbody>
                        <%

                            for (Message message : messageList) {
                                if (!message.getMessage().contains("null")) {
                        %>
                        <tr>
                            <td><input type="checkbox" class="input-control" name="checkbox[]" value=""/></td>
                            <td class="article-title">
                                <%=message.getMessage()%>
                            </td>
                            <td>
                                <%=message.getName()%>
                            </td>
                            <td>
                                <%=message.getDate()%>
                            </td>
                            <td>
                                <a data-toggle="modal" data-target="#seeMessageInfo">查看</a>
                                <a href="/serviceDemo/DeleteMessageServlet?messageID=<%=message.getId()%>">删除</a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>

                <footer class="message_footer">
                    <nav>
                        <div class="btn-toolbar operation" role="toolbar">
                            <div class="btn-group" role="group"><a class="btn btn-default" onClick="select()">全选</a> <a
                                    class="btn btn-default" onClick="reverse()">反选</a> <a class="btn btn-default"
                                                                                          onClick="noselect()">不选</a>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-default" data-toggle="tooltip"
                                        data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除
                                </button>
                            </div>
                        </div>
                        <ul class="pagination pagenav">
                            <li class="disabled"><a aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a>
                            </li>
                            <li class="active"><a>1</a></li>
                            <li class="disabled"><a aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a></li>
                        </ul>
                    </nav>
                </footer>
            </form>
        </div>
    </div>
</section>

<!--留言信息模态框-->
<div class="modal fade" id="seeMessageInfo" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">留言详情</h4>
            </div>
            <div class="modal-body">
                <table class="table" style="margin-bottom:0px;">
                    <thead>
                    <tr></tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td wdith="20%">用户:</td>
                        <td width="80%"><input type="text" value="" class="form-control"
                                               name="truename"
                                               maxlength="10" autocomplete="off"/></td>
                    </tr>
                    <tr>
                        <td wdith="20%">邮箱:</td>
                        <td width="80%"><input type="text" value="" class="form-control"
                                               name="username"
                                               maxlength="10" autocomplete="off"/></td>
                    </tr>
                    <tr>
                        <td wdith="20%">留言:</td>
                        <td width="80%"><input type="text" value=""
                                               class="form-control" name="usertel"
                                               maxlength="13" autocomplete="off"/></td>
                    </tr>
                    </tbody>

                    <tfoot>
                    <tr></tr>
                    </tfoot>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<script src="js/bootstrap.min.js"></script>
<script src="js/admin-scripts.js"></script>
<script>
    //是否确认删除
    $(function () {
        $("#main table tbody tr td a").click(function () {
            var name = $(this);
            var id = name.attr("rel"); //对应id
            if (event.srcElement.outerText == "删除") {
                if (window.confirm("此操作不可逆，是否确认？")) {
                    $.ajax({
                        type: "POST",
                        url: "/Article/delete",
                        data: "id=" + id,
                        cache: false, //不缓存此页面
                        success: function (data) {
                            window.location.reload();
                        }
                    });
                }
                ;
            }
            ;
        });
    });
</script>
</body>
</html>

