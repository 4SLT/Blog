<%@ page import="_4slt.dao.BaseDao" %>
<%@ page import="_4slt.entity.Article" %>
<%@ page import="java.util.List" %>

<%--
  Created by IntelliJ IDEA.
  User: Bear
  Date: 2018/9/14
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         pageEncoding="UTF-8"
%>

<%
    request.setCharacterEncoding("UTF-8");
    String article_ID = request.getParameter("articleID");
    int articleID = Integer.parseInt(article_ID);
    BaseDao baseDao = new BaseDao();
    Article article = baseDao.searchArticle(articleID);
%>

<%
    Cookie[] cookie = request.getCookies();
    Boolean hasCookie = false;

    for (int i = 0; i < cookie.length; i++) {
        if (cookie[i].getName().equals("ARTICLECOUNT" + article_ID)) {
            hasCookie = true;
            break;
        }
    }

    if (hasCookie == false) {
        Cookie cookie2 = new Cookie("ARTICLECOUNT" + article_ID, article_ID);

        cookie2.setMaxAge(60 * 60 * 2);//设置Cookie在浏览器上的生存时间为60s*60mins*1hour(2小时)
        baseDao.alterArticleCount(articleID);

        response.addCookie(cookie2);

    }

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>文章正文—粽子的博客</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font-Awesome -->
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">

    <!-- Google Webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic' rel='stylesheet'
          type='text/css'>

    <!-- Styles -->
    <link rel="stylesheet" href="css/style.css" id="theme-styles">

    <!--[if lt IE 9]>
    <script src="js/vendor/google/html5-3.6-respond-1.1.0.min.js"></script>
    <![endif]-->


</head>
<body>
<!--页眉-->
<header>
    <!--导航栏-->
    <div class="widewrapper masthead">
        <div class="container">
            <a href="index.jsp" id="logo">
                <img src="img/logo.png" alt="clean Blog">
            </a>

            <div id="mobile-nav-toggle" class="pull-right">
                <a href="#" data-toggle="collapse" data-target=".clean-nav .navbar-collapse">
                    <i class="fa fa-bars"></i>
                </a>
            </div>

            <nav class="pull-right clean-nav">
                <div class="collapse navbar-collapse">
                    <ul class="nav nav-pills navbar-nav">

                        <li>
                            <a href="index.jsp">首页</a>
                        </li>
                        <li>
                            <a href="about.html">关于</a>
                        </li>
                        <li>
                            <a href="contact.html">联系我</a>
                        </li>
                    </ul>
                </div>
            </nav>

        </div>
    </div>

    <!--路径栏-->
    <div class="widewrapper subheader">
        <div class="container">
            <div class="clean-breadcrumb">
                <a href="index.jsp">首页</a>
                <span class="separator">&#x2F;</span>
                <a href="#"><%=article.getKeywords()%>
                </a>
                <span class="separator">&#x2F;</span>
                <a href="#">文章正文</a>
            </div>

            <!--搜索栏-->
            <div class="clean-searchbox">
                <form action="/blogDemo/SearchArticleServlet" method="post" accept-charset="utf-8">

                    <input class="searchfield" name="searchbox" id="searchbox" type="text" placeholder="Search">
                    <button class="searchbutton" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</header>

<!--正文-->
<div class="widewrapper main">
    <div class="container">
        <div class="row">
            <div class="col-md-8 blog-main">
                <article class="blog-post">

                    <div class="body">
                        <h1><%=article.getTitle()%>
                        </h1>
                        <div class="meta">
                            <i class="fa fa-user"></i> <%=article.getAuthor()%> <i
                                class="fa fa-calendar"></i><%=article.getDate()%><i
                                class="fa fa-eye"></i></i><%=article.getComments()%></span>
                        </div>
                        <p><%=article.getContent()%>
                        </p>

                    </div>
                </article>

                <!--分享文章-->
                <aside class="social-icons clearfix">
                    <h3>分享 </h3>
                    <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a
                        href="#"><i class="fa fa-google"></i></a>
                </aside>

                <%--<!--评论区-->--%>
                <%--<aside class="comments" id="comments">--%>
                <%--<hr>--%>

                <%--<h2><i class="fa fa-comments"></i>评论区</h2>--%>


                <%--<!--评论-->--%>
                <%--<article class="comment">--%>
                <%--<header class="clearfix">--%>
                <%--<img src="img/avatar.png" alt="A Smart Guy" class="avatar">--%>
                <%--<div class="meta">--%>
                <%--<h3><a href="#">John Doe</a></h3>--%>
                <%--<span class="date">--%>
                <%--24 August 2017--%>
                <%--</span>--%>

                <%--<span class="separator">--%>
                <%-----%>
                <%--</span>--%>

                <%--<a href="#create-comment" class="reply-link">Reply</a>--%>
                <%--</div>--%>
                <%--</header>--%>
                <%--<div class="body">--%>
                <%--Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere sit perspiciatis debitis,--%>
                <%--vel ducimus praesentium expedita, assumenda ipsum cum corrupti dolorum modi. Rem ipsam--%>
                <%--similique sapiente obcaecati tenetur beatae voluptatibus.--%>
                <%--</div>--%>
                <%--</article>--%>


                <%--<!--回复-->--%>
                <%--<article class="comment reply">--%>
                <%--<header class="clearfix">--%>
                <%--<img src="img/avatar.png" alt="A Smart Guy" class="avatar">--%>
                <%--<div class="meta">--%>
                <%--<h3><a href="#">John Doe</a></h3>--%>
                <%--<span class="date">--%>
                <%--24 August 2017--%>
                <%--</span>--%>
                <%--<span class="separator">--%>
                <%-----%>
                <%--</span>--%>

                <%--<a href="#create-comment" class="reply-link">Reply</a>--%>

                <%--</div>--%>

                <%--</header>--%>
                <%--<div class="body">--%>
                <%--Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere sit perspiciatis debitis,--%>
                <%--vel ducimus praesentium expedita, assumenda ipsum cum corrupti dolorum modi. Rem ipsam--%>
                <%--similique sapiente obcaecati tenetur beatae voluptatibus.--%>
                <%--</div>--%>
                <%--</article>--%>


                <%--</aside>--%>

                <%--<!--添加评论-->--%>
                <%--<aside class="create-comment" id="create-comment">--%>
                <%--<hr>--%>

                <%--<h2><i class="fa fa-pencil"></i> Add Comment</h2>--%>

                <%--<form action="#" method="get" accept-charset="utf-8">--%>
                <%--<div class="row">--%>
                <%--<div class="col-md-6">--%>
                <%--<input type="text" name="name" id="comment-name" placeholder="Your Name"--%>
                <%--class="form-control input-lg">--%>
                <%--</div>--%>
                <%--<div class="col-md-6">--%>
                <%--<input type="email" name="email" id="comment-email" placeholder="Email"--%>
                <%--class="form-control input-lg">--%>
                <%--</div>--%>
                <%--</div>--%>

                <%--<input type="url" name="name" id="comment-url" placeholder="Website"--%>
                <%--class="form-control input-lg">--%>

                <%--<textarea rows="10" name="message" id="comment-body" placeholder="Your Message"--%>
                <%--class="form-control input-lg"></textarea>--%>

                <%--<div class="buttons clearfix">--%>
                <%--<button type="submit" class="btn btn-xlarge btn-clean-one">Submit</button>--%>
                <%--</div>--%>
                <%--</form>--%>
                <%--</aside>--%>


            </div>

            <!-- right -->
            <aside class="col-md-4 blog-aside">


                <div class="aside-widget">
                    <header>
                        <h3>标签</h3>
                    </header>
                    <div class="body clearfix">
                        <ul class="tags">

                            <%
                                response.setContentType("text/html;charset=utf-8");
                                List<String> keywordList = baseDao.searchKeywords();
                                for (int i = 0; i < keywordList.size(); ++i) {
                                    if (!keywordList.get(i).equals("null") && !keywordList.get(i).contains("null")) {
                            %>

                            <li>
                                <a href="list.jsp?sortID=<%=keywordList.get(i)%>"><%=keywordList.get(i)%>
                                </a>
                            </li>

                            <%
                                    }
                                }
                            %>

                        </ul>
                    </div>
                </div>


                <div class="aside-widget">
                    <header>
                        <h3>精选博客</h3>
                    </header>
                    <div class="body">
                        <ul class="clean-list">
                            <%
                                Article[] articleListByComments = baseDao.searchArticleByComments();

                                for (int i = 0; i < articleListByComments.length; ++i) {
                                    if (i < 5) {
                            %>
                            <li>
                                <a href="single.jsp?articleID=<%=articleListByComments[i].getId()%>"><%=articleListByComments[i].getTitle()%>
                                </a></li>
                            <%
                                    } else {
                                        break;
                                    }
                                }
                            %>


                        </ul>
                    </div>
                </div>


                <div class="aside-widget">
                    <header>
                        <h3>访问量</h3>
                    </header>
                    <div class="body">
                        <ul class="clean-list">
                            <li><a href="">网站总访问量：<%=baseDao.searchCount()%>次</a></li>
                            <li><a href="">今日访问量：<%=baseDao.searchCountToday()%>次</a></li>

                        </ul>
                    </div>
                </div>


            </aside>
        </div>
    </div>
</div>

<%--页脚--%>
<script src="js/foot.js"></script>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.js"></script>

</body>
</html>

