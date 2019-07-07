<%@ page import="_4slt.entity.Article" %>
<%@ page import="_4slt.dao.BaseDao" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Bear
  Date: 2018/9/17
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         pageEncoding="UTF-8"
%>

<%
    request.setCharacterEncoding("UTF-8");
    String sortID = request.getParameter("sortID");
    String pathname;
    BaseDao baseDao = new BaseDao();
    List<Article> articleList;
    if (sortID != null) {
        pathname = sortID;
        articleList = baseDao.searchArticle(sortID);
    } else {
        pathname = "searching...";
        articleList = (List<Article>) request.getAttribute("searchresult");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>文章列表—粽子的博客</title>
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
                <a href="#"><%=sortID%>
                </a>
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
                <div class="row">

                    <%
                        response.setContentType("text/html;charset=utf-8");

                        for (Article article : articleList) {
                    %>

                    <div class="col-md-6 col-sm-6">
                        <article class=" blog-teaser">
                            <header>
                                <h3>
                                    <a href="single.jsp?articleID=<%=article.getId()%>">
                                        <img src="img/<%=article.getPicture_url()%>" alt="">
                                        <%=article.getTitle()%>
                                    </a>
                                </h3>
                                <span class="meta"><%=article.getDate() + " " + article.getAuthor()%></span>
                                <hr>
                            </header>
                        </article>
                    </div>

                    <%
                        }
                    %>

                </div>
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
                                    if (!keywordList.get(i).equals("null")&&!keywordList.get(i).contains("null")) {
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

