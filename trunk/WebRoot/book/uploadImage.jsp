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
    <s:form action="fileUpload.action" method="POST" enctype="multipart/form-data">
        <img src="../image/defaultBook.jpg" width="100" height="150" alt="上传图片" longdesc="../image/s8873793.jpg" /><br/>
        <s:hidden name="imageId" value="" />  
        <s:file name="myFile" label="MyFile" ></s:file>
        <s:submit label="提交"></s:submit>  
    </s:form> 
</body>
</html>