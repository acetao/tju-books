<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head profile="http://gmpg.org/xfn/11">
<title>天津大学图书交流平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<link rel="stylesheet" href="styles/common.css" type="text/css" />  <!-- 来自二手书网站的common css-->
<!--全局性的js脚本-->
<script type="text/javascript" src="{path}/scripts/global.js"></script>

<!-- 在此处自定义当前页面的css-->
<link rel="stylesheet" href="styles/login.css" type="text/css" />
<!-- 在此处定义当前页的脚本文件-->

</head>

<body >
<%@ include file="col1.jsp" %>
<%@ include file="col2.jsp" %>
<%@ include file="col3.jsp" %>

<div class="wrapper col5">
     <div id="title">用户登录</div>
    <div id="logInContent">
        <form id="userLoginForm" method="post" action="${path}/userLogin.action">
            <div class="eachInfo">账号：<input type="text" name="username" class="eachInput"/></div>
            <div class="eachInfo">密码：<input type="password" name="password"  class="eachInput" /></div>
            <input type="submit" value="登录" id="submitBtn"/><tr>
        </form>
    </div>
    <br class="clear" />
</div>

<%@ include file="col6.jsp" %>
<%@ include file="col7.jsp" %>
</body>

</html>

