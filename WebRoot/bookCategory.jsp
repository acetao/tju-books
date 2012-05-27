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

<div class="wrapper" style="">
<div class="page_header">

<!-- <div id="ajaxProcessTip" style="display:none; text-align:left;"><img src='page/images/loader_light_blue.gif'/><span><strong>正在处理中，请稍后......</strong></span></div>
-->

<script language="JavaScript">
<!--
 	function move(){
 		scrollPos = 0;
		if (typeof window.pageYOffset != 'undefined') {
		   scrollPos = window.pageYOffset;
		}
		else if (typeof document.compatMode != 'undefined' &&
		     document.compatMode != 'BackCompat') {
		   scrollPos = document.documentElement.scrollTop;
		}
		else if (typeof document.body != 'undefined') {
		   scrollPos = document.body.scrollTop;
		}
  	document.getElementById("ajaxProcessTip").style.top=(35 + scrollPos) + "px";
 }
 window.onscroll=move;
//-->
</script>



<script type="text/javascript">
function checkSearchSubmit()
{
    var keyword = trim(G('keyword').value);
    if(keyword == "" || ("" == "" && keyword == "请输入关键字进行搜索") 
    	       	  || ("" != "" && keyword == "在  内搜索") 
		  || keyword == "%" || keyword == "*")
    {
        alert("请先输入关键字再搜索！");
        return false;
    }
}
</script>
        <div class="box">
	<div class="block main_box">
        <div class="main_body_header">
            <div class="main_body_title"><span>图书分类</span></div>
        </div>
        
        <div class="book_box">
            <div class="book_type">
                <span class="type1">公共类书籍</span>
				<span id="category11" class="category2">
					<a href="${path}/bookOfCategory.action?categoryid=16842752" value="9" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))">
					<span class="type2 selected" id="category_9">数学类</span>
					</a>
					<a href="${path}/bookOfCategory.action?categoryid=16908288" value="10" >
                    <span class="type2" id="category_10">政史类</span>
                    </a>
                    <a href="${path}/bookOfCategory.action?categoryid=16973824" value="11" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_11">公共计算机</span></a><a href="${path}/bookOfCategory.action?categoryid=17039360" value="17" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_17">公共选修课</span></a></span><br>
				<span class="type1">专业性书籍</span>
				<span id="category12" class="category2"><a href="${path}/bookOfCategory.action?categoryid=34078720"  value="18" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_18">化工学院</span></a><a href="${path}/bookOfCategory.action?categoryid=33685504" value="19" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_19">精仪学院</span></a><a value="20" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_20">软件</span></a><a value="21" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_21">自动化</span></a><a value="22" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_22">管理与经济学部</span></a><a value="23" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_23">文法学院</span></a><a value="24" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_24">药学院</span></a><a value="24" onclick="setBookCategory(this.getAttribute('value'))"><span class="type2">材料</span></a><a href="${path}/bookOfCategory.action?categoryid=16973824" value="25" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_25">理学院</span></a><a value="24" onclick="setBookCategory(this.getAttribute('value'))"><span class="type2">建工学院</span></a><a value="24" onclick="setBookCategory(this.getAttribute('value'))"><span class="type2">职教</span></a><a value="24" onclick="setBookCategory(this.getAttribute('value'))"><span class="type2">计算机学院</span></a><a value="24" onclick="setBookCategory(this.getAttribute('value'))"><span class="type2">环境学院</span></a><br/><a value="24" onclick="setBookCategory(this.getAttribute('value'))"><span class="type2" style="padding-left:9em;">电子信息工程学院</span></a><a value="26" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_26">求是学部</span></a><a value="27" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_27">建筑</span></a></span><a value="27" onclick="setBookCategory(this.getAttribute('value'))"><span class="type2">机械</span></a><a value="24" onclick="setBookCategory(this.getAttribute('value'))"><span class="type2">学院</span></a><br>
				<span class="type1" style="padding-left:4em;">考研</span><span id="category13" class="category2"><a href="${path}/bookOfCategory.action?categoryid=50462720" value="28" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_28">四六级</span></a><a value="29" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_29">托福</span></a><a value="30" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_30">雅思</span></a><a value="31" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_31">GRE</span></a><a value="32" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_32">商务英语</span></a><a value="33" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_33">专业认证考试</span></a><a value="34" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_34">其他</span></a></span><br>
      <span class="type1">课外读物类</span><span id="category14" class="category2"><a href="${path}/bookOfCategory.action?categoryid=67174400" value="35" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_35">文学历史哲学</span></a><a value="36" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_36">社科经管励志心理</span></a><a value="37" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_37">杂志漫画</span></a><a value="38" onclick="setBookCategory(this.getAttribute(&#39;value&#39;))"><span class="type2" id="category_38">其他</span></a></span><br> 
            </div>
            
            <div class="search_condition">            
            </div>
          
          	<a name="page_change_anchor" id="page_change_anchor" style="line-height:0px">&nbsp;</a>           
            <div id="show_search_result" class="goodsList">
            </div>
            <div id="page_bar" class="pager right">
            </div>
            
        </div>
        
    </div>
</div>


<script type="text/javascript">	
	var book_category_json = {"1":{"name":"\u5b66\u751f\u6559\u6750","children":{"9":"\u6587\u79d1\u6559\u6750","10":"\u6cd5\u5f8b\u6559\u6750","11":"\u7406\u79d1\u6559\u6750","12":"\u5de5\u79d1\u6559\u6750","13":"\u519c\u5b66\u6559\u6750","14":"\u533b\u5b66\u6559\u6750","15":"\u8d22\u7ecf\u6559\u6750","16":"\u516c\u5171\u8bfe\u6559\u6750","17":"\u5de5\u5177\u4e66"}},"2":{"name":"\u6559\u8f85\u8003\u8bd5","children":{"18":"\u8003\u7814","19":"\u5916\u8bed","20":"\u516c\u52a1\u5458","21":"\u8ba1\u7b97\u673a\u7c7b","22":"\u8d22\u7a0e\u4fdd\u9669\u7c7b","23":"\u5efa\u7b51\u5de5\u7a0b\u7c7b","24":"\u533b\u836f\u536b\u751f\u7c7b","25":"\u827a\u672f\u4f53\u80b2\u7c7b","26":"\u6210\u4eba\/\u81ea\u5b66\u7c7b","27":"\u5176\u5b83\u7c7b"}},"3":{"name":"\u79d1\u5b66\u6280\u672f","children":{"28":"\u79d1\u666e","29":"\u5efa\u7b51","30":"\u533b\u5b66","31":"\u519c\u6797","32":"\u5de5\u4e1a","33":"\u8ba1\u7b97\u673a\u4e0e\u7f51\u7edc","34":"\u81ea\u7136\u79d1\u5b66"}},"4":{"name":"\u7ecf\u6d4e\u7ba1\u7406","children":{"35":"\u7ba1\u7406","36":"\u8425\u9500","37":"\u4fdd\u9669","38":"\u7ecf\u6d4e\/\u91d1\u878d","39":"\u6295\u8d44\/\u7406\u8d22"}},"5":{"name":"\u4eba\u6587\u793e\u79d1","children":{"40":"\u8bed\u8a00","41":"\u6587\u5316","42":"\u5386\u53f2","43":"\u6cd5\u5f8b","44":"\u56fd\u5b66\/\u53e4\u7c4d","45":"\u653f\u6cbb\/\u519b\u4e8b","46":"\u54f2\u5b66\/\u5b97\u6559","47":"\u52b1\u5fd7\/\u5fc3\u7406","48":"\u793e\u4f1a\u79d1\u5b66"}},"6":{"name":"\u6587\u5b66\u827a\u672f","children":{"49":"\u6587\u5b66","50":"\u5c0f\u8bf4","51":"\u4f20\u8bb0","52":"\u9752\u6625","53":"\u5e7d\u9ed8\/\u5a31\u4e50","54":"\u827a\u672f\/\u6444\u5f71","55":"\u52a8\u6f2b\/\u7ed8\u672c","56":"\u6742\u5fd7\/\u671f\u520a"}},"7":{"name":"\u751f\u6d3b\u4f11\u95f2","children":{"57":"\u5bb6\u5ead\u6559\u80b2","58":"\u5bb6\u5c45\u4f11\u95f2","59":"\u7f8e\u4e3d\u88c5\u626e","60":"\u7f8e\u98df\/\u517b\u751f","61":"\u8fd0\u52a8\/\u5065\u8eab","62":"\u65c5\u6e38\/\u5730\u56fe","63":"\u6536\u85cf\/\u9274\u8d4f","64":"\u4e24\u6027\/\u4fdd\u5065"}},"8":{"name":"\u97f3\u4e50\u5f71\u50cf","children":{"65":"\u97f3\u4e50","66":"\u5f71\u89c6","67":"\u8f6f\u4ef6","68":"\u6e38\u620f","69":"\u6559\u80b2"}}};
	var province_json = {"2":"\u5317\u4eac","27":"\u5929\u6d25","10":"\u6cb3\u5317","23":"\u5c71\u897f","19":"\u5185\u8499\u53e4","18":"\u8fbd\u5b81","15":"\u5409\u6797","12":"\u9ed1\u9f99\u6c5f","25":"\u4e0a\u6d77","16":"\u6c5f\u82cf","31":"\u6d59\u6c5f","3":"\u5b89\u5fbd","4":"\u798f\u5efa","17":"\u6c5f\u897f","22":"\u5c71\u4e1c","11":"\u6cb3\u5357","13":"\u6e56\u5317","14":"\u6e56\u5357","6":"\u5e7f\u4e1c","7":"\u5e7f\u897f","9":"\u6d77\u5357","33":"\u9999\u6e2f","34":"\u6fb3\u95e8","35":"\u53f0\u6e7e","32":"\u91cd\u5e86","26":"\u56db\u5ddd","8":"\u8d35\u5dde","30":"\u4e91\u5357","28":"\u897f\u85cf","24":"\u9655\u897f","5":"\u7518\u8083","21":"\u9752\u6d77","20":"\u5b81\u590f","29":"\u65b0\u7586"};
	//var max_page_available = "99";	
	
	function showProvinceResult(){
		if(province_json){
			var str = "<select id=\"user_province\" name=\"user_province\" onchange=\"checkUserProvince();\" >";
			for (var key in province_json) {
				var province_name = province_json[key];				  
				var province_id = key;	
				str += "<option value='"+province_id+"'>"+province_name+"</option>";
			}
			str += " </select><br />";
			G("choose_user_province").innerHTML = str;
		}
		if("" != "")
            G('user_province').value = "";
		initSchool(G('user_province').value);
	}
	
	function checkUserProvince(){	
        G('user_school').options.length = 0;
		var user_province_id = G("user_province").value;
        initSchool(user_province_id);	
	}
	
	function initSchool(user_province_id){
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
				if(school_result.charAt(0) != '{' && school_result.charAt(0) != '[' ) {
                    alert("数据查询失败，请稍后再试！");
                    return false;
                }
				if(school_result){
                    var school_result_json = eval('('+school_result+')');
                    if(!school_result_json)
                    {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
                    var str = "<select id=\"user_school\" name=\"user_school\" >";
                    for (var key in school_result_json) {
                        var school_id = key;			  
                        var school_name = school_result_json[key];	
                        str += "<option value='"+school_id+"'>"+school_name+"</option>";
                    }
                    str += " </select><br />";
                    G("choose_user_school").innerHTML = str;
                    if("" == G("user_province").value && "" != "")
                        G('user_school').value = "";
                }
            }
            else
            {
                alert("数据查询失败，请稍后再试！");
                return false;
            }
        }
	}
	
	var book_count, book_list, current_page = 1, total_page;
	var book_category2, user_school, book_type;
	function submitSearchBook(){
		G("show_search_result").innerHTML = "";
		G("page_bar").innerHTML = "";
		current_page = 1;
		book_category2 = G("book_category2_hidden").value; 
		user_school = G("user_school").value;
		book_type = G("book_type").value;
        if(!user_school)
        {
            alert("查询条件不完整，请重试！");
            return false;
        }
		createXmlHttpRequestObject();
		var pars = "book_category2="+book_category2+"&user_school="+user_school+"&book_type="+book_type+"&page_index="+current_page;
		var url = "book_category_result.php?"+pars;
		xmlHttp.onreadystatechange = showSearchBookResult;
		xmlHttp.open("POST", url, true);
		xmlHttp.send(null);
        G('ajaxProcessTip').style.display = "block";
	}
	
	function goPage(page){
		if(page <= total_page && page > 0){
			window.location.hash = "page_change_anchor";
			current_page = page;
			createXmlHttpRequestObject();
			var pars = "book_category2="+book_category2+"&user_school="+user_school+"&book_type="+book_type+"&page_index="+current_page;
			var url = "book_category_result.php?"+pars;
			xmlHttp.onreadystatechange = showSearchBookResult;
			xmlHttp.open("POST", url, true);
			xmlHttp.send(null);
            G('ajaxProcessTip').style.display = "block";
		}
	}
	
	function showSearchBookResult(){
	    if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
				var book_result = xmlHttp.responseText;
				if(book_result != ""){
                    if(book_result.charAt(0) != '{' && book_result.charAt(0) != '[' ) {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
					var book_result_json = eval('('+book_result+')');
                    if(!book_result_json)
                    {
                        alert("数据查询失败，请稍后再试！");
                        return false;
                    }
					book_count = book_result_json['book_count'];
					total_page = book_result_json['total_page'];
					book_list = book_result_json['book_list']; 
					if(book_count > 0){					
						var str = "<h4><span style='margin-left:10px;'>查找结果如下:</span></h4>";
						for (var key in book_list){
							str += "<div class='one_book'>";
							str += "<div class='book_img'><a target='_blank' href='"+book_list[key]['href']+"'><img src='";
							if(book_list[key]['image']){
								str += "uploads/bi/m/"+book_list[key]['image'];
							}else{
								str += "page/images/default_book_pic.jpg";
							}
							str += "'></img></a></div><div class='good_detail'><a target='_blank' href='"+book_list[key]['href']+"' class='book_title'><span class='good_name'>"+book_list[key]['book_name']+"</span></a><span class='book_title_info'>"+book_list[key]['author']+"</span><span class='book_title_info'>"+book_list[key]['publisher']+"</span><span class='book_title_info'>ISBN码:"+book_list[key]['isbn13']+"</span><br><div class='description'>"+book_list[key]['description']+"</div><div class='book_info'><span>原价: <span class='old_price'>"+book_list[key]['price']+" 元</span><br><span>出售量: <span><a href='#book_saleInfo'>"+book_list[key]['sale_count']+"</a></span> 本</span> <span><a target='_blank' href='pubbook.php?act=pub_sale_book&library_id="+book_list[key]['library_id']+"' class='follow'>我也要出售</a></span><br><span>求购量: <span><a href='#book_buyInfo'>"+book_list[key]['buy_count']+"</a></span> 本</span> <span><a target='_blank' href='pubbook.php?act=pub_buy_book&library_id="+book_list[key]['library_id']+"' class='follow'>我也要求购</a></span><br></div>";
							str += "</div></div>";
						}
						G("show_search_result").innerHTML = str;
						var page_bar_str = "共 <strong>"+book_count+"</strong> 条结果 当前第<strong>"+current_page+"</strong>页";
						if(current_page == 1){
							page_bar_str += "<font color='#999'> 首页 上一页 </font>";
						}else{
							page_bar_str += "<a href=\"JavaScript:goPage(1)\">首页</a>  <a href=\"JavaScript:goPage("+(current_page-1)+")\">上一页</a>";
						}
						if(current_page == total_page){
							page_bar_str += "<font color='#999'> 下一页 尾页 </font>";
						}else{
							page_bar_str += " <a href=\"JavaScript:goPage("+(current_page+1)+")\">下一页</a>  <a href=\"JavaScript:goPage("+total_page+")\">尾页</a>";
						}
						page_bar_str += " 共 <strong>"+total_page+"</strong> 页 去第<input type='text' id='page_index' size=3 maxlength=2 onkeydown='javascript:if(event.keyCode==13)   goPage(parseInt(G(\"page_index\").value)); '/>页  <a href='JavaScript:goPage(parseInt(G(\"page_index\").value))'>确定</a>";
						G("page_bar").innerHTML = page_bar_str;
					}else{
						G("show_search_result").innerHTML = "<span style='margin-left:360px;font-size:14px;'>抱歉，未查找到相关信息！</span>";
					}					
				}else{
					alert("数据查询失败，请稍后再试！");
                    return false;
				}
		}
	}	
	
	function setBookCategory(bookCategoryId){
		var previous_category = G("book_category2_hidden").value;
		G("category_"+previous_category).className = "type2";
		G("book_category2_hidden").value = bookCategoryId;
		G("category_"+bookCategoryId).className = "type2 selected";
	}
	
	function setCategory(div_id, current_category){
		var str = "";
		for (var key in book_category_json[current_category]['children']){
			var category2_id = key, category2_name = book_category_json[current_category]['children'][key];
			if(category2_id == '9'){
				str += "<a value='"+category2_id+"' onclick=\"setBookCategory(this.getAttribute('value'))\"><span class=\"type2 selected\" id='category_"+category2_id+"'>"+category2_name+"</span></a>";
			}else{
				str += "<a value='"+category2_id+"' onclick=\"setBookCategory(this.getAttribute('value'))\"><span class=\"type2\" id='category_"+category2_id+"'>"+category2_name+"</span></a>";
			}
		}
		G(div_id).innerHTML = str;
	}
	
	function init(){
		G("book_category2_hidden").value = 9;
		showProvinceResult();
		setCategory("category11", 1);   //学生教材
		setCategory("category12", 2);   //教辅考试
		setCategory("category13", 3);   //科学技术
		setCategory("category14", 4);   //经济管理
		setCategory("category15", 5);   //人文社科
		setCategory("category16", 6);   //文学艺术
		setCategory("category17", 7);   //生活休闲
		setCategory("category18", 8);   //音乐影像
	}


</script>         
<script type="text/javascript">
function google_analy() {
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-20495067-1']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
}
//addLoadEvent(google_analy);

</script>
</div>

   	
    

<style id="_clearly_component__css" type="text/css">#next_pages_container { width: 5px; hight: 5px; position: absolute; top: -100px; left: -100px; z-index: 2147483647 !important; } </style><div id="_clearly_component__next_pages_container"></div>
</div>

<%@ include file="col6.jsp" %>
<%@ include file="col7.jsp" %>
</body>

</html>

