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
<link rel="stylesheet" href="styles/register.css" type="text/css" />
<!-- 在此处定义当前页的脚本文件-->
<script type="text/javascript" src="scripts/register.js"></script>
<style type="text/css">
body {
	margin-left: 0px;
}
</style>
</head>

<body >
<%@ include file="col1.jsp" %>
<%@ include file="col2.jsp" %>
<%@ include file="col3.jsp" %>

<div class="wrapper">
<div class="block ">
    <div class="main_body_header">
            <div class="main_body_title"><span>注册</span></div>
    </div>
    <div class="passport_box">  
    <div class="box_passport_wrap">  
        <form method="post" action="${path}/userRegister.action">
            <label class="input-name">用户名</label><span class="red"><label>*</label></span>  <input class="input-text-bg" type="text" id="username" name="username" onblur="" maxlength="30"><span class="red"><label id="check_user_email"></label></span> <br>
            <br>
            <label class="input-name">密 码</label><span class="red"><label>*</label></span>  <input class="input-text-bg" type="password" id="user_pwd" name="password" onblur="checkUserPwd()" maxlength="20"> <span class="red"><label id="check_user_pwd"></label></span>    <span style=" color:#999999">请输入6－20位密码</span><br>
            <br>
            <label class="input-name">再次输入密码</label><span class="red"><label>*</label></span>  <input class="input-text-bg" type="password" id="user_repwd" name="user_repwd" onblur="checkUserRepwd()" maxlength="20"> <span class="red"><label id="check_user_repwd"></label></span> <br>
            <br>
            <label class="input-name">Email地址</label><span class="red"><label>*</label></span>  <input class="input-text-bg" type="text" id="user_email" name="email" onblur="checkUserEmail()" maxlength="30"><span class="red"><label id="check_user_email"></label></span> <br>
            <br>
            <div id="choose_user_reg">     
                <br>
				<div id="choose_user_college">
				<label style="font-size:12px;">学院</label><span class="red" style="margin:0px 4px 0px 7px;"><label>*</label>
				</span>   
				<select id="user_college" name="college" onblur="checkUserCollege()">
					<option value="-999" selected="selected">请选择</option>
					<option value="6488">中视影视学院</option>
					<option value="6489">仁爱学院</option>
					<option value="6490">农业与生物工程学院</option>
					<option value="6491">化工学院</option>
					<option value="6492">国际教育学院</option>
					<option value="6493">土木工程系</option>
					<option value="6494">工业设计系</option>
					<option value="6495">建筑工程学院</option>
					<option value="6496">成人教育学院</option>
					<option value="6497">机械工程学院</option>
					<option value="6498">材料科学与工程学院</option>
					<option value="6499">法学</option>
					<option value="6500">环境科学与工程学院</option>
					<option value="6501">理学院</option>
					<option value="6502">电子信息工程学院</option>
					<option value="6503">电气与自动化工程学院</option>
					<option value="6504">研究生院</option>
					<option value="6505">社会科学与外国语学院</option>
					<option value="6506">管理学院</option>
					<option value="6507">精密仪器与光电子工程学院</option>
					<option value="6508">继续教育学院</option>
					<option value="6509">网络教育学院</option>
					<option value="6510">职业技术教育学院</option>
					<option value="6511">自动化学院</option>
					<option value="6512">药物科学与技术学院</option>
					<option value="6513">计算机科学与技术学院</option>
					<option value="6514">软件学院</option>
				</select> <span style=" color:#999999"><label id="check_user_college" >请选择您所在的学院</label></span> <br>	
				</div>
            </div>
          <p><br>
               <label class="input-name"> 联系电话</label>
               <span class="red" style="visibility:hidden;">
                 <label>*</label>
              </span>  
               <input class="input-text-bg" type="text" id="user_phone" name="cellphone" onblur="checkUserPhone()" maxlength="32"> 
               <span class="red">
                 <label id="check_user_phone"></label>
              </span> <span style=" color:#999999">可以输入多个联系电话</span><br>
               <br>
               <label class="input-name">  QQ号码</label>
               <span class="red" style="visibility:hidden;">
                 <label>*</label>
              </span>  
               <input class="input-text-bg" type="text" id="user_qq" name="qq" onblur="checkUserQq()" maxlength="12"> 
               <span class="red">
                 <label id="check_user_qq"></label>
          </span>   <span style=" color:#999999">请输入12位以内的数字</span></p>
            <p>
              <br>
              <span style="display:block; margin-left:20%;">
                <input type="submit" class="my-btn-big" id="submit_button" name="submit_button" onclick="registerSubmit()" value="立即注册" />
              </span><br>
            </p>
        </form>
        <p style="margin:20px 0px auto 128px;">已经拥有帐号? 
        <a href="{path}/login.jsp">&gt; 直接登录</a></p>     
    </div>
    
    </div>
</div>

<script type="text/javascript">
    
    <!--	
	function showProvinceResult(){
		var province_json = {"2":"\u5317\u4eac","27":"\u5929\u6d25","10":"\u6cb3\u5317","23":"\u5c71\u897f","19":"\u5185\u8499\u53e4","18":"\u8fbd\u5b81","15":"\u5409\u6797","12":"\u9ed1\u9f99\u6c5f","25":"\u4e0a\u6d77","16":"\u6c5f\u82cf","31":"\u6d59\u6c5f","3":"\u5b89\u5fbd","4":"\u798f\u5efa","17":"\u6c5f\u897f","22":"\u5c71\u4e1c","11":"\u6cb3\u5357","13":"\u6e56\u5317","14":"\u6e56\u5357","6":"\u5e7f\u4e1c","7":"\u5e7f\u897f","9":"\u6d77\u5357","33":"\u9999\u6e2f","34":"\u6fb3\u95e8","35":"\u53f0\u6e7e","32":"\u91cd\u5e86","26":"\u56db\u5ddd","8":"\u8d35\u5dde","30":"\u4e91\u5357","28":"\u897f\u85cf","24":"\u9655\u897f","5":"\u7518\u8083","21":"\u9752\u6d77","20":"\u5b81\u590f","29":"\u65b0\u7586"};
		if(province_json){
			var str = "<label style='font-size:12px;'>省份</label>  <span class='red' style='margin:0px 10px 0px 6px;'><label>*</label></span><select id='user_province' name='user_province' onchange='initSchool(this.value);' onBlur='checkUserProvince()' >";
			str += "<option value='-999' selected='selected'>请选择</option>";
			for (var key in province_json) {
				var province_name = province_json[key];				  
				var province_id = key;	
				str += "<option value='"+province_id+"'>"+province_name+"</option>";
			}
			str += " </select> <span class='red'><label id='check_user_province'></label></span> <br />	";
			G("choose_user_province").innerHTML = str;
		}
	}
	
	function initSchool(user_province_id){
        G('user_school').options.length = 1;
        createXmlHttpRequestObject();
		var pars = "user_province_id="+user_province_id;
		var url = "user_library/get_school_by_province.php?"+pars;
		xmlHttp.onreadystatechange = initSchoolResult;
		xmlHttp.open("POST", url, true);
		xmlHttp.send(null);
        G('ajaxProcessTip').style.display = "block";
	}
	
	function initSchoolResult(){
        if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
			if(xmlHttp.responseText != ""){
				var school_result = xmlHttp.responseText;
				if(school_result){
                    if(school_result.charAt(0) != '{' && school_result.charAt(0) != '[' ) {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
                    var school_result_json = eval('('+school_result+')');
                    if(!school_result_json)
                    {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
                    var str = "<label style='font-size:12px;'>学校</label>  <span class='red' style='margin:0px 4px 0px 7px;'><label>*</label></span> <select id='user_school' name='user_school' onchange='initCollege(this.value)' onBlur='checkUserSchool()'>";
                    str += "<option value='-999' selected='selected'>请选择</option>";
                    for (var key in school_result_json) {
                        var school_id = key;			  
                        var school_name = school_result_json[key];	
                        str += "<option value='"+school_id+"'>"+school_name+"</option>";
                    }
                    str += "</select> <span class='red' style='font-size:12px;'><label id='check_user_school'></label></span> <br />	";
                    G("choose_user_school").innerHTML = str;
                }
            }
			else
			{
                alert("数据查询失败，请稍后再试！");
                return false;
			}
        }
	}
	
	function initCollege(user_school_id){
        G('user_college').options.length = 1;
		createXmlHttpRequestObject();
		var pars = "user_school_id="+user_school_id;
		var url = "user_library/get_college_by_school.php?"+pars;
		xmlHttp.onreadystatechange = showCollegeResult;
		xmlHttp.open("POST", url, true);
		xmlHttp.send(null);
        G('ajaxProcessTip').style.display = "block";
	}
	
	function showCollegeResult(){
	    if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
			if(xmlHttp.responseText != ""){
				var college_result = xmlHttp.responseText; 
				if(college_result){	
                    if(college_result.charAt(0) != '{' && college_result.charAt(0) != '[' ) {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
					var str = "<label style='font-size:12px;'>学院</label>   <span class='red' style='margin:0px 4px 0px 7px;'><label>*</label></span> <select id='user_college' name='user_college' onBlur='checkUserCollege()'>";
					str += "<option value='-999' selected='selected'>请选择</option>";
				    var college_json = eval('('+college_result+')');
				    if(!college_json)
                    {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
					for (var key1 in college_json) {
					  var college_id = college_json[key1]['college_id'];
					  var college_name = college_json[key1]['college_name'];
					  str += "<option value='"+college_id+"'>"+college_name+"</option>";
					}
					str += "</select> <span class='red'><label id='check_user_college'></label></span> <br />	";
					G("choose_user_college").innerHTML = str;
				}		
			}
			else
			{
                alert("数据查询失败，请稍后再试！");
                return false;
			}
		}
	}
	
	function checkUserEmail()
	{
		var user_email = G("user_email").value;
		var patrn = /^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/; 
		if(!isEmailAvailable){
			G("check_user_email").innerHTML = "Email地址已被注册";
			isEmailAvailable = true;
			return false;
		}else if(!user_email){
			G("check_user_email").innerHTML = "Email地址不能为空";
			return false;
        }else if(!patrn.exec(user_email)){
			G("check_user_email").innerHTML = "Email地址不合法";
			return false;
		}else{
			G("check_user_email").innerHTML = "<img src='page//images/success.gif' />";
			return true;
		}
	}
	
	function checkUserNick()
	{
		var user_nick = G("user_nick").value;
		var len = getStrLength(user_nick);
		var patrn = /^[a-zA-Z0-9\u4e00-\u9fa5]|[_]{1}([a-zA-Z0-9\u4e00-\u9fa5]|[_]){5,15}$/;  
        if(!user_nick)
        {
			G("check_user_nick").innerHTML = "用户昵称不能为空";
			return false;
        }else if(len<2 || len>20){		
			G("check_user_nick").innerHTML = "用户昵称长度不合法";
			return false;
		}else if(!patrn.exec(user_nick)){
			G("check_user_nick").innerHTML = "用户昵称不合法";
			return false;
		}else{
			G("check_user_nick").innerHTML = "<img src='page//images/success.gif' />";
			return true;
		}
	}
	
	function checkUserPwd()
	{
		var user_pwd = G("user_pwd").value;
		var len = getStrLength(user_pwd);
        if(!user_pwd)
        {
			G("check_user_pwd").innerHTML = "密码不能为空";
			return false;
        }else if(len<6 || len>20){		
			G("check_user_pwd").innerHTML = "密码长度不合法";
			return false;
		}else{
			G("check_user_pwd").innerHTML = "<img src='page//images/success.gif' />";
			return true;
		}
	}
	
	function checkUserRepwd()
	{
		var user_pwd = G("user_pwd").value;
		var user_repwd = G("user_repwd").value;
		var len = getStrLength(user_repwd);
        if(!user_repwd)
        {
			G("check_user_repwd").innerHTML = "重新输入密码不能为空";
			return false;
        }else if(len<6 || len>20){		
			G("check_user_repwd").innerHTML = "重新输入密码长度不合法";
			return false;
		}else if(user_repwd != user_pwd){
			G("check_user_repwd").innerHTML = "两次输入的密码不一致";
			return false;
		}else{
			G("check_user_repwd").innerHTML = "<img src='page//images/success.gif' />";
			return true;
		}
	}
		
	function checkUserProvince()
	{
		var user_province_id = G("user_province").value;
        if(user_province_id < 0)
        {
			G("check_user_province").innerHTML = "您选择的省份不合法";
			return false;
        }else{
			G("check_user_province").innerHTML = "<img src='page//images/success.gif' />";
			return true;
		}		
	}
		
	function checkUserSchool()
	{
		var user_school_id = G("user_school").value;
        if(user_school_id < 0)
        {
			G("check_user_school").innerHTML = "您选择的学校不合法";
			return false;
        }else{
			G("check_user_school").innerHTML = "<img src='page//images/success.gif' />";
			return true;
		}
	}
	
	
	function checkUserCollege()
	{
		var user_college = G("user_college").value;
        if(user_college < 0)
        {
			G("check_user_college").innerHTML = "请选择您所在的学院";
			return false;
        }else if(!user_college)
        {
			G("check_user_college").innerHTML = "您选择的学院不合法";
			return false;
		}else{
			G("check_user_college").innerHTML = "<img src='page//images/success.gif' />";
			return true;
		}
	}
	
	function checkUserPhone(){
		var user_phone = G("user_phone").value;		
		if(trim(user_phone))
        {
            if(user_phone.length > 30)
			{
				G("check_user_phone").innerHTML = "联系电话输入过长";
				return false;
			}else{
				G("check_user_phone").innerHTML = "<img src='page//images/success.gif' />";
				return true;
			}
        }else{
            G("check_user_phone").innerHTML = "";
        }						
        return true;
	}
	
	function checkUserQq(){
		var user_qq = G("user_qq").value;
       	if(trim(user_qq))
        {
			if(user_qq.length > 12)
			{
				G("check_user_qq").innerHTML = "QQ号码输入不合法";
				return false;
			}else if(isNaN(user_qq)){
				G("check_user_qq").innerHTML = "QQ号码必须是数字";
				return false;
			}else{
				G("check_user_qq").innerHTML = "<img src='page//images/success.gif' />";
				return true;
			}
		}else{
            G("check_user_qq").innerHTML = "";
        }						
        return true;
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
	
	function checkSubmit(){
		if(!(isEmailAvailable && checkUserEmail() && checkUserNick() && checkUserPwd() && checkUserRepwd() && checkUserProvince() && checkUserSchool() && checkUserCollege() && checkUserPhone() && checkUserQq() && checkCode())){
			alert("请正确填写注册所需的相关信息！");			
			return false;
		}else{
			if(!G("user_agreement").checked){
				alert("您需要同意二手书网的《服务条款》才能进行注册！");
				return false;
			}
			return true;
		}
	}
	var isEmailAvailable = true;
	function checkEmailAvailable(){
		if(checkUserEmail()){
			createXmlHttpRequestObject();
			var pars = "user_email="+G("user_email").value;
			var url = "check_email.php?"+pars;
			xmlHttp.onreadystatechange = showCheckResult;
			xmlHttp.open("POST", url, true);
			xmlHttp.send(null);
            G('ajaxProcessTip').style.display = "block";
		}
	}
	function showCheckResult(){
		if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
			var check_result = xmlHttp.responseText; 
			if(check_result == 1){
				G("check_user_email").innerHTML = "Email地址已被注册";
				alert("很抱歉，该Email地址已被注册！");
				isEmailAvailable = false;
			}else{
				G("check_user_email").innerHTML = "<img src='page//images/success.gif' />";
				alert("恭喜！该Email地址未被注册！");
				isEmailAvailable = true;
			}
		}
	}
	
	function registerSubmit(){
		if(checkSubmit()){
			createXmlHttpRequestObject();
			var user_email = G("user_email").value;
			var user_nick = G("user_nick").value;
			var user_pwd = G("user_pwd").value;
			var user_province = G("user_province").value;
			var user_school = G("user_school").value;
			var user_college = G("user_college").value;
			var user_phone = G("user_phone").value;
			var user_qq = G("user_qq").value;
			var new_pwd = hex_md5(G("user_pwd").value); //采用MD5方法加密
			var captcha_code = G("captcha_code").value;
			var pars = "user_email="+user_email+"&user_nick="+user_nick+"&user_pwd="+new_pwd+"&user_province="+user_province+"&user_school="+user_school+"&user_college="+user_college+"&user_phone="+user_phone+"&user_qq="+user_qq+"&captcha_code="+captcha_code;
			var url = "register_result.php?"+pars;
			url = encodeURI(url);
			xmlHttp.onreadystatechange = showRegisterResult;
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);
            G('ajaxProcessTip').style.display = "block";
		}
	}
	
	function showRegisterResult(){
		if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
			var result = xmlHttp.responseText; 
			if(result == 1 || result.substring(0,1) == 1){			
				window.location.href = "user_info.php";
			}else if(result && result.charAt(0) == '<') {
        		alert("网络连接失败，请稍后再试！");
      		}else{
				alert(result);
			}
		}
	}	
	
	function on_init(){
		showProvinceResult();
	}
      -->
    
</script>  
<%@ include file="col6.jsp" %>
<%@ include file="col7.jsp" %>
</body>

</html>

