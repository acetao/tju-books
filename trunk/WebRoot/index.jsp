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
<link rel="stylesheet" href="styles/index.css" type="text/css" />

<!-- 在此处定义当前页的脚本文件-->
<script type="text/javascript" src="{path}/scripts/index.js"></script>


</head>

<body onload="getRecommend()">
<%@ include file="col1.jsp" %>
<%@ include file="col2.jsp" %>
<%@ include file="col3.jsp" %>

<c:if test="${empty sessionScope.recommendBooks}">
	<script>location="/TjuBooks/recommend.action";</script>
</c:if>
<div class="wrapper col5">
  <div id="container">
    
    <div id="column">
      <div class="holder">
        <h2>瞧瞧书目</h2>
        <ul id="latestnews">
          <li><a href="#" target="content">公共类书籍</a></li>
          <li><a href="#" target="content">专业性书籍</a></li>
          <li><a href="#" target="content">考研考级出国认证考试类</a></li>
          <li><a href="#" target="content">课外读物类</a></li>
		  <li><a href="#" target="content">其他书籍</a></li>
        </ul>
      </div>
      
    </div>
    <div class="index_book_list">
		<div class="user_title clearfix"> 
			<span style="margin: 0px;">最新出售</span> 
			<span id="ls_page_bar" class="index_mini_pager">第1页，共5页</span> 
			<span id="ls_page_change" class="index_page_change"> 
				<a id="ls_pre_page" class="index_pre_none" href="javascript:shang(1);">&nbsp;</a> 
				<a id="ls_next_page" class="index_next_page" href="javascript:xia(1)">&nbsp;</a> 
			</span> 
		</div>
		<div class="books_show">
			<div class="image_show" id="show_new_sale">
				<div>
					<c:forEach var="book" items="${sessionScope.recommendBooks.data}">
					<div class="one_book">
						<a href="${path}/bookDetail.action?bookid=${book.bookid}" target="_blank">
							<div class="image_book"><img src="${path}/image.action?imageId=${book.bookimage.imageId}"></div>
						</a>
						<p></p>
						<div class="image_msg">   
							<a href="${path}/bookDetail.action?bookid=${book.bookid}" target="_blank">《${book.bookname}》</a><br />
							<a style="color:#FF3300;" href="">￥${book.price}</a>
						</div>
					</div>
                    </c:forEach>
				</div>
			</div>
		</div>
		
		<div class="index_book_list">
			<div class="user_title clearfix"> <span style="margin: 0px;">最新求购</span> <span id="lb_page_bar" class="index_mini_pager">第1页，共5页</span> <span id="lb_page_change" class="index_page_change"> <a id="lb_pre_page" class="index_pre_none" href="javascript:shang(2);">&nbsp;</a> <a id="lb_next_page" class="index_next_page" href="javascript:xia(2)">&nbsp;</a> </span> </div>
			<div class="books_show">
			    <div class="image_show" id="show_new_buy">
				    <div>
						<c:forEach var="reqBook" items="${sessionScope.recommendReqBooks.data}">
							<div class="one_book">
								<a href="${path}/reqBookDetail.action?requestId=${reqBook.requestId}" target="_blank">
									<div class="image_book"><img src="${path}/image.action?imageId=1"></div>
								</a>
								<p></p>
								<div class="image_msg">
									<br />
									<a href="${path}/reqBookDetail.action?requestId=${reqBook.requestId}" target="_blank">《${reqBook.reqBookName}》</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    <div style="float:right; padding-right:10px; font-size:20px; margin-top:50px;"><!--请选择：
      <c:forEach var="i" begin="1" end="${pageBean.totalPages}">
      <c:if test="${pageBean.currentPage == i}">
      [${i}]&nbsp;
      </c:if>
      <c:if test="${pageBean.currentPage != i}">
        <a href="#" onClick="submitForm(${i});">${i}&nbsp;</a>
      </c:if>
      </c:forEach>页
    --></div>
    <br class="clear" />
  </div>
</div>

<%@ include file="col6.jsp" %>
<%@ include file="col7.jsp" %>
</body>

</html>

