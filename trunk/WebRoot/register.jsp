<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="styles/register.css" type="text/css" />
<link rel="stylesheet" href="${path}/styles/iframe-content.css" type="text/css" />
<script type="text/javascript" src="${path}/scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="${path}/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="${path}/scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${path}/scripts/jquery.jcarousel.setup.js"></script>
<script type="text/javascript" src="${path}/scripts/jquery-1.7.2.js"></script>

  <script>
    function submitForm(myCurrentPage){
		var currentPage =  document.getElementById("currentPage");
		currentPage.value = myCurrentPage;
		var form = document.getElementById("searchForm");
		form.submit();
	};
  </script>

</head>

<body>
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
      		<input type="hidden" name="currentPage" id="currentPage" value="1" />&nbsp;
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
      <li><a href="${path}/AddBookAction.action">发布书籍</a></li>
      <li><a href="full-width.html">贵求书</a></li>
    </ul>
    <br class="clear" />
  </div>
</div>

<div class="wrapper col5">
    <div id="registerContent">
  <h3 style="padding-left:300px; color:#000;">用户注册：</h3>
</form>
    	<form method="post" action="${path}/userRegister.action">
        	<div class="eachInfo odd"><span>昵称：</span><input type="text" name="username" class="publishInput"/></div>
            <div class="eachInfo even"><span>密码：</span><input type="password" name="password" class="publishInput" /></div>
            <div class="eachInfo odd"><span>重复密码：</span><input type="password" name="repassword" class="publishInput" /></div>
            <div class="eachInfo even"><span>性别：</span><input type="text" name="gender"  class="publishInput"/></div>
            <div class="eachInfo odd"><span>学院：</span><input type="text" name="college" class="publishInput"/></div>
            <div class="eachInfo even"><span>专业：</span><input type="text" name="marjor" class="publishInput" /></div>
            <div class="eachInfo odd"><span>年级：</span><input type="text" name="grade" class="publishInput" /></div>
            <div class="eachInfo even"><span>邮箱：</span><input type="text" name="email" class="publishInput" /></div>
            <div class="eachInfo odd"><span>QQ：</span><input type="text" name="qq" class="publishInput" /></div>
            <div class="eachInfo even"><span>联系电话：</span><input type="text" name="cellphone" class="publishInput" /></div>
            <div class="eachInfo odd" id="lastone"><input type="submit" value="注册" /></div>
            
        </form>
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
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>

</body>
</html>
