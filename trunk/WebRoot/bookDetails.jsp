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
<div class="box clearfix">
  <div class="block main_box"> 
    <div class="main_body_header">
      <div class="main_body_title"><span>查看图书</span></div>
      <div class="right">
        <div style="font-weight:normal;	margin-top:7px;margin-right:10px;">
          
        </div>
      </div>
    </div>
    <div class="book_box">            
      <div class="book_detail_info">
        <div class="one_book">                
          <div class="book_img">                       
            <img src="${path}/image.action?imageId=${bookDetail.bookimage.imageId}" alt="${bookDetail.bookname}"> 
          </div>5
          <div class="book_detail">
            <div class="book_name">${bookDetail.bookname}</div>
            <span>${bookDetail.author}</span><br>
            <span>${bookDetail.publisher}</span> <br>
            <span>${bookDetail.isbn}</span><br>
          </div>
        </div>
      </div>
      
      <div class="description clearfix">
        <!--<h4><span>图书描述</span></h4>-->
        <h4><span>图书描述</span></h4>
        <div class="content">
		  ${bookDetail.introduction}
        </div>
      </div>
      <div class="hr_light">     </div>
    
    <div class="sale_infos" id="sale_infos">
      <h4><span>出售信息</span></h4>
      <!--<h4><span>出售信息</span><span class="right">排序：<select name="sort"><option>现价（由低到高）</option><option>现价（由高到低）</option><option>新旧程度</option><option>数量</option></select></span></h4>-->
      <div id="salesInfo">
	  <div id="paneContent1" class="sale_content">
		   <div class="sale_list">
			<ul>
			<li>
			<div class="sale_detail"><span class="span2">现价：<font color="#f78d47" style="font-weight:bold; font-size:16px;"></font><font color="#50c943" style="font-weight:bold; font-size:16px;">${bookDetail.price}元</font></span><br />
			<span class="span1">1本</span><br />
			<span class="span3">来自：软件学院</a></span>
			<span class="span3">发布时间：${bookDetail.publishdate}</span>                
			</div>
			<div class="user_say">卖家说明：${bookDetail.specialStatement}</div>
			</li>
			</ul>
					
			</div>
	</div>
 </div>
    </div>
    <div class="hr_light"></div>
</div>      
</div>       
</div>
</div>

<%@ include file="col6.jsp" %>
<%@ include file="col7.jsp" %>
</body>

</html>

