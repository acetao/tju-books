<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'AddDept.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  
  <body>
  <a href="index.jsp">返回首页</a>
  <a href="jsp/ShowEmp.jsp">查看全部员工信息</a>
  <br/>
  <form name="addBook" method="post" action="${path}/book!add.action">
    <table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" colspan="2" align="center" bgcolor="lavender">发布新书籍</td>
      </tr>
      <tr>
        <td width="87" height="25" align="right">书籍名称：</td>
        <td width="213"><label>
          <input type="text" name="ename" id="ename">
        </label></td>
      </tr>
      <tr>
        <td height="25" align="right">ISBN</td>
        <td><input type="text" name="job" id="job"></td>
      </tr>
      <tr>
        <td height="25" align="right">书籍作者</td>
        <td><input type="text" name="hiredate" id="hiredate"></td>
      </tr>
      <tr>
        <td height="25" align="right">出版社</td>
        <td><input type="text" name="sal" id="sal"></td>
      </tr>
      <tr>
        <td height="25" align="right">书籍简介</td>
        <td><input type="text" name="comm" id="comm"></td>
      </tr>
      <tr>
        <td height="25" align="right">书籍分类</td>
        <td><label>
          <select name="deptno" id="deptno">
          	<c:if test="${empty requestScope.lstDept }">
          		<script>location="/ssh2_crud/emp!preAdd.action";</script>
          	</c:if>
          	<c:forEach items="${requestScope.lstDept }" var="dept">
          		<option value="${dept.deptno }">${dept.dname }</option>
          	</c:forEach>
          </select>
        </label></td>
      </tr>
      <tr>
        <td height="45">&nbsp;</td>
        <td><label>
          <input type="submit" name="btnAdd" id="btnAdd" value="添 加 新 员 工">
        </label></td>
      </tr>
    </table>
  </form>
    
  </body>
</html>
