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
    	<div id="publish_info" class="publish_info">
           	<form action="${path}/addBook.action" method="post" ENCTYPE="multipart/form-data" name="formPubBook" id="formPubBook" class="salebuybook" onreset="return my_reset();" onsubmit="return checkSubmit()">
                    <span class="fItem">
                        <label class="input-name"> 书名</label><span class="red"><label>*</label></span>
                        <span><input class="input-text-bg" id="bookname" name="bookname" type="text" maxlength="32" size="25" value="" tiptext="例如：三重门，不超过32字符" onblur="checkBookName()"></span>
                        <label id="book_name_label" class="must_write"></label>
                    </span><br><br>

                    <span class="fItem">
                       <label class="input-name">作者</label><span class="red"><label>*</label></span>
                        <span><input class="input-text-bg" id="author" name="author" type="text" maxlength="32" size="25" value="" tiptext="例如：韩寒，不超过32字符" onblur="checkAuthor()"></span>
                      <label id="author_label" class="must_write"></label>
                        <span id="author_notice"></span>
                    </span><br><br>

                    <span class="fItem">
                        <label class="input-name">ISBN</label><span class="red" style="visibility:hidden;"><label>*</label></span>
                        <span><input class="input-text-bg" id="isbn" name="isbn" type="text" maxlength="13" size="25" value="" tiptext="输入10或13位数字的“ISBN”" onblur="checkISBN()"></span>
                        <label id="isbn_label" class="must_write"></label>
                        <span id="isbn_notice"></span>
                    </span><br><br>

                    <span class="fItem">
                        <label class="input-name">出版社</label><span class="red"><label>*</label></span>
                        <span><input class="input-text-bg" id="publisher" name="publisher" type="text" maxlength="32" size="25" value="" tiptext="选择或输入，不超过32字符" onblur="checkPublisher()"></span>
                        <label id="publisher_label" class="must_write"></label>
                        <span id="publisher_notice"></span>
                    </span><br><br>

                    <span class="fItem">
                    <label class="input-name">图书描述</label><span class="red" style="visibility:hidden;"><label>*</label></span>
                        <span><textarea id="desc" name="introduction" type="text" maxlength="1024" style="margin:0px" value="" tiptext="输入对图书本身的评价，不超过1024字符"></textarea></span>

                      <label id="desc_lable" class="must_write"></label>
                      <br>
                      <span style="color:#999999;margin:20px 0px auto 128px;">输入对图书本身的评价，不超过1024字符，超出部分将会被舍弃</span>

                        <span id="desc_notice"></span>
                    </span><br>


                    <span class="fItem">
                    	<label class="input-name">上传图片</label><span class="red" style="visibility:hidden;"><label>*</label></span>
                        <span>
                          <input style="margin-left:0px;" id="selPicture" name="image" type="file" value="" tiptext="点击此处选择文件，图片预览显示在“图书描述”文本框右侧">
                        </span><br>
                        <span style="color:#999999;margin:20px 0px auto 15px;">图片请使用GIF、JPG、BMP、PNG格式，图片容量请不要超过512KB(如遇上传失败，请重新点击上传)。</span>
                        <label class="must_write"></label>
                    </span><br><br>

                    <span class="fItem">
                    	<label class="input-name">图书分类</label><span class="red"><label>*</label></span>
                        <span>
						<select name="category1" id="category1" noticeid="category2_notice" class="notzero" onchange="init_category2()" onblur="checkCategory()">
                            <option value="0">请选择</option>
                            <option value="1">公共类书籍</option>
                            <option value="2">专业类书籍</option>
                            <option value="3">考研考级出国认证考试</option>
                            <option value="4">课外读物类</option>
                            <option value="5">其他</option>
                        </select>
						</span>
                        <span><select name="categoryid" id="category2" class="notzero" onblur="checkCategory()">
                        	<option value="0">请选择</option>
                        </select></span>
                        <label id="category_label" class="must_write"></label>
                        <span id="category2_notice"></span>
                    </span><br><br>
					
                    <span class="fItem">
						<label class="input-name">现价</label><span class="red"><label>*</label></span>
						<span>
						<input class="input-text-code" id="u_price" name="u_price" type="text" maxlength="10" size="5" value="" onfocus="javascript:G(&#39;u_selPrice&#39;).value=0;" onblur="checkSalePrice()">
						</span><label id="nowprice_label" class="must_write"></label>
						<span id="u_price_notice">单位（元）</span>
				    </span><br><br>

					<span class="fItem">
						<label class="input-name">新旧程度</label><span class="red"><label>*</label></span>
						<span><select name="u_agingdegree" id="u_agingdegree" onblur="checkAgingdegree()">
							<option value="0">请选择</option>
							<option value="10">十成新</option>
							<option value="9">九成新</option>
							<option value="8">八成新</option>
							<option value="7">七成新</option>
							<option value="6">六成新</option>
							<option value="5">五成新</option>
							<option value="4">四成新</option>
							<option value="3">三成新</option>
							<option value="2">二成新</option>
							<option value="1">一成新</option>
						</select></span>
						<label id="agingdegree_label" class="must_write"></label>

						<span id="u_agingdegree_notice"></span>
					</span><br><br>
                        
					<span class="fItem">
						<label class="input-name">出售数量</label><span class="red"><label>*</label></span>
						<span><input class="input-text-code" id="u_number" name="u_number" type="text" maxlength="5" size="5" value="1" onblur="checkNumber()"></span>
						<label id="number_label" class="must_write"></label>
						<span id="u_number_notice">单位（本）</span>
					</span>
<br><br>
					<span class="fItem">
						<label class="input-name">我有话说</label><span class="red" style="visibility:hidden;"><label>*</label></span>
					   <span><textarea id="u_say" name="u_say" cols="50" rows="4" type="text" maxlength="255" value="" tiptext="输入买家或卖家留言，不超过255字符"></textarea></span>
						<label id="u_say_lable" class="must_write"></label>
						<br>
				       <span style="color:#999999;margin:20px 0px auto 128px;">输入您想说的话，不超过255个字符，超出部分将会被舍弃</span>
						<span id="u_say_notice"></span>
					</span><br><br>
					
	            <div>
                    <input type="hidden" name="act" value="act_pub_sale_book">
                    <input type="hidden" id="changed" name="changed" value="">
                    <span style="margin:20px 10px auto 128px;">
                    <input name="_submit" class="my-btn-big" id="_submit" type="submit" value="提交">
                    <input id="reset_button" type="reset" class="my-btn-big" value="重置">
                    </span>
                </div>
            </form>
        </div>
</div>

<%@ include file="col6.jsp" %>
<%@ include file="col7.jsp" %>
</body>

</html>

