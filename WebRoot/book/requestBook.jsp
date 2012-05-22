<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'requestBook.jsp' starting page</title>
  </head>
  
  <body>
    <form id="requestBookForm" action="${path}/addRequestBook.action" method="POST" onSubmit="return checkForm()">
      <div>
        <ul>
          <li>求购书籍名称：<input type="text" name="reqBookName" id="reqBookName"></li>
		  <li>求购书籍描述：<textarea name="reqBookIntroduce" cols="50" rows="10"></textarea></li>	           			
		</ul>
      </div>
      <input type="submit" name="submit" value="发布求购信息" align="right"></input>   
    </form>
  </body>
</html>
