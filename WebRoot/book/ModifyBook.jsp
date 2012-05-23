<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'AddDept.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <link href="css/publishBook.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>

    <form id="publishBookForm" action="${path}/modifyBook.action" method="POST" ENCTYPE="multipart/form-data" onSubmit="return checkForm()">
      <div>
        <ul>
          <li>书籍名称：<input type="text" name="bookname" value="${modifyBook.bookname}" id="bookname"></li>
		  <li>图片：<input type="file" name="image" value="选择图片" id="upLoadImgForm_image"/></li>	
		  <li>分类：
            <select name="categoryid" id="categoryid">
              <option value="16777216">公共类书籍</option>
              <option value="33554432">专业性书籍</option>
            </select>
          </li>
          <li></li>
		  <li></li>		           			
		</ul>
      </div>
      <input type="submit" name="submit" value="发布书籍" align="left"></input>   
    </form>

    
  </body>
</html>
