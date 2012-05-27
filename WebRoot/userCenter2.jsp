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
<script type="text/javascript" src="scripts/global.js"></script>

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
		<div class="main_body_header">
            <div class="main_body_title">
            <span class="span1">个人中心</span>                       
            </div> 
        </div>
        <div id="person_tab" class="book_box">            
            <div class="Menubox">
                <ul>
                   <li id="one0" onclick="setTab(&#39;one&#39;,0,5)" class="tab_hit">个人信息</li>
                               
                   <li id="one1" onclick="setTab(&#39;one&#39;,1,5)" class="">修改密码</li>
                                      <li id="one2" onclick="setTab(&#39;one&#39;,2,5)" class=""><a href="${path}/userReleasedBook.action">当前出售</a></li>
                   <li id="one3" onclick="setTab(&#39;one&#39;,3,5)" class=""><a href="${path}/userRequestedBook.action">当前求购</a></li>
                                      <li id="one4" onclick="setTab(&#39;one&#39;,4,5)" class=""><a href="${path}/userSearchUnlineBook.action">历史出售</a></li>
                </ul>
            </div>
            
             <div class="Contentbox"> 
             <span id="tab_name" class="user_info_title">个人信息</span>                       
             	<a name="page_change_anchor" id="page_change_anchor">&nbsp;</a>        
               <div id="con_one_0" class="hover" style="display: block; ">
                <div class="clearfix">
                  <a href="JavaScript:modifyBaseInfo()" style="text-decoration:none;"><span class="span_button" style="float:right; margin-right:30px;">修改信息</span></a>      
                </div> 
                <div id="user_base_info" class="clearfix">
				    <div class="user_info">
					    <ul>
						    <li><label class="input-name">用户名：</label><span class="span2">${sessionScope.user.username}</span></li>
							<li><label class="input-name">Email地址：</label><span class="span2">${sessionScope.user.email}</span></li>
							<li><label class="input-name">学院：</label><span class="span2">${sessionScope.user.college}</span></li>
							<li><label class="input-name">联系电话：</label><span class="span2">${sessionScope.user.cellphone}</span></li>
							<li><label class="input-name">QQ：</label><span class="span2">${sessionScope.user.qq}</span></li>
						</ul>
					</div>
				</div> 
				<div style="height:150px;"> </div> 
     <div id="modify_user_base_info" class="clearfix modify_info" style="display: none;">
     	<form onsubmit="return false;">
                <label class="input-name">  Email地址 </label><span class="red"><label>*</label></span> <input class="input-text-bg" type="text" id="email" name="email" onblur="checkEmail()" maxlength="20"> <span class="red"><label id="check_email"></label> </span> <br>
                 <br>
                <label class="input-name">  联系电话</label><span class="red" style="visibility:hidden;"><label>*</label></span> <input class="input-text-bg" type="text" id="user_phone" name="user_phone" onblur="checkUserPhone()" maxlength="30"> <span class="red"><label id="check_user_phone"></label></span>  <br>
                 <br>
                <label class="input-name">  QQ号码</label><span class="red" style="visibility:hidden;"><label>*</label></span> <input class="input-text-bg" type="text" id="user_qq" name="user_qq" onblur="checkUserQq()" maxlength="12"> <span class="red"><label id="check_user_qq"></label> </span> <br>
                 <br>
                 <input class="span_button" style="margin:0px 0px auto 110px;" type="submit" value="提交" onclick="submitUserInfoChange()"> <div style="height:40px;"> </div> 
          </form>
         </div>               
                </div>
               
            <div id="con_one_1" style="display: none; ">
            <div id="modify_user_password" class="clearfix modify_info">
            <form id="modify_pwd_form" onsubmit="return false;">
                  <label class="input-name"> 当前密码</label><span class="red"><label>*</label></span>  <input class="input-text-bg" type="password" id="old_pwd" name="password" onblur="checkOldPwd()" maxlength="20"> <span class="red"><label id="check_old_pwd"></label></span>  <br>
                 <br>
                  <label class="input-name"> 新 密 码</label><span class="red"><label>*</label></span>  <input class="input-text-bg" type="password" id="new_pwd" name="newpassword" onblur="checkNewPwd()" maxlength="20"> <span class="red"><label id="check_new_pwd"></label> </span> <br>
                 <br>
                  <label class="input-name"> 再次输入新密码</label><span class="red"><label>*</label></span>  <input class="input-text-bg" type="password" id="new_repwd" name="new_repwd" onblur="checkNewRepwd()" maxlength="20"><span class="red"> <label id="check_new_repwd"></label></span>  <br>
                 <br>
                 
             <br>
             <br>
                 <input class="span_button" style="margin:0px 0px auto 110px;" type="submit" value="提交" onclick="submitUserPwdChange()">
                <div style="height:200px;"> </div> 
            </form>
            </div>
            </div>
               
               <div id="con_one_2" style="display: none; " class="content_div"> 
                <div id="now_publish_div" class="clearfix publish_div">
					<ul>
						<li class="one_book">
							<div class="book_img">
								<a target="_blank" href="http://" class="book_title"><img src=".//20101953-1_b.jpg"></a>
							</div>
						<div class="book_info">
						<a target="_blank" href="http://" class="book_title">
							<span class="book_name">计算机网络（第5版）（含光盘）</span>
						</a>
						<span>2012-05-23 09:00:57</span><br>
						</div>
						<span class="book_button">
							<span class="span_button"><a href="JavaScript:deleteBookInfo(1611)">删除</a>
							</span>
						</span>
						</li>
					</ul>
				</div>
                <div id="now_publish_page_bar" class="pager" name="now_publish_page_bar"></div><div style="height:200px;"> </div> 
               </div>
               
               <div id="con_one_3" style="display: none; " class="content_div">
                <div id="now_buy_div" class="clearfix publish_div">
					<ul>
						<li class="one_book">
							<div class="book_img">
								<a target="_blank" href="http://" class="book_title"><img src=".//20101953-1_b.jpg"></a>
							</div>
						<div class="book_info">
						<a target="_blank" href="http://" class="book_title">
							<span class="book_name">计算机网络（第5版）（含光盘）</span>
						</a>
						<span>2012-05-23 09:00:57</span><br>
						</div>
						<span class="book_button">
							<span class="span_button"><a href="JavaScript:deleteBookInfo(1611)">删除</a>
							</span>
						</span>
						</li>
					</ul>
				</div>
                <div id="now_buy_page_bar" class="pager" name="now_buy_page_bar">
                </div><div style="height:200px;"> </div> 
               </div>
               
               <div id="con_one_4" style="display: none; " class="content_div">
                <div id="history_publish_div" class="clearfix publish_div">
					<ul>
						<li class="one_book">
							<div class="book_img">
								<a target="_blank" href="http://" class="book_title"><img src=".//20101953-1_b.jpg"></a>
							</div>
						<div class="book_info">
						<a target="_blank" href="http://" class="book_title">
							<span class="book_name">计算机网络（第5版）（含光盘）</span>
						</a>
						<span>2012-05-23 09:00:57</span><br>
						</div>
						<span class="book_button">
							<span class="span_button"><a href="JavaScript:deleteBookInfo(1611)">删除</a>
							</span>
						</span>
						</li>
					</ul>
				</div>
                <div id="history_publish_page_bar" class="pager" name="history_publish_page_bar">
                </div><div style="height:200px;"> </div> 
               </div>
             </div>
    	</div>
    </div>
</div>

<script type="text/javascript">
	
    <!--	
	var global_user_nick, global_user_email, global_mobile_phone, global_user_qq, global_province_id, global_school_id, global_college_id, global_school_name, global_college_name;
	
	var now_publish_count = 0, now_publish_list = "", now_publish_current_page = 1, now_publish_total_page = 1;	
	var now_buy_count = 0, now_buy_list = "", now_buy_current_page = 1, now_buy_total_page = 1;
	var history_publish_count = 0, history_publish_list = "", history_publish_current_page = 1, history_publish_total_page = 1;
	var history_buy_count = 0, history_buy_list = "", history_buy_current_page = 1, history_buy_total_page = 1;
		
	var display_order = 0;
	
	function modifyBaseInfo(){	
		G("user_base_info").innerHTML = G("modify_user_base_info").innerHTML;
	}
	
	
	function initTabInfo(){
		if(display_order == 0 ){
			loadBaseInfo();
		}else if(display_order == 1 ){
		
		}else{
			createXmlHttpRequestObject();
			var pars = "display_order="+display_order+"&user_id="+1522;
			var url = "user_info_result.php?"+pars;
			xmlHttp.onreadystatechange = showTabInfoResult;
			xmlHttp.open("POST", url, true);
			xmlHttp.send(null);
            G('ajaxProcessTip').style.display = "block";
		}		
	}
	
	function showTabInfoResult(){
	    if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
			if(xmlHttp.responseText != ""){
				var tab_info_result = xmlHttp.responseText;
				if(tab_info_result){
                    if(tab_info_result.charAt(0) != '{' && tab_info_result.charAt(0) != '[' ) {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
					var tab_info_result_json = eval('('+tab_info_result+')');
					if(!tab_info_result_json)
                    {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
					var book_count = tab_info_result_json['book_count'];			
					var total_page = tab_info_result_json['total_page'];
					var	book_list = tab_info_result_json['book_list']; 					
					if(display_order == 2){
						//当前出售
						if(book_count > 0){
							now_publish_total_page = total_page;
							showBookInfo("now_publish_div", book_list, "now_publish_page_bar", book_count, now_publish_total_page, now_publish_current_page);	
						}else{
							G("now_publish_div").innerHTML = "暂无信息!";
							G("now_publish_page_bar").innerHTML = "";
						}
					
					}else if(display_order == 3){
						//当前求购 						
						if(book_count > 0){
							now_buy_total_page = total_page;
							showBookInfo("now_buy_div", book_list, "now_buy_page_bar", book_count, now_buy_total_page, now_buy_current_page);			
						}else{
							G("now_buy_div").innerHTML = "暂无信息!";
							G("now_buy_page_bar").innerHTML = "";
						}
					}else if(display_order == 4){
						//历史出售
						if(book_count > 0){
							history_publish_total_page = total_page;
							showBookInfo("history_publish_div", book_list, "history_publish_page_bar", book_count, history_publish_total_page, history_publish_current_page);	
						}else{
							G("history_publish_div").innerHTML = "暂无信息!";
							G("history_publish_page_bar").innerHTML = "";
						}
						
					}else if(display_order == 5){
						//历史求购
						if(book_count > 0){
							history_buy_total_page = total_page;
							showBookInfo("history_buy_div", book_list, "history_buy_page_bar", book_count, history_buy_total_page, history_buy_current_page);	
						}else{
							G("history_buy_div").innerHTML = "暂无信息!";
							G("history_buy_page_bar").innerHTML = "";
						}
					}
				}
			}
			else
			{
                alert("数据查询失败，请稍后再试！");
                return false;
			}
		}
	}
	
	function goPage(page){
		window.location.hash = "page_change_anchor";
		var c_total_page;
		if(display_order == 2){
			now_publish_current_page = page;
			c_total_page = now_publish_total_page;
		}else if(display_order == 3){
			now_buy_current_page = page;
			c_total_page = now_buy_total_page;
		}else if(display_order == 4){
			history_publish_current_page = page;
			c_total_page = history_publish_total_page;
		}else if(display_order == 5){
			history_buy_current_page = page;
			c_total_page = history_buy_total_page;
		}
		if(page <= c_total_page && page > 0){
			createXmlHttpRequestObject();
			var pars = "user_id="+1522+"&page_index="+page+"&display_order="+display_order;
			var url = "user_info_result.php?"+pars;
			xmlHttp.onreadystatechange = showTabInfoResult;
			xmlHttp.open("POST", url, true);
			xmlHttp.send(null);
            G('ajaxProcessTip').style.display = "block";
		}
	}
	
	function deleteBookInfo(book_info_id,library_id){
		var aa;
		if(display_order == 2 || display_order == 3){
			aa = window.confirm("确定将此书下架吗?");
		}else if(display_order == 2 || display_order == 3){
			aa = window.confirm("确定删除这条发布信息?");
		}
		if (aa) {		
			createXmlHttpRequestObject();
			var user_baseinfo_json = {"user_id":"1522","email":"flybirdtian@163.com","password":"33d64189ac1dec06b8e3fcb656c4665c","user_name":"bird","school_id":"572","college_id":"6514","reg_time":"2012-05-21 18:33:13","last_login":"2012-05-21 19:45:32","visit_count":"4","mobile_phone":"13821178532","qq":"1061903350","school_name":"\u5929\u6d25\u5927\u5b66","college_name":"\u8f6f\u4ef6\u5b66\u9662"};
			var pars = "user_id="+1522+"&school_id="+user_baseinfo_json['school_id']+"&book_info_id="+book_info_id+"&library_id="+library_id+"&display_order="+display_order;
			var url = "delete_book_result.php?"+pars;
			xmlHttp.onreadystatechange = showDeleteInfoResult;
			xmlHttp.open("POST", url, true);
			xmlHttp.send(null);
            G('ajaxProcessTip').style.display = "block";
		}
	}
	
	//历史表中没有免费赠送字段
	function showDeleteInfoResult(){
		if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
			if(xmlHttp.responseText != ""){
				var result = xmlHttp.responseText; 
				if(result == 1){
					alert("操作成功！");					
					if(display_order == 2){
						goPage(now_publish_current_page);
					}else if(display_order == 3){
						goPage(now_buy_current_page);
					}else if(display_order == 4){
						goPage(history_publish_current_page);
					}else if(display_order == 5){
						goPage(history_publish_current_page);
					}
				}else{
					alert("操作失败！");	
				}
			}
		}
	}
	
	function showBookInfo(show_div, list, page_bar, count, total_page, current_page){
		var str = "<ul>";		
		for (var key in list){					
			str += "<li class='one_book'>";
			str += "<div class='book_img'><a target='_blank' href='book_detail.php?library_id="+list[key]['library_id']+"' class='book_title'><img src='";
			if(list[key]['image']){
                str += "uploads/bi/m/" + list[key]['image'];
			}else{
                str += "page/images/default_book_pic.jpg";
			}
			str += "' /></a></div><div class='book_info'><a target='_blank' href='book_detail.php?library_id="+list[key]['library_id']+"' class='book_title'><span class='book_name'>"+list[key]['book_name']+"</span></a><span>("+list[key]['number']+"本)</span><span>"+list[key]['add_time']+"</span><br><span>留言：";
			var user_say = list[key]['user_say'];
			if(user_say.length > 200){
				str += user_say.substring(0,200)+"......</span></div>";
			}else{
				str += user_say+"</span></div>";
			}
			if(1522 == 1522){
				str += "<span class='book_button'>"
				if(display_order == 2){
					str += "<span class='span_button'><a target='_blank' href='modify_sale_buy_info.php?act=modify_sale_info&sale_id=" + list[key]['sale_id'] + "'>修改</a></span><span class='span_button'><a href='JavaScript:deleteBookInfo("+list[key]['sale_id']+","+list[key]['library_id']+")'>下架</a></span>";
				}else if(display_order == 3){
					str += "<span class='span_button'><a href='modify_sale_buy_info.php?act=modify_buy_info&buy_id=" + list[key]['buy_id'] +  "'>修改</a></span><span class='span_button'><a href='JavaScript:deleteBookInfo("+list[key]['buy_id']+","+list[key]['library_id']+")'>下架</a></span>";
				}else if(display_order == 4){
					str += "<span class='span_button'><a href='JavaScript:deleteBookInfo("+list[key]['sale_history_id']+")'>删除</a></span>";
				}else if(display_order == 5){
					str += "<span class='span_button'><a href='JavaScript:deleteBookInfo("+list[key]['buy_history_id']+")'>删除</a></span>";
				}
				str += "</span>"
			}
			str += "</li>";
		}			
		str += "</ul>";		
		G(show_div).innerHTML = str;		
		var page_bar_str = "共 <strong>"+count+"</strong> 条记录 当前第<strong>"+current_page+"</strong>页";
		if(current_page == 1){
			page_bar_str += "<font color='#999'> 首页 上一页 </font>";
		}else{
			page_bar_str += "<a href=\"JavaScript:goPage(1)\" onClick=\"goPage(1)\"> 首页 </a>  <a href=\"JavaScript:goPage("+(current_page-1)+")\">上一页</a>";
		}
		if(current_page == total_page){
			page_bar_str += "<font color='#999'> 下一页 尾页 </font>";
		}else{
			page_bar_str += "<a href=\"JavaScript:goPage("+(current_page+1)+")\">下一页</a>  <a href=\"JavaScript:goPage("+total_page+")\"> 尾页 </a>";
		}
		page_bar_str += "共 <strong>"+total_page+"</strong> 页 去第<input type=\"text\" id=\"page_index\" size=3 maxlength=2 onkeydown=\"javascript:if(event.keyCode==13)   goPage(parseInt(G('page_index').value)); \" />页  <a href='JavaScript:goPage(parseInt(G(\"page_index\").value))'>确定</a>";
		G(page_bar).innerHTML = page_bar_str;
	}
	
	function checkEmail()
	{
		var email = G("email").value;
		var len = getStrLength(email);
        if(!email)
        {
			G("check_email").innerHTML = "Email不能为空";
			return false;
        }
		else if(len<2 || len>20){		
			G("check_email").innerHTML = "用户昵称长度不合法";
			return false;
		}else{
			return true;
		}
	}
		
	function checkUserPhone(){
		var user_phone = G("user_phone").value;
		if(user_phone.length > 30)
        {
			G("check_user_phone").innerHTML = "联系电话输入不合法";
			return false;
		}else{
			G("check_user_phone").innerHTML = "<img src='./images/success.gif' />";
			return true;
		}
	}
	
	function checkUserQq(){
		var user_qq = G("user_qq").value;
       	if(user_qq.length > 15)
        {
			G("check_user_qq").innerHTML = "QQ号码输入不合法";
			return false;
		}else if(isNaN(user_qq)){
			G("check_user_qq").innerHTML = "QQ号码必须是数字";
			return false;
		}else{
			G("check_user_qq").innerHTML = "<img src='./images/success.gif' />";
			return true;
		}
	}
	
	//页面第一次加载时
	function init(){
		var user_baseinfo_json = {"user_id":"1522","email":"flybirdtian@163.com","password":"33d64189ac1dec06b8e3fcb656c4665c","user_name":"bird","school_id":"572","college_id":"6514","reg_time":"2012-05-21 18:33:13","last_login":"2012-05-21 19:45:32","visit_count":"4","mobile_phone":"13821178532","qq":"1061903350","school_name":"\u5929\u6d25\u5927\u5b66","college_name":"\u8f6f\u4ef6\u5b66\u9662"};
		showBaseInfo(user_baseinfo_json);
	}
	//点击个人信息tab时
	function loadBaseInfo(){
		createXmlHttpRequestObject();						
		var pars = "display_order="+display_order+"&user_id="+1522;
		var url = "user_info_result.php?"+pars;
		xmlHttp.onreadystatechange = showLoadBaseInfo;
		xmlHttp.open("POST", url, true);
		xmlHttp.send(null);
        G('ajaxProcessTip').style.display = "block";
	}
	
	
	function showLoadBaseInfo(){
		if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
			if(xmlHttp.responseText != ""){
				var user_baseinfo = xmlHttp.responseText;
				if(user_baseinfo != ''){
                    if(user_baseinfo.charAt(0) != '{' && user_baseinfo.charAt(0) != '[' ) {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
					var user_baseinfo_json = eval('('+user_baseinfo+')');
					if(!user_baseinfo_json)
                    {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
					showBaseInfo(user_baseinfo_json);
				}
			}
			else
			{
                alert("数据查询失败，请稍后再试！");
                return false;
            }
		}
	}
	
	function showBaseInfo(user_baseinfo_json){
		global_user_nick = user_baseinfo_json['user_name'];
		global_user_email = user_baseinfo_json['email'];
		global_province_id = user_baseinfo_json['province_id'];
		global_school_id = user_baseinfo_json['school_id'];
		global_school_name = user_baseinfo_json['school_name'];
		global_college_id = user_baseinfo_json['college_id'];
		global_college_name = user_baseinfo_json['college_name'];
		global_mobile_phone = user_baseinfo_json['mobile_phone'];
		global_user_qq = user_baseinfo_json['qq'];
		var user_baseinfo_str = "<div class='user_info'><ul>";	
		user_baseinfo_str += "<li><label class='input-name'>用户名：</label><span class='span2'>"+global_user_nick+"</span></li><li><label class='input-name'>Email地址：</label><span class='span2'>"+global_user_email+"</span></li><li><label class='input-name'>学校：</label><span class='span2'>"+global_school_name+"</span></li><li><label class='input-name'>学院：</label><span class='span2'>"+global_college_name+"</span></li><li><label class='input-name'>联系电话：</label><span class='span2'>"+global_mobile_phone+"</span></li><li><label class='input-name'>QQ：</label><span class='span2'>"+global_user_qq+"</span></li></ul></div>";
		G("user_base_info").innerHTML = user_baseinfo_str;
		if("1522" == "1522")
            G('login_status').innerHTML = "<a href='user_info.php'>"+global_user_nick+"</a> | <a href='login_out.php'>退出</a>";
	}	

	function submitUserInfoChange(){
		if(checkEmail() && checkUserPhone() && checkUserQq()){			
			var email = G("email").value;
			var cellphone = G("user_phone").value;
			var qq= G("user_qq").value;
			createXmlHttpRequestObject();
			var pars = "email="+email+"&cellphone="+cellphone+"&qq="+qq;
			var url = "TjuBooks/modifyBook.action?"+pars;
			url = encodeURI(url);
			xmlHttp.onreadystatechange = showUserInfoChange;
			xmlHttp.open("POST", url, true);
			xmlHttp.send(null);
		}else{
			alert("请完善个人信息！");
		}
	}
	function showUserInfoChange(){
		if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
			if(xmlHttp.responseText != ""){
				var result = xmlHttp.responseText; 
				if(result == 1){
					alert("修改成功!");
					loadBaseInfo();
				}else{
					alert(result);
				}
			}
		}
		else{
			alert("修改失败！");
		}
	}
	
	function checkOldPwd()
	{
		var old_pwd = G("old_pwd").value;
		var len = getStrLength(old_pwd);
        if(!old_pwd)
        {
			G("check_old_pwd").innerHTML = "密码不能为空";
			return false;
        }else if(len<6 || len>20){		
			G("check_old_pwd").innerHTML = "密码长度不合法";
			return false;
		}else{
			G("check_old_pwd").innerHTML = "<img src='./images/success.gif' />";
			return true;
		}
	}
	
	function checkNewPwd()
	{
		var new_pwd = G("new_pwd").value;
		var len = getStrLength(new_pwd);
        if(!new_pwd)
        {
			G("check_new_pwd").innerHTML = "密码不能为空";
			return false;
        }else if(len<6 || len>20){		
			G("check_new_pwd").innerHTML = "密码长度不合法";
			return false;
		}else{
			G("check_new_pwd").innerHTML = "<img src='./images/success.gif' />";
			return true;
		}
	}
	
	function checkNewRepwd()
	{
		var new_pwd = G("new_pwd").value;
		var new_repwd = G("new_repwd").value;
		var len = getStrLength(new_repwd);
        if(!new_repwd)
        {
			G("check_new_repwd").innerHTML = "重新输入密码不能为空";
			return false;
        }else if(len<6 || len>20){		
			G("check_new_repwd").innerHTML = "重新输入密码长度不合法";
			return false;
		}else if(new_repwd != new_pwd){
			G("check_new_repwd").innerHTML = "两次输入的密码不一致";
			return false;
		}else{
			G("check_new_repwd").innerHTML = "<img src='./images/success.gif' />";
			return true;
		}
	}
	
	function checkCode(){
		if(G("captcha_code").value == ""){
			G("check_user_checkcode").innerHTML = "验证码不能为空";
			return false;
		}else if(getStrLength(G("captcha_code").value) != 4){
			G("check_user_checkcode").innerHTML = "验证码长度不合法";
			return false;
		}else{
			G("check_user_checkcode").innerHTML = "";
			return true;
		}
	}
	
	function submitUserPwdChange(){
		if(checkOldPwd() && checkNewPwd() && checkNewRepwd() ){
			var old_pwd = G("old_pwd").value;   //采用MD5方法加密
			var new_pwd = G("new_pwd").value;   //采用MD5方法加密
			var captcha_code = G("captcha_code").value;
			createXmlHttpRequestObject();
			var pars = "password="+old_pwd+"&newpassword="+new_pwd;
			var url = "userPassword.action?"+pars;
			alert(url);
			xmlHttp.onreadystatechange = showPwdChangeResult;
			xmlHttp.open("POST", url, true);
			xmlHttp.send(null);
		}else{
			alert("请正确填写信息！");
		}
	}
	
	function showPwdChangeResult(){
		if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
			var result = xmlHttp.responseText; 
			if(result){				
					alert("修改成功!");	
					G("modify_pwd_form").reset();					
					G("check_old_pwd").innerHTML = "";
					G("check_new_pwd").innerHTML = "";
					G("check_new_repwd").innerHTML = "";
			}else{
				alert("原始密码输入有误!");
			}
		}else{
			alert("原始密码输入有误!");
		}
	}
	
	function returnToBaseInfoFromCurrentTab(){
		loadBaseInfo();
	}
	
	function returnToBaseInfoFromOtherTab(){
		setTab('one',0,5);
	}
	
	function setTab(name,cursel,n){
		for(var i=0;i<=n;i++){
			var menu=document.getElementById(name+i);  
			var con=document.getElementById("con_"+name+"_"+i);  
			menu.className=i==cursel?"tab_hit":"";  
			con.style.display=i==cursel?"block":"none";  
		}
		display_order = cursel;
		initTabInfo(); 
		G("tab_name").innerHTML = G(name+cursel).innerHTML;
	}
	-->
    
</script> 


</div>

<%@ include file="col6.jsp" %>
<%@ include file="col7.jsp" %>
</body>

</html>

