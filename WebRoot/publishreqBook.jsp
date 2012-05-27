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
           	<form action="${path}/addRequestBook.action" method="post" name="formPubBook" id="formPubBook" class="salebuybook"  onreset="return my_reset();" onsubmit="return checkSubmit()">
                    <span class="fItem">
                        <label class="input-name">书名</label><span class="red"><label>*</label></span>
                        <span><input class="input-text-bg" id="bookname" name="reqBookName" type="text" maxlength="32" size="25" value="" tiptext="例如：三重门，不超过32字符" onblur="checkBookName()"></span>
                        <label id="book_name_label" class="must_write"></label>
                    </span><br><br>

                    <span class="fItem">
                       <label class="input-name">作者</label><span class="red"><label>*</label></span>
                        <span><input class="input-text-bg" id="author" name="author" type="text" maxlength="32" size="25" value="" tiptext="例如：韩寒，不超过32字符" onblur="checkAuthor()"></span>
                       <label id="author_label" class="must_write"></label>
                        <span id="author_notice"></span>
                    </span><br><br>

                    <span class="fItem">
                        <label class="input-name">出版社</label><span class="red"><label>*</label></span>
                        <span><input class="input-text-bg" id="publisher" name="publisher" type="text" maxlength="32" size="25" value="" tiptext="选择或输入，不超过32字符" onblur="checkPublisher()"></span>
                        <label id="publisher_label" class="must_write"></label>
                        <span id="publisher_notice"></span>
                    </span><br><br>

                    <span class="fItem">
                    <label class="input-name">图书描述</label><span class="red" style="visibility:hidden;"><label>*</label></span>
                        <span><textarea id="desc" name="desc" type="text" maxlength="1024" style="margin:0px" value="" tiptext="输入对图书本身的评价，不超过1024字符"></textarea></span>

                      <label id="desc_lable" class="must_write"></label>
                      <br>
                      <span style="color:#999999;margin:20px 0px auto 128px;">输入对图书本身的评价，不超过1024字符，超出部分将会被舍弃</span>

                        <span id="desc_notice"></span>
                    </span><br>

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
                        <span><select name="category" id="category" class="notzero" onblur="checkCategory()">
                        	<option value="0">请选择</option>
                        </select>
						</span>
                        <label id="category_label" class="must_write"></label>
                        <span id="category2_notice"></span>
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

<script type="text/javascript">
    //G('reset_button_above').onClick="G('formPubBook').reset();";
    var books_json;
    var formPubBook_action = "pubbook_result.php?act=act_pub_sale_book ";
    function isEmptyString(str) {
        return (str == null||str == undefined||(!str) || str.length==0);
    }
    function init()
    {
        G('formPubBook').reset();
            }

    function onCalcDiscount(ori_price, percent)
    {
        var sale_price = 0;
        var patrn = /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
        if(!patrn.exec(ori_price))
        {
            sale_price = 0;
        }else{
            sale_price = parseInt(ori_price*percent*10)/100;
        }
        if(percent == 0)
            return;
        G('u_price').value = sale_price;
    }

    function init_category2()
    {
        var cate1_id = G('category1').value;
        var cate2 = G('category2');
        cate2.options.length = 1;
        var category_tree = {"1":{"name":"\u5b66\u751f\u6559\u6750","children":{"9":"\u6587\u79d1\u6559\u6750","10":"\u6cd5\u5f8b\u6559\u6750","11":"\u7406\u79d1\u6559\u6750","12":"\u5de5\u79d1\u6559\u6750","13":"\u519c\u5b66\u6559\u6750","14":"\u533b\u5b66\u6559\u6750","15":"\u8d22\u7ecf\u6559\u6750","16":"\u516c\u5171\u8bfe\u6559\u6750","17":"\u5de5\u5177\u4e66"}},"2":{"name":"\u6559\u8f85\u8003\u8bd5","children":{"18":"\u8003\u7814","19":"\u5916\u8bed","20":"\u516c\u52a1\u5458","21":"\u8ba1\u7b97\u673a\u7c7b","22":"\u8d22\u7a0e\u4fdd\u9669\u7c7b","23":"\u5efa\u7b51\u5de5\u7a0b\u7c7b","24":"\u533b\u836f\u536b\u751f\u7c7b","25":"\u827a\u672f\u4f53\u80b2\u7c7b","26":"\u6210\u4eba\/\u81ea\u5b66\u7c7b","27":"\u5176\u5b83\u7c7b"}},"3":{"name":"\u79d1\u5b66\u6280\u672f","children":{"28":"\u79d1\u666e","29":"\u5efa\u7b51","30":"\u533b\u5b66","31":"\u519c\u6797","32":"\u5de5\u4e1a","33":"\u8ba1\u7b97\u673a\u4e0e\u7f51\u7edc","34":"\u81ea\u7136\u79d1\u5b66"}},"4":{"name":"\u7ecf\u6d4e\u7ba1\u7406","children":{"35":"\u7ba1\u7406","36":"\u8425\u9500","37":"\u4fdd\u9669","38":"\u7ecf\u6d4e\/\u91d1\u878d","39":"\u6295\u8d44\/\u7406\u8d22"}},"5":{"name":"\u4eba\u6587\u793e\u79d1","children":{"40":"\u8bed\u8a00","41":"\u6587\u5316","42":"\u5386\u53f2","43":"\u6cd5\u5f8b","44":"\u56fd\u5b66\/\u53e4\u7c4d","45":"\u653f\u6cbb\/\u519b\u4e8b","46":"\u54f2\u5b66\/\u5b97\u6559","47":"\u52b1\u5fd7\/\u5fc3\u7406","48":"\u793e\u4f1a\u79d1\u5b66"}},"6":{"name":"\u6587\u5b66\u827a\u672f","children":{"49":"\u6587\u5b66","50":"\u5c0f\u8bf4","51":"\u4f20\u8bb0","52":"\u9752\u6625","53":"\u5e7d\u9ed8\/\u5a31\u4e50","54":"\u827a\u672f\/\u6444\u5f71","55":"\u52a8\u6f2b\/\u7ed8\u672c","56":"\u6742\u5fd7\/\u671f\u520a"}},"7":{"name":"\u751f\u6d3b\u4f11\u95f2","children":{"57":"\u5bb6\u5ead\u6559\u80b2","58":"\u5bb6\u5c45\u4f11\u95f2","59":"\u7f8e\u4e3d\u88c5\u626e","60":"\u7f8e\u98df\/\u517b\u751f","61":"\u8fd0\u52a8\/\u5065\u8eab","62":"\u65c5\u6e38\/\u5730\u56fe","63":"\u6536\u85cf\/\u9274\u8d4f","64":"\u4e24\u6027\/\u4fdd\u5065"}},"8":{"name":"\u97f3\u4e50\u5f71\u50cf","children":{"65":"\u97f3\u4e50","66":"\u5f71\u89c6","67":"\u8f6f\u4ef6","68":"\u6e38\u620f","69":"\u6559\u80b2"}}};
        for(var key in category_tree[cate1_id]['children'])
        {
            var opt = document.createElement('option');
            opt.value = key;
            opt.text = category_tree[cate1_id]['children'][key];
            cate2.options.add(opt);
        }
    }

	//自动填充
    function autoFill(column){
        if(column == 'isbn' && !G('isbn').value)
        {
            //alert("您还没有填写isbn！");
			G("isbn_label").innerHTML = "请填写ISBN后进行匹配";
            return false;
        }
        if(column == 'bookname' && checkBookName() || column == 'isbn' && G('isbn').value && checkISBN())
        {
            G('bookname_notice').innerHTML = "";
            G('auto_mask').style.width = document.body.clientWidth+"px";
            G('auto_mask').style.height = document.body.clientHeight+"px";
            G('auto_window').style.left = (document.body.clientWidth - 760)/2+"px";
            G('alert_win2').style.display='block';
            createXmlHttpRequestObject();
            var pars = "act=auto_fill&"+column+"="+trim(G(column).value);
            var url = "user_library/auto_fill.php?"+pars;
            url = encodeURI(url);
            xmlHttp.onreadystatechange = showOptions;
            xmlHttp.open("POST", url, true);
            xmlHttp.send(null);
            G('ajaxProcessTip').style.display = "block";
        }
    }

    function showOptions(){
        if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
            if(xmlHttp.responseText != ""){
                var books_text = xmlHttp.responseText;
                if(books_text.charAt(0) != '{' && books_text.charAt(0) != '[' ) {
                  G('bookname_notice').innerHTML = "数据查询失败，请稍后再试！！";
                    return false;
                }
                books_json = eval('('+books_text+')');
                var str = "<div class='book_list'><ul>";
                if(!books_json)
                {
                    G('bookname_notice').innerHTML = "抱歉，没有找到合适的信息！";
                    return false;
                }
                else
                {
                    for(var key in books_json)
                    {
                        var bookname = "<li class='one_book'><div class='book_img'><a href=javascript:getBookDetail('"+
                            books_json[key]['type']+"','"+books_json[key]['id']+"')><img src='";
                        if(books_json[key]['type'] > 0)
                            bookname += books_json[key]['image'];
                        else if(books_json[key]['image'] != "" && books_json[key]['image'] != 0){
                            bookname += "uploads/bi/m/" + books_json[key]['image'];
                        }else{
                            bookname += "page/images/default_book_pic.jpg";
                        }
                        bookname += "'/></a></div><div class='book_detail'><a href=javascript:getBookDetail('"+
                            books_json[key]['type']+"','"+books_json[key]['id']+"')>";
                        if(books_json[key]['title']) bookname += "<strong><font color=#f60>"+books_json[key]['title']+"</font></strong> / ";
                        if(books_json[key]['author']) bookname += books_json[key]['author']+" / ";
                        if(books_json[key]['publisher']) bookname += books_json[key]['publisher']+" / ";
                        if(books_json[key]['date']) bookname += books_json[key]['date']+" / ";
                        if(books_json[key]['price']) bookname += books_json[key]['price']+" / ";
                        if(books_json[key]['otherInfo']) bookname += books_json[key]['otherInfo'];
                        bookname += "</div></a></li>";
                        str += bookname;
                    }
                }
                str += "</ul></div>";
                G('bookname_notice').innerHTML = str;
            }
            else
            {
                G('bookname_notice').innerHTML = "抱歉，没有找到合适的信息！";
            }
        }
    }
    function SaveData() {
    	G('changed').value = "";
    	G('bookname').savevalue = G('bookname').value;
    	G('author').savevalue = G('author').value;
    	G('isbn').savevalue = G('isbn').value;
    	G('publisher').savevalue = G('publisher').value;
    	G('publishdate').savevalue = G('publishdate').value;
    	G('translator').savevalue = G('translator').value;
    	G('price').savevalue = G('price').value;
    	G('edition').savevalue = G('edition').value;
    	G('language').savevalue = G('language').selectedIndex;
    	G('pack').savevalue = G('pack').selectedIndex;
    	G('pages').savevalue = G('pages').value;
    	G('desc').savevalue = G('desc').value;
    	G('pictureShow').savevalue = G('pictureShow').src;
    	G('category1').savevalue = G('category1').selectedIndex;
    	G('category2').savevalue = G('category2').selectedIndex;
    }

    function CheckDataChanged() {
    	G('changed').value = (G('bookname').savevalue != G('bookname').value ||
    	G('author').savevalue != G('author').value ||
    	G('isbn').savevalue != G('isbn').value ||
    	G('publisher').savevalue != G('publisher').value ||
    	G('publishdate').savevalue != G('publishdate').value ||
    	G('translator').savevalue != G('translator').value ||
    	G('price').savevalue != G('price').value ||
    	G('edition').savevalue != G('edition').value ||
    	G('language').savevalue != G('language').selectedIndex ||
    	G('pack').savevalue != G('pack').selectedIndex ||
    	G('pages').savevalue != G('pages').value ||
    	G('desc').savevalue != G('desc').value ||
    	G('pictureShow').savevalue != G('pictureShow').src ||
    	G('category1').savevalue != G('category1').selectedIndex ||
    	G('category2').savevalue != G('category2').selectedIndex)?"1":"";
    }
    function init_fill(key)
    {
        //G('alert_win2').style.display='none';
        G('bookname').value = books_json[key]['book_name'];
        G('author').value = books_json[key]['author'];
        G('isbn').value = books_json[key]['isbn13'];
        G('publisher').value = books_json[key]['publisher'];
        G('publishdate').value = books_json[key]['publish_date'];
        G('category1').value = books_json[key]['category1'];
        init_category2();
        G('category2').value = books_json[key]['category2'];
        G('price').value = books_json[key]['price'];
        G('edition').selectedIndex = books_json[key]['edition']-1;
        var languages = new Array('中文', '英文', '日文', '韩文', '法文', '德文', '西班牙', '其他');
        for(var i=0;i<languages.length;i++)
        {
            if(books_json[key]['language'] == languages[i])
                G('language').selectedIndex = i;
        }
        G('translator').value = books_json[key]['translator'];
        var packs = new Array('未知装订','平装','精装');
        for(var i=0;i<packs.length;i++)
        {
            if(books_json[key]['pack'] == packs[i])
                G('pack').selectedIndex = i;
        }
        G('pages').value = books_json[key]['pages'];
        if(books_json[key]['image'])
            G('selPicture_notice').innerHTML = '<img id="pictureShow"  width="100px" height="126px" border="0" src="uploads/bi/m/' + books_json[key]['image'] +'"/>';
        else
            G('selPicture_notice').innerHTML = '<img id="pictureShow"  width="100px" height="126px" border="0" src="page/images/default_book_pic.jpg"/>';

        G('desc').value = books_json[key]['description'];
        readOnlyBook();
        SaveData();
        formPubBook_action = "pubbook_result.php?act=act_pub_sale_book&source_type=0&library_id="+books_json[key]['library_id'];
    }

    function getBookDetail(type,id){
        G('alert_win2').style.display='none';
        createXmlHttpRequestObject();
        var pars = "act=get_book_detail&type="+type+"&book_id="+id;
        var url = "user_library/auto_fill.php?"+pars;
        if(type == 0)
            xmlHttp.onreadystatechange = fill_from_database;
        else if(type > 0)
        {
            xmlHttp.onreadystatechange = fill_from_inet;
            formPubBook_action = "pubbook_result.php?act=act_pub_sale_book&source_type="+type+"&isbn=";
        }
        xmlHttp.open("POST", url, true);
        xmlHttp.send(null);
        G('ajaxProcessTip').style.display = "block";
    }
    function fill_from_database()
    {
      if(xmlHttp.readyState == 4 && xmlHttp.status === 200)
          {
          G('ajaxProcessTip').style.display = "none";
          if(xmlHttp.responseText != "")
          {
          var book_text = xmlHttp.responseText;
          if(book_text.charAt(0) != '{' && book_text.charAt(0) != '[' ) {
              G('bookname_notice').innerHTML = "数据查询失败，请稍后再试！";
              return false;
          }
          var book_json = eval('('+book_text+')');
          if(!book_json) {
              G('bookname_notice').innerHTML = "抱歉，没有找到合适的信息！";
              return false;
          }

          G('bookname').value = book_json['book_name'];
          G('author').value = book_json['author'];
          G('isbn').value = book_json['isbn13'];
          G('publisher').value = book_json['publisher'];
          G('publishdate').value = book_json['publish_date'];
          G('category1').value = book_json['category1'];
          init_category2();
          G('category2').value = book_json['category2'];
          G('price').value = book_json['price'];
          G('edition').selectedIndex = book_json['edition']-1;
          var languages = new Array('中文', '英文', '日文', '韩文', '法文', '德文', '西班牙', '其他');
          for(var i=0;i<languages.length;i++)
            {
                if(book_json['language'] == languages[i])
                    G('language').selectedIndex = i;
            }
              G('translator').value = book_json['translator'];
              var packs = new Array('未知装订','平装','精装');
              for(var i=0;i<packs.length;i++)
              {
                  if(book_json['pack'] == packs[i])
                      G('pack').selectedIndex = i;
              }

                G('pages').value = book_json['pages'];
                G('selPicture_notice').innerHTML = '<img id="pictureShow"  width="100px" height="126px" border="0" src="uploads/bi/s/' + book_json['image'] +'"/>';
                G('desc').value = book_json['description'];
                readOnlyBook();
                SaveData();
                formPubBook_action = "pubbook_result.php?act=act_pub_sale_book&source_type=0&library_id="+book_json['library_id'];
            }
        }
    }
    function fill_from_inet()
    {
        if(xmlHttp.readyState == 4 && xmlHttp.status === 200)
        {
            G('ajaxProcessTip').style.display = "none";
            if(xmlHttp.responseText != "")
            {
                var book_text = xmlHttp.responseText;
                if(book_text.charAt(0) != '{' && book_text.charAt(0) != '[') {
                    G('bookname_notice').innerHTML = "数据查询失败，请稍后再试！";
                    return false;
                }
                var book_json = eval('('+book_text+')');
                if(!book_json) {
                G('bookname_notice').innerHTML = "抱歉，没有找到合适的信息！";
                    return false;
                }

                if("点击上传封面图片" == book_json['title']) {
                    book_json['title'] = "";
                    book_json['image'] = "";
                }
                G('bookname').value = book_json['title']?book_json['title']:'';
                G('author').value = book_json['author']?book_json['author']:'';
                G('isbn').value = book_json['isbn13']?book_json['isbn13']:'';
                G('publisher').value = book_json['publisher']?book_json['publisher']:'';
                G('publishdate').value = book_json['date']?book_json['date']:'';
                if(book_json['price'])
                {
                    if(book_json['price'][0] == '$' || book_json['price'][0] == '￥')
                    {
                        G('price').value = parseFloat(book_json['price'].substr(1));
                    }
                    else
                    {
                        G('price').value = parseFloat(book_json['price']);
                    }
                }
                else
                {
                    G('price').value = 0;
                }
                if(G('price').value == "NaN")
                    G('price').value = 0;
                G('edition').selectedIndex = book_json['edition']-1;
                var languages = new Array('中文', '英文', '日文', '韩文', '法文', '德文', '西班牙', '其他');
                for(var i=0;i<languages.length;i++)
                {
                    if(book_json['language'] == languages[i])
                        G('language').selectedIndex = i;
                }
                G('translator').value = book_json['translator']?book_json['translator']:'';
                var packs = new Array('未知装订','平装','精装');
                for(var i=0;i<packs.length;i++)
                {
                    if(book_json['pack'] == packs[i])
                        G('pack').selectedIndex = i;
                }
                G('pages').value = book_json['pages']?book_json['pages']:'';

                if(!G('picture'))
                {
                    G('selPicture_notice').innerHTML = '<img id="pictureShow"  width="100px" height="126px" border="0" src="' + book_json['image'] +'"/><input type="hidden" name="picture" id="picture" value="' + book_json['image'] +'"/>';
                }
                else
                {
                    G('picture').value = book_json['image'];
                    if(G('pictureShow')) {
                                          G('pictureShow').src = book_json['image'];
                                      }
                }
                G('desc').value = book_json['description']?book_json['description']:'';
                readOnlyBook();
                SetSelectReadWrite(G('category1'));
                G('category1').style.background = "";
                SetSelectReadWrite(G('category2'));
                G('category2').style.background = "";
                formPubBook_action += book_json['isbn13']
            }
        }
    }

    function SetSelectReadOnly(obj){
        if(obj){
             //obj.onbeforeactivate = function(){return false;};
             //obj.onfocus = function(){obj.blur();};
             obj.disabled = true;
         }
    }

    function SetSelectReadWrite(obj){
        if(obj){
             //obj.onbeforeactivate = null;
             //obj.onfocus = null;
             obj.disabled = false;
         }
    }

    function readOnlyBook()
    {
        if(!isEmptyString(G('bookname').value)) {
            G('bookname').readOnly = true;
            G('bookname').style.background = "#e1e1e1";
        }
        if(!isEmptyString(G('author').value)) {
            G('author').readOnly = true;
            G('author').style.background = "#e1e1e1";
        }
        if(!isEmptyString(G('isbn').value)) {
            //G('isbn').readOnly = true;
            //G('isbn').style.background = "#e1e1e1";
        }
        if(!isEmptyString(G('publisher').value)) {
            G('publisher').readOnly = true;
            G('publisher').style.background = "#e1e1e1";
        }
        if(!isEmptyString(G('publishdate').value)) {
            G('publishdate').readOnly = true;
            G('publishdate').style.background = "#e1e1e1";
        }
        SetSelectReadOnly(G('category1'));
        G('category1').style.background = "#e1e1e1";
        SetSelectReadOnly(G('category2'));
        G('category2').style.background = "#e1e1e1";
        if(isEmptyString(G('price').value) || G('price').value=="0") {
            //alert(G('price').value);
        } else {
            G('price').readOnly = true;
            G('price').style.background = "#e1e1e1";
        }

        SetSelectReadOnly(G('edition'));
        G('edition').style.background = "#e1e1e1";
        SetSelectReadOnly(G('language'));
        G('language').style.background = "#e1e1e1";
        if(!isEmptyString(G('translator').value)) {
            G('translator').readOnly = true;
            G('translator').style.background = "#e1e1e1";
        }
        if(!isEmptyString(G('pack').selectedIndex) && G('pack').selectedIndex!="0") {
            SetSelectReadOnly(G('pack'));
            G('pack').style.background = "#e1e1e1";
        }
        if(isEmptyString(G('pages').value) || G('pages').value=="0") {
            //alert(G('pages').value);
        } else {
            G('pages').readOnly = true;
            G('pages').style.background = "#e1e1e1";
        }
        if(G('pictureShow') && !isEmptyString(G('pictureShow').src) && G('pictureShow').src.indexOf("page/images/default_book_pic.jpg") == -1) {
            G("selPicture").disabled = true;
            G("upload").disabled = true;
        }
        if(!isEmptyString(G('desc').value)) {
            G('desc').readOnly = true;
            G('desc').style.background = "#e1e1e1";
        }
    }


    function readWriteBook()
    {
        G('bookname').readOnly = false;
        G('bookname').style.background = "";
        G('author').readOnly = false;
        G('author').style.background = "";
        G('isbn').readOnly = false;
        G('isbn').style.background = "";
        G('publisher').readOnly = false;
        G('publisher').style.background = "";
        G('publishdate').readOnly = false;
        G('publishdate').style.background = "";
        SetSelectReadWrite(G('category1'));
        G('category1').style.background = "";
        SetSelectReadWrite(G('category2'));
        G('category2').style.background = "";
        G('price').readOnly = false;
        G('price').style.background = "";
        SetSelectReadWrite(G('edition'));
        G('edition').style.background = "";
        SetSelectReadWrite(G('language'));
        G('language').style.background = "";
        G('translator').readOnly = false;
        G('translator').style.background = "";
        SetSelectReadWrite(G('pack'));
        G('pack').style.background = "";
        G('pages').readOnly = false;
        G('pages').style.background = "";
        G("selPicture").disabled = false;
        G("upload").disabled = false;
        G('desc').readOnly = false;
        G('desc').style.background = "";
    }

    function my_reset()
    {
        readWriteBook();
        G('selPicture_notice').innerHTML = "";
        formPubBook_action = "pubbook_result.php?act=act_pub_sale_book";
    }

    function checkISBN()
    {
        if(trim(G('isbn').value))
        {
            var isbn = trim(G('isbn').value);
            var patrn10 = /^[0-9]{10}$/;
            var patrn13 = /^[0-9]{13}$/;
            if(!patrn10.exec(isbn) && !patrn13.exec(isbn))
            {
                G("isbn_label").innerHTML = "ISBN为10位或13位数字或者为空";
                return false;
            }else{
                G("isbn_label").innerHTML = "<img src='page//images/success.gif' />";
            }
        }else{
            G("isbn_label").innerHTML = "";
        }
        return true;
    }
    function checkBookName()
    {
        if(!trim(G('bookname').value))
        {
            G("book_name_label").innerHTML = "书名不能为空";
            return false;
        }else{
            G("book_name_label").innerHTML = "<img src='page//images/success.gif' />";
            return true;
        }
    }
    function checkAuthor()
    {
        if(!trim(G('author').value))
        {
            G("author_label").innerHTML = "作者不能为空";
            return false;
        }else{
            G("author_label").innerHTML = "<img src='page//images/success.gif' />";
            return true;
        }
    }
    function checkPublisher()
    {
        if(!trim(G('publisher').value))
        {
            G("publisher_label").innerHTML = "出版社不能为空";
            return false;
        }else{
            G("publisher_label").innerHTML = "<img src='page//images/success.gif' />";
            return true;
        }
    }

    function checkCategory()
    {
        if(G('category2').value < 1)
        {
            G("category_label").innerHTML = "您还没有选择分类";
            return false;
        }
        G("category_label").innerHTML = "<img src='page//images/success.gif' />";
        return true;
    }
    function checkPrice()
    {
        if(!trim(G('price').value))
        {
            G("price_label").innerHTML = "原价不能为空";
            return false;
        }
        else
        {
            var price = trim(G('price').value);
            //var patrn = /^(0|([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
            var patrn = /^(0|([1-9][0-9]*)|([0-9]\.[0-9]+)|([1-9][0-9]+\.[0-9]+))$/;
            if(!patrn.exec(price))
            {
                //alert("原价必须是非负整数或小数！");
                G("price_label").innerHTML = "原价必须是非负整数或小数！";
                return false;
            }
        }
        G("price_label").innerHTML = "<img src='page//images/success.gif' />";
        return true;
    }
    function checkPages()
    {
        if(trim(G('pages').value))
        {
            var u_number = trim(G('pages').value);
            var patrn = /^(0|([1-9][0-9]*))$/;
            if(!patrn.exec(u_number))
            {
                G("pages_label").innerHTML = "页码必须是非负整数！";
                return false;
            }else{
                G("pages_label").innerHTML = "<img src='page//images/success.gif' />";
            }
        }else{
            G("pages_label").innerHTML = "";
        }
        return true;
    }
    function checkAgingdegree()
    {
        if(G('u_agingdegree').value < 1)
        {
            G("agingdegree_label").innerHTML = "您还没有选择新旧程度";
            return false;
        }
        G("agingdegree_label").innerHTML = "<img src='page//images/success.gif' />";
        return true;
    }
    function checkSalePrice()
    {
        if(!trim(G('u_price').value))
        {
			if(G("free_of_cost").value=="1"){
				G("nowprice_label").innerHTML = "<img src='page//images/success.gif' />";
				return true;
			}else{
				G("nowprice_label").innerHTML = "您还没有填写售价";
				return false;
			}
        }
        else
        {
            var u_price = trim(G('u_price').value);
            //var patrn = /^(0|([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
            var patrn = /^(0|([1-9][0-9]*)|([0-9]\.[0-9]+)|([1-9][0-9]+\.[0-9]+))$/;
            if(!patrn.exec(u_price))
            {
                G("nowprice_label").innerHTML = "售价必须是非负整数或小数！";
                return false;
            }
        }
        G("nowprice_label").innerHTML = "<img src='page//images/success.gif' />";
        return true;
    }
    function checkNumber()
    {
        if(!trim(G('u_number').value))
        {
            G("number_label").innerHTML = "您还没有填写数量";
            return false;
        }
        else
        {
            var u_number = trim(G('u_number').value);
            var patrn = /^[1-9][0-9]*$/;
            if(!patrn.exec(u_number))
            {
                G("number_label").innerHTML = "数量必须是正整数";
                return false;
            }
        }
        G("number_label").innerHTML = "<img src='page//images/success.gif' />";
        return true;
    }

    //插入数据验证
    function checkCode()
    {
        if(G("captcha_code").value == ""){
            G("check_user_checkcode").innerHTML = "验证码不能为空";
            alert("请正确填写发布图书所需的相关信息！");
            return false;
        }else if(getStrLength(G("captcha_code").value) != 4){
            G("check_user_checkcode").innerHTML = "验证码长度不合法";
            alert("请正确填写发布图书所需的相关信息！");
            return false;
        }else{
            createXmlHttpRequestObject();
            var pars = "code="+G("captcha_code").value;
            var url = "user_library/checkCode.php?"+pars;
            xmlHttp.onreadystatechange = checkCodeResult;
            xmlHttp.open("get", url, true);
            xmlHttp.send(null);
            G('ajaxProcessTip').style.display = "block";
            return true;
        //}else{
        //	G("check_user_checkcode").innerHTML = "";
        //	return true;
        }
    }
    function checkCodeResult()
    {
        if(xmlHttp.readyState == 4 && xmlHttp.status === 200)
        {
            G('ajaxProcessTip').style.display = "none";
            var result = xmlHttp.responseText;
            if(result == "1")
            {
                G("check_user_checkcode").innerHTML = "";
                  var submitForm = G('formPubBook');
                  submitForm.setAttribute("target","_self");
                  submitForm.setAttribute("action",formPubBook_action);
                  submitForm.setAttribute("method","post");
                  submitForm.setAttribute("enctype","application/x-www-form-urlencoded");
                  submitForm.setAttribute("encoding","application/x-www-form-urlencoded");
                  if("" == "")
                  {
                      G('login_mask').style.width = document.body.clientWidth+"px";
                      G('login_mask').style.height = document.body.clientHeight+"px";
                      G('login_window').style.left = (document.body.clientWidth - 500)/2+"px";
                      G('alert_win').style.display='block';
                      return false;
                  }
                  SetSelectReadWrite(G('category1'));
                  SetSelectReadWrite(G('category2'));
                  SetSelectReadWrite(G('language'));
                  SetSelectReadWrite(G('edition'));
                  SetSelectReadWrite(G('pack'));
                  CheckDataChanged();
                  submitForm.submit();
            }
            else
            {
                checkCodestatus = -1;
                G("check_user_checkcode").innerHTML = "验证码错误";
                alert("请正确填写发布图书所需的相关信息！");
            }
        }
    }

    //输入数据进行检查
    function checkSubmit()
    {
        window.location.hash="login_page_anchor";
        if(!(checkBookName() && checkAuthor() && checkISBN() && checkPublisher()  && checkPrice() && checkPages() && checkCategory() && checkNumber()  && checkSalePrice() && checkAgingdegree() ))
        {
            alert("请正确填写发布图书所需的相关信息！");
            return false;
        }
        checkCode();
        return false;
     }

     //检查是否免费赠书
     function checkFree(){
	   	if(G("free_send").checked){
	     	G("free_of_cost").value="1";
			G("nowprice_label").innerHTML = "<img src='page//images/success.gif' />";
			G("u_price").value = "";
			G("u_price").readOnly = true;
			G("u_price").style.background = "#e1e1e1";
			SetSelectReadOnly(G("u_price"));
			G("u_selPrice").value = "0";	
			G("u_selPrice").readOnly = true;
			G("u_selPrice").style.background = "#e1e1e1";
			SetSelectReadOnly(G("u_selPrice"));
        }else{
			G("free_of_cost").value="0";
			G("nowprice_label").innerHTML = "";
			G("u_price").readOnly = false;
			G("u_price").style.background = "";
			SetSelectReadWrite(G("u_price"));		
			G("u_selPrice").readOnly = false;
			G("u_selPrice").style.background = "";
			SetSelectReadWrite(G("u_selPrice"));
		}
     }

     function checkLoginSubmit(){
          if(checkUserEmail() && checkUserPwd()){
            createXmlHttpRequestObject();
            var pars = "user_email="+G("user_email").value+"&user_pwd="+hex_md5(G("user_pwd").value);
            var url = "login_result.php?"+pars;
            xmlHttp.onreadystatechange = loginResponse;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
            G('ajaxProcessTip').style.display = "block";
        }else{
            alert("请正确填写登录信息！");
        }
    }

    function loginResponse(){
        if(xmlHttp.readyState == 4 && xmlHttp.status === 200){
            G('ajaxProcessTip').style.display = "none";
            if(xmlHttp.responseText == "1"){
                setCookie("saveCookie", G("saveCookie").checked, 24, "/");
                if(G("saveCookie").checked){
                    setCookie("user_email", G("user_email").value, 24, "/");
                    setCookie("user_pwd", hex_md5(G("user_pwd").value), 24, "/");
                }else{
                    setCookie("user_email","",24,"/");
                    setCookie("user_pwd","",24,"/");
                }
                G('alert_win').style.display='none';
                SetSelectReadWrite(G('category1'));
                SetSelectReadWrite(G('category2'));
                SetSelectReadWrite(G('language'));
                SetSelectReadWrite(G('edition'));
                SetSelectReadWrite(G('pack'));
                G('formPubBook').submit();
            } else if(xmlHttp.responseText && xmlHttp.responseText.charAt(0) == '<') {
                alert("网络连接失败，请稍后再试！");
            }
            else{
                alert(xmlHttp.responseText);
            }
        }
    }

    function getStrLength(str) {
        var cArr = str.match(/[^\x00-\xff]/ig);
        return str.length + (cArr == null ? 0 : cArr.length);

    }
    function checkUserEmail()
    {
        var user_email = G("user_email").value;
        var patrn = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
        if(!user_email)
        {
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

    function checkUserPwd()
    {
        var user_pwd = G("user_pwd").value;
        var len = getStrLength(user_pwd);
        if(!user_pwd)
        {
            G("check_user_pwd").innerHTML = "密码不能为空";
            return false;
        }else if(len<6 || len>16){
            G("check_user_pwd").innerHTML = "密码长度不合法";
            return false;
        }else{
            G("check_user_pwd").innerHTML = "<img src='page//images/success.gif' />";
            return true;
        }
    }

</script>
<%@ include file="col6.jsp" %>
<%@ include file="col7.jsp" %>
</body>

</html>

