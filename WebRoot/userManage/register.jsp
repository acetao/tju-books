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
  <h3>用户注册</h3>
<s:form action="user!register.action" namespace="/" >
<s:textfield name="username" label=" 账号"/>
<s:textfield name="password" label=" 密码" />
<s:textfield name="gender" label=" 性别"/>
<s:textfield name="college" label=" 学院" />
<s:textfield name="marjor" label=" 专业"/>
<s:textfield name="grade" label=" 年级" />
<s:textfield name="email" label=" Email"/>
<s:textfield name="qq" label=" QQ" />
<s:textfield name="cellphone" label=" 手机号" />
<s:submit value="注册"/>
</s:form>
  </body>
</html>
