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
  <h3>${sessionScope.user.username}的个人中心</h3>
	<a href="${path}userCenter!userInfo.action">账户信息</a>
	<a href="${path}userCenter!searchReleasedBooks.action">已发布书籍</a>
	<a href="${path}userCenter!searchAttentionBooks.action">关注的书籍</a>
	<a href="${path}/user!xxx.action">求购的书籍</a>
	<a href="${path}/user!xxx.action">退出</a>
	<table>
	<tr>
	<td>账号:${sessionScope.user.username}</td>
	</tr>
	<tr>
	<td>密码:${sessionScope.user.password}</td>
	</tr>
	<tr>
	<td>性别:${sessionScope.user.gender}</td>
	</tr>
	<tr>
	<td>学院:${sessionScope.user.college}</td>
	</tr>
	<tr>
	<td>专业:${sessionScope.user.marjor}</td>
	</tr>
	<tr>
	<td>年级:${sessionScope.user.grade}</td>
	</tr>
	<tr>
	<td>Email:${sessionScope.user.email}</td>
	</tr>
	<tr>
	<td>QQ:${sessionScope.user.qq}</td>
	</tr>
	<tr>
	<td>手机号:${sessionScope.user.cellphone}</td>
	</tr>
	</table>
  </body>
</html>
