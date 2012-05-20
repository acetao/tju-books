<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传文件</title>
</head>

<body>
  <s:form action="uploadFile" method="post" enctype="multipart/form-data"> 
            <s:textfield name="username" label="username"></s:textfield> 
            <s:password name="password" label="password"></s:password> 
            <s:file name="file" label="file"></s:file> 
            <s:submit value=" submit "></s:submit> 
  </s:form> 
  <s:fielderror />
</body>
</html>