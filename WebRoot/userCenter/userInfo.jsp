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
  ${path}
	<form id="user" name="user" action="${path}userCenter!updateUserInfo.action" method="post">
<input type="hidden" name="userid" value="${sessionScope.user.userid}"/>
<table class="wwFormTable">
<tr>
    <td class="tdLabel"><label for="user_username" class="label"> 账号:</label></td>
    <td
><input type="text" name="username" value="${sessionScope.user.username}" readonly="True" id="user_username"/></td>
</tr>

<tr>
    <td class="tdLabel"><label for="user_password" class="label"> 密码:</label></td>
    <td
><input type="text" name="password" value="${sessionScope.user.password}" id="user_password"/></td>
</tr>

<tr>
    <td class="tdLabel"><label for="user_gender" class="label"> 性别:</label></td>
    <td
><input type="text" name="gender" value="${sessionScope.user.gender}" id="user_gender"/></td>
</tr>

<tr>
    <td class="tdLabel"><label for="user_college" class="label"> 学院:</label></td>
    <td
><input type="text" name="college" value="${sessionScope.user.college}" id="user_college"/></td>
</tr>

<tr>
    <td class="tdLabel"><label for="user_marjor" class="label"> 专业:</label></td>
    <td
><input type="text" name="marjor" value="${sessionScope.user.marjor}" id="user_marjor"/></td>
</tr>

<tr>
    <td class="tdLabel"><label for="user_grade" class="label"> 年级:</label></td>
    <td
><input type="text" name="grade" value="${sessionScope.user.grade}" id="user_grade"/></td>
</tr>

<tr>
    <td class="tdLabel"><label for="user_email" class="label"> Email:</label></td>
    <td
><input type="text" name="email" value="${sessionScope.user.email}" id="user_email"/></td>
</tr>

<tr>
    <td class="tdLabel"><label for="user_qq" class="label"> QQ:</label></td>
    <td
><input type="text" name="qq" value="${sessionScope.user.qq}" id="user_qq"/></td>
</tr>

<tr>
    <td class="tdLabel"><label for="user_cellphone" class="label"> 手机号:</label></td>
    <td
><input type="text" name="cellphone" value="${sessionScope.user.cellphone}" id="user_cellphone"/></td>
</tr>

<tr>
    <td colspan="2"><div align="right"><input type="submit" id="user_0" value="保存"/>
</div></td>
</tr>

</table></form>
  </body>
</html>
