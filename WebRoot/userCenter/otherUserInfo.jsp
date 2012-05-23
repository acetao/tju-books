<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'userInfo.jsp' starting page</title>

  </head>
  
  <body>
    <p>要查看的用户信息：</p>
    <div>
    	<ul>
        	<li>${userInfo.userid }</li>
			<li>${userInfo.username}</li>
			<li>${userInfo.cellphone }</li>	          			
		</ul>
    </div>
  </body>
</html>
