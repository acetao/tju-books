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
	<a href="${path}user!userInfo.action">修改个人信息</a>
	<a href="${path}user!releasedBooks">已发布书籍</a>
	<a href="${path}/user!xxx.action">关注的书籍</a>
	<a href="${path}/user!xxx.action">求购的书籍</a>
	<a href="${path}/user!xxx.action">退出</a>
	<table>
	<tr>
	<td>账号:${requestScope.user.username}</td>
	</tr>
	<tr>
	<td>密码:${requestScope.user.password}</td>
	</tr>
	<tr>
	<td>性别:${requestScope.user.gender}</td>
	</tr>
	<tr>
	<td>学院:${requestScope.user.college}</td>
	</tr>
	<tr>
	<td>专业:${requestScope.user.marjor}</td>
	</tr>
	<tr>
	<td>年级:${requestScope.user.grade}</td>
	</tr>
	<tr>
	<td>Email:${requestScope.user.email}</td>
	</tr>
	<tr>
	<td>QQ:${requestScope.user.qq}</td>
	</tr>
	<tr>
	<td>手机号:${requestScope.user.cellphone}</td>
	</tr>
	</table>
  </body>
</html>
