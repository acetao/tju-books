<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'bookDetails.jsp' starting page</title>
  </head>
  
  <body>
       	<div>
       	  <img src="${path}/image.action?imageId=${sessionScope.bookDetail.bookimage.imageId}" alt="书籍的图片" /><br />
             ${sessionScope.bookDetail.bookname}<br /><br />
       	</div>
  </body>
</html>
