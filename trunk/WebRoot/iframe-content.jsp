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
<title>无标题文档</title>

<link rel="stylesheet" href="styles/iframe-content.css" type="text/css" />
</head>

<body>
	<div class="all">
    	<div class="books">
           	<c:forEach items="${sessionScope.pageBean.data}" var="book">
            	<div class="book">
            	  <a href="#"><img class="book" src="${path}/image!getImage.action?imageId=${book.bookimage.imageId}" alt="书籍的图片" /><a><br />
                  ${book.bookname}<br />
                  ${book.author}<br /><br />
                  <strong>价格：￥${book.price}</strong>
            	</div>
            </c:forEach>
        </div>


    </div>
</body>
</html>
