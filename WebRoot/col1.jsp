<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<div class="wrapper col1">
  <div id="topbar">
    <ul>
	  <c:if test="${empty sessionScope.user}">
		  <li><a href="${path}/login.jsp">登陆</a></li>
		  <li><a href="${path}/register.jsp">注册</a></li>
		  <li><a href="#">关于我们</a></li>
	  </c:if>
	  <c:if test="${!empty sessionScope.user}">
		  <li>您好！${sessionScope.user.username}</li>
		  <li><a href="${path}/userLogout.action">退出</a></li>
		  <li><a href="${path}/userCenter.action">个人中心</a></li>
		  <li><a href="#">关于我们</a></li>
	  </c:if>
    </ul>
    <br class="clear" />
  </div>
</div>