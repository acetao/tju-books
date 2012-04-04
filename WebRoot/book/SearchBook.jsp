﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'AddDept.jsp' starting page</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"><style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
  <script>
    function submitForm(myCurrentPage){
		var currentPage =  document.getElementById("currentPage");
		currentPage.value = myCurrentPage;
		var form = document.getElementById("searchForm");
		form.submit();
	};
  </script>
  </head>
  
  <body><!--
  <c:if test="${empty requestScope.pageBean}">
    <script>location="${path}/book!byPage.action"</script>
  </c:if>
  -->
  <p><a href="${path}/index.jsp">返回首页</a><a href="AddBook.jsp">添加书籍</a>&nbsp;</p>
  <form id="searchForm" name="searchForm" method="post" action="${path}/book!search.action">
    <p id="searchForm">
      <label for="keyWords"></label>
      <input type="text" name="keyWords" id="keyWords" value="${requestScope.keyWords}"/>
      <input type="hidden" name="currentPage" id="currentPage" value="1" />
      <input type="submit" name="searchButton" id="searchButton" value="搜索" />
    </p>
  </form>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="30" colspan="2">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right">&nbsp;</td>
    </tr>
    <tr>
      <td height="30" colspan="2">总共${requestScope.pageBean.totalRows}条记录</td>
      <td width="134">&nbsp;</td>
      <td width="178">&nbsp;</td>
      <td width="170" align="right">第${requestScope.pageBean.currentPage}/${requestScope.pageBean.totalPages} 页</td>
    </tr>
    <tr>
      <td width="27" height="30" align="center" bgcolor="lavender">&nbsp;</td>
      <td width="91" align="center" bgcolor="lavender">书籍编号</td>
      <td align="center" bgcolor="lavender">书籍名称</td>
      <td align="center" bgcolor="lavender">书籍作者</td>
      <td align="center" bgcolor="lavender">相关操作</td>
    </tr>
    <c:forEach items="${requestScope.pageBean.data}" var="book">
      <tr>
      <td height="30">&nbsp;</td>
      <td align="center">${book.bookid}</td>
      <td align="center">${book.bookname}</td>
      <td align="center">${book.author}</td>
      <td align="center"><a href="#">删除</a>&nbsp; <a href="#">更新</a></td>
    </tr>
    </c:forEach>
    <tr>
      <td height="30">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td colspan="2" align="right">请选择：
      <c:forEach var="i" begin="1" end="${requestScope.pageBean.totalPages}">
      <c:if test="${requestScope.pageBean.currentPage == i}">
      [${i}]&nbsp;
      </c:if>
      <c:if test="${requestScope.pageBean.currentPage != i}">
        <a href="#" onClick="submitForm(${i});">${i}&nbsp;</a>
      </c:if>
      </c:forEach>
      页</td>
    </tr>
  </table>
  <p>&nbsp;</p>
  </body>
</html>
