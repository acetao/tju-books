<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head profile="http://gmpg.org/xfn/11">
<title>天津大学图书交流平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<link rel="stylesheet" href="styles/common.css" type="text/css" />  <!-- 来自二手书网站的common css-->
<!--全局性的js脚本-->
<script type="text/javascript" src="{path}/scripts/global.js"></script>

<!-- 在此处自定义当前页面的css-->

<!-- 在此处定义当前页的脚本文件-->

</head>

<body >
<%@ include file="col1.jsp" %>
<%@ include file="col2.jsp" %>
<%@ include file="col3.jsp" %>

<div class="wrapper">
   <div class="box">
     <div class="block main_box">
        
        <div class="book_box">     
                      <div class="goodsList">
                <div class="pager">
                    <span>共 <strong>${pageBean.totalRows}</strong> 条结果
					请选择：
					  <c:forEach var="i" begin="1" end="${pageBean.totalPages}">
					  <c:if test="${pageBean.currentPage == i}">
					  <strong>[${i}]&nbsp;</strong>
					  </c:if>
					  <c:if test="${pageBean.currentPage != i}">
						<a href="#" onClick="submitForm(${i});">${i}&nbsp;</a>
					  </c:if>
					  </c:forEach>页
                </div>
                <c:forEach var="book" items="${pageBean.data}">
					<div class="one_book">                
						<div class="book_img">
						  <a target="_blank" href="${path}/bookDetail.action?bookid=${book.bookid}">
							<img src="${path}/image.action?imageId=${book.bookimage.imageId}" alt="&lt;font color=#ff00ff&gt;&lt;b&gt;Java&lt;/b&gt;&lt;/font&gt;编程思想：第3版">
						  </a>
						</div>
						<div class="good_detail">
							<a target="_blank" href="${path}/bookDetail.action?bookid=${book.bookid}" class="book_title"><span class="good_name"><font color="#ff00ff">${book.bookname}</font></span></a>
							<span class="book_title_info">${book.author}</span><span class="book_title_info">${book.publisher}</span>
							<div class="description">${book.introduction}</div>
							<div class="book_info">                    
								<span>价格： <span>${book.price}</span> 元</span> <span> <br />
							</div>
						</div>
					</div> 
                </c:forEach>               
                               
                <div class="pager">
                    <span>共 <strong>${pageBean.totalRows}</strong> 条结果
					请选择：
					  <c:forEach var="i" begin="1" end="${pageBean.totalPages}">
					  <c:if test="${pageBean.currentPage == i}">
					  <strong>[${i}]&nbsp;</strong>
					  </c:if>
					  <c:if test="${pageBean.currentPage != i}">
						<a href="#" onClick="submitForm(${i});">${i}&nbsp;</a>
					  </c:if>
					  </c:forEach>页
                </div>
              </div>
           
        </div>     
	</div>
</div>
</div>

<%@ include file="col6.jsp" %>
<%@ include file="col7.jsp" %>
</body>

</html>

