<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head profile="http://gmpg.org/xfn/11">
<title>sc.chinaz.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<link rel="stylesheet" href="styles/iframe-content.css" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery.jcarousel.setup.js"></script>


  <script>
    function submitForm(myCurrentPage){
		var currentPage =  document.getElementById("currentPage");
		currentPage.value = myCurrentPage;
		var form = document.getElementById("searchForm");
		form.submit();
	};
  </script>

</head>
<body id="top">
<div class="wrapper col1">
  <div id="topbar">
    <ul>
      <li>您好！<a href="#">退出</a></li>
      <li><a href="#">个人中心</a></li>
      <li><a href="#">关于我们</a></li>
<!--      <li class="last"><a href="#">移动版</a></li>-->
    </ul>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="header">
    <div class="fl_left">
      <h1><a href="#">天津大学图书交易平台</a></h1>
    </div>
    <div class="fl_right"> 
    	<form id="searchForm" method="post" action="${path}/searchBook.action">
        	<!--<input type="text" name="search_entry" style=" height:27px; width:300px;float:left;"/>-->
           <!-- <img src="images/search-btn1.png" onclick="submitForm(1)" style="background-color:#FFF;float:left;" />-->
            <label for="keyWords"></label>
      		<input type="text" name="keyWords" id="keyWords" value="${requestScope.keyWords}" style=" height:27px; width:300px;float:left;"/>
      		<input type="hidden" name="currentPage" id="currentPage" value="1" />
            <input type="submit" style="background-image:url(images/blue-search-btn.png); height:32px; width:55px;" value=""/>
        </form> 
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="topnav">
    <ul>
      <li class="active"><a href="index.jsp">首页</a></li>
      <li><a href="style-demo.html">发布书籍</a></li>
      <li><a href="full-width.html">贵求书</a></li>
<!--      <li><a href="#">DropDown</a><span>Test Text Here</span>
        <ul>
          <li><a href="#">Link 1</a></li>
          <li><a href="#">Link 2</a></li>
          <li><a href="#">Link 3</a></li>
        </ul>
      </li>
      <li class="last"><a href="#">Link text</a><span>Test Text Here</span></li>-->
    </ul>
    <br class="clear" />
  </div>
</div>

<div class="wrapper col5">
  <div id="container">
    
    <div id="column">
      <div class="holder">
        <h2>瞧瞧书目</h2>
        <ul id="latestnews">
          <li><a href="#" target="content">教科书</a></li>
          <li><a href="#" target="content">专业书籍</a></li>
          <li><a href="#" target="content">考试、出国</a></li>
          <li><a href="#" target="content">文学、历史</a></li>
          <li><a href="#" target="content">哲学、艺术</a></li>
          <li class="last"><a href="#" target="content">其他书籍</a></li>
        </ul>
      </div>
      
    </div>
    <div id="content">
      <!-- iframe name="content" src="iframe-content.jsp" width="100%" scrolling="no" frameborder="0">
      </iframe> -->
       	<div class="all">
           	<c:forEach items="${sessionScope.pageBean.data}" var="book">
            	<div class="book">
            	  <a href="${path}/bookDetail.action?bookId=${book.bookid}"><img class="book" src="${path}/image.action?imageId=${book.bookimage.imageId}" alt="书籍的图片" /></a><br />
                  ${book.bookname}<br />
                  ${book.author}<br /><br />
                  <div style="color:red;" ><strong>价格：￥${book.price}</strong></div>
            	</div>
            </c:forEach>
    	</div>
    </div>
    <div style="float:right; padding-right:10px; font-size:20px; margin-top:50px;">请选择：
      <c:forEach var="i" begin="1" end="${sessionScope.pageBean.totalPages}">
      <c:if test="${sessionScope.pageBean.currentPage == i}">
      [${i}]&nbsp;
      </c:if>
      <c:if test="${sessionScope.pageBean.currentPage != i}">
        <a href="#" onClick="submitForm(${i});">${i}&nbsp;</a>
      </c:if>
      </c:forEach>页
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="footer">
    <div class="footbox">
      <h2>校内网站</h2>
      <ul>
        <li><a href="http://www.lib.tju.edu.cn/">图书馆</a></li>
        <li><a href="http://e.tju.edu.cn">办公网</a></li>
        <li><a href="http://www.twt.edu.cn/">天外天</a></li>
        <li><a href="http://bbs.tju.edu.cn/">求实BBS</a></li>
<!--        <li class="last"><a href="http://nc.tju.edu.cn/">网络中心</a></li>-->
      </ul>
    </div>
    <div class="footbox">
      <h2>购书网站</h2>
      <ul>
        <li><a href="#">京东360</a></li>
        <li><a href="#">亚马逊</a></li>
        <li><a href="#">当当网</a></li>
        <li><a href="#">淘宝网</a></li>
<!--        <li class="last"><a href="#">Praesent et eros</a></li>-->
      </ul>
    </div>
    <div class="footbox">
      <h2>书评网站</h2>
      <ul>
        <li><a href="#">豆瓣读书</a></li>
        <li><a href="#">腾讯读书</a></li>
        <li><a href="#">网易读书</a></li>
        <li><a href="#">天涯书库</a></li>
      </ul>
    </div>
<!--    <div class="footbox">
      <h2>Lacus interdum</h2>
      <ul>
        <li><a href="#">Praesent et eros</a></li>
        <li><a href="#">Praesent et eros</a></li>
        <li><a href="#">Lorem ipsum dolor</a></li>
        <li><a href="#">Suspendisse in neque</a></li>
      </ul>
    </div>-->
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col7">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2011 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a href="http://sc.chinaz.com/" title="Free Website Templates">sc.chinaz.com</a></p>
    <br class="clear" />
  </div>
</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>
</html>

