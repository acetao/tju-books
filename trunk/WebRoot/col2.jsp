<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<div class="wrapper col2">
  <div id="header">
    <div class="fl_left">
      <h1><a href="${path}/index.jsp">天津大学图书交易平台</a></h1>
    </div>
    <div class="fl_right"> 
    	<form id="searchForm" method="post" action="${path}/searchBook.action">
            <label for="keyWords"></label>
      		<input type="text" name="keyWords" id="keyWords" value="${requestScope.keyWords}" style=" height:27px; width:300px;float:left;"/>
      		<input type="hidden" name="currentPage" id="currentPage" value="1" />
            <input type="submit" style="background-image:url(images/searchButton.gif); height:32px; width:55px;" value=""/>
        </form> 
    </div>
    <br class="clear" />
  </div>
</div>