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
  <s:form id="upLoadImgForm" action="/uploadImage.action" method="POST" ENCTYPE="multipart/form-data" onsubmit="return checkImage()">
    <s:file name="image" value="选择图片" ></s:file>
    <s:submit name="submit" value="提交" align="left"></s:submit>     
  </s:form>
</body>
</html>