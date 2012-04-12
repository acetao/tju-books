<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
  <h3>用户登录</h3>
<s:form action="user!login.action" namespace="/" >
<s:textfield name="username" label=" 账号"/>
<s:textfield name="password" label=" 密码" />
<s:submit value="登录"/>
</s:form>
  </body>
</html>
