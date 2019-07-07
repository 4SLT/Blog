<%@ page import="_4slt.dao.BaseDao" %>
<%@ page import="_4slt.entity.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="_4slt.dao.DBvalue_visits" %>

<%--
  Created by IntelliJ IDEA.
  User: Bear
  Date: 2018/9/6
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page
        contentType="text/html;charset=UTF-8"
        language="java"
        pageEncoding="UTF-8"
%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    Cookie[] cookie = request.getCookies();
/**
 *
 */
    BaseDao baseDao = new BaseDao();
    Boolean hasCookie = false;
    int visit = baseDao.searchCount();
    if (cookie != null) {
        for (int i = 0; i < cookie.length; i++) {
            if (cookie[i].getName().equals("INDEXCOUNT")) {
                hasCookie = true;
                break;
            }
        }
    }

    if (hasCookie == false) {
        visit++;
        Cookie cookie2 = new Cookie("INDEXCOUNT", visit + "");
        cookie2.setMaxAge(60 * 60 * 2);//设置Cookie在浏览器上的生存时间为60s*60mins*1hour(2小时)
        response.addCookie(cookie2);
        baseDao.alterCount();
        baseDao.alterCountToday();

    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>首页—粽子的博客</title>
    <meta name="keywords" content="java,粽子的博客">
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
    <script src="js/respond.js"></script>
    <![endif]-->

</head>

<body>
<!-- 页眉 -->
<header>
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


            <!--nav、导航链接的容器-->
            <nav class="pull-right clean-nav">
                <div class="collapse navbar-collapse">
                    <ul class="nav nav-pills navbar-nav">

                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="about.html">About</a>
                        </li>
                        <li>
                            <a href="contact.html">Contact</a>
                        </li>
                    </ul>
                </div>
            </nav>

        </div>
    </div>

    <!-- 路径栏 -->
    <div class="widewrapper subheader">
        <div class="container">
            <div class="clean-breadcrumb">
                <a>粽子的博客</a>
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

<!-- 主体 -->
<div class="widewrapper main">
    <div class="container">
        <div class="row">
            <!-- left -->
            <div class="col-md-8 blog-main">
                <div class="row">

                    <%
                        response.setContentType("text/html;charset=utf-8");
                        List<Article> articleList = baseDao.searchArticles();

                        for (Article article : articleList) {
                            if (!article.getTitle().contains("null")) {
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
                        }
                    %>

                </div>

                <%--暂时无此功能--%>
                <%--<div class="paging">--%>
                <%--<a href="#" class="older">更多</a>--%>
                <%--</div>--%>
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

<!-- 页脚 -->
<footer>
    <div class="widewrapper footer">
        <div class="container">
            <div class="row">


                <div class="col-md-4 footer-widget">
                    <h3><i class="fa fa-pencil"></i> 关于博客</h3>
                    <p>_4SLT,意为for somebody like thinking。该博客为本人练习所写项目，目前在不断完善已有的功能且增加一些必要的新功能。
                        我会不定期地在博客上分享一些好的文章以及本人的一些学习笔记，欢迎读者提出自己的想法与我一起讨论，一起提高。
                    </p>

                </div>


                <div class="col-md-4 footer-widget">
                    <h3><i class="fa fa-user"></i>关于作者</h3>

                    <p>本人为一名大四学生，非计算机专业，自学Java及相关计算机知识。
                        本站上发表的所有原创文章仅为个人见解，本人也将尽量保证文章的正确性，如果有读者发现
                        文章的不当之处欢迎指出。
                    </p>
                </div>


                <div class="col-md-4 footer-widget">
                    <h3><i class="fa fa-envelope"></i>联系我</h3>

                    <p>如果有读者对该博客感兴趣或者有任何意见及建议的，欢迎通过网站的“<a href="contact.html">联系我</a>”一起探讨。</p>
                    <br>
                    <p>email：805584988@qq.com</p>
                    <p>微信：lzx---2222</p>


                </div>


            </div>
        </div>
    </div>
    <div class="widewrapper copyright">
        版权所有 &copy; 2018 林宗雄 如需转载作者原创文章请标注出处<a href="http://118.25.65.93">www.linzongxiong.com</a>
        <br>
        闽ICP备18021630号-1
    </div>
</footer>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.js"></script>

</body>
</html>