<%@ page import="_4slt.dao.BaseDao" %>
<%@ page import="_4slt.entity.Article" %><%--
  Created by IntelliJ IDEA.
  User: Bear
  Date: 2018/9/24
  Time: 2:41
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

    String article_ID = request.getParameter("articleID");
    int articleID = Integer.parseInt(article_ID);

    BaseDao baseDao = new BaseDao();

    Article article = baseDao.searchArticle(articleID);

%>

<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章修改 - 粽子博客管理系统</title>
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

    <!--顶部导航栏-->
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
                <li class="active"><a href="article.jsp">文章</a></li>
                <li><a href="comment.html">评论</a></li>
                <li><a href="notice.html">留言</a></li>
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
            <div class="row">
                <form action="/serviceDemo/UpdateArticleServlet" method="post" class="add-article-form">

                    <input type="hidden" name="articleID" value="<%=article.getId()%>">

                    <div class="col-md-9">
                        <h1 class="page-header">文章修改</h1>
                        <div class="form-group">
                            <label for="article-title" class="sr-only">标题</label>
                            <input type="text" id="article-title" name="title" class="form-control"
                                   placeholder="在此处输入标题" value="<%=article.getTitle()%>" required autofocus
                                   autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="article-content" class="sr-only">内容</label>
                            <script id="article-content" name="content" type="text/plain"><%=article.getContent()%>
                            </script>
                        </div>

                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>描述</span></h2>
                            <div class="add-article-box-content">
                                <textarea class="form-control" name="describe" autocomplete="off"></textarea>
                                <span class="prompt-text">描述是可选的手工创建的内容总结，并可以在网页描述中使用</span>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-3">
                        <h1 class="page-header">操作</h1>

                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>标签</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" class="form-control" placeholder="请输入标签"
                                       value="<%=article.getKeywords()%>"
                                       name="keywords" autocomplete="off">
                                <span class="prompt-text">多个标签请用英文逗号,隔开。</span>
                            </div>
                        </div>

                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>标题图片</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" class="form-control" placeholder="图片URL"
                                       value="<%=article.getPicture_url()%>"
                                       id="pictureUpload"
                                       name="titlepic" autocomplete="off">
                            </div>
                            <!--<div class="add-article-box-footer">-->
                            <!--<button class="btn btn-default" type="button" ID="upImage">选择</button>-->
                            <!--</div>-->
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>发布</span></h2>
                            <div class="add-article-box-content">
                                <p><label>状态：</label><span class="article-status-display">已发布</span></p>
                                <p><label>公开度：</label><input type="radio" name="visibility" value="0" checked/>公开 <input
                                        type="radio" name="visibility" value="1"/>加密</p>

                            </div>
                            <div class="add-article-box-footer">
                                <button class="btn btn-primary" type="submit" name="submit">更新</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


<script src="js/bootstrap.min.js"></script>
<script src="js/admin-scripts.js"></script>
<script src="lib/ueditor/ueditor.config.js"></script>
<script src="lib/ueditor/ueditor.all.min.js"></script>
<script src="lib/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var editor = UE.getEditor('article-content');
    window.onresize = function () {
        window.location.reload();
    }
    var _uploadEditor;
    $(function () {
        //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
        _uploadEditor = UE.getEditor('uploadEditor');
        _uploadEditor.ready(function () {
            //设置编辑器不可用
            //_uploadEditor.setDisabled();
            //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
            _uploadEditor.hide();
            //侦听图片上传
            _uploadEditor.addListener('beforeInsertImage', function (t, arg) {
                //将地址赋值给相应的input,只去第一张图片的路径
                $("#pictureUpload").attr("value", arg[0].src);
                //图片预览
                //$("#imgPreview").attr("src", arg[0].src);
            })
            //侦听文件上传，取上传文件列表中第一个上传的文件的路径
            _uploadEditor.addListener('afterUpfile', function (t, arg) {
                $("#fileUpload").attr("value", _uploadEditor.options.filePath + arg[0].url);
            })
        });
    });
    //弹出图片上传的对话框
    $('#upImage').click(function () {
        var myImage = _uploadEditor.getDialog("insertimage");
        myImage.open();
    });

    //弹出文件上传的对话框
    function upFiles() {
        var myFiles = _uploadEditor.getDialog("attachment");
        myFiles.open();
    }
</script>
</body>
</html>