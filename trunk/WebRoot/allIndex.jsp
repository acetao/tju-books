<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'allIndex.jsp' starting page</title>
  </head>
  
  <body>
    <div>
    	<ul>
        	<li><a href="${path}/index.jsp">index.jsp</a></li>
        	<li><a href="${path}/userManage/register.jsp">注册</a></li>
			<li><a href="${path}/bookOfCategory.action?categoryid=16842752">某一类下的书籍</a> </li>
			<li><a href="${path}/book/publishBook.jsp">发布书籍</a></li>	 
            <li><a href="${path}/book/requestBook.jsp">求购书籍</a></li>
            <li><a href="${path}/userInfo.action?userid=1">查看编号为1的用户信息</a></li>	          			
		</ul>
    </div>
  </body>
</html>
