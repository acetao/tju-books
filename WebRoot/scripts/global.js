//所有公用的js
function submitForm(myCurrentPage){
	var currentPage =  document.getElementById("currentPage");
	currentPage.value = myCurrentPage;
	var form = document.getElementById("searchForm");
	form.submit();
}

function G(elementId){
  if(document.getElementById){
    return eval('document.getElementById("' + elementId + '")');
  }else{
    return eval('document.all.' + elementId);
  }
}

function getStrLength(str){
  return str.length;
}

function myStrLength(str){
  return str.replace(/[^\x00-\xff]/g,"xx").length;
}

//校验是否全由数字组成
function isDigit(s)
{
  var patrn=/^[0-9]+$/;
  if (!patrn.exec(s))
    return false;
  return true;
}

//去掉左右空格
function trim(str)
{
  return str.replace(/(^\s*)|(\s*$)/g, '');
}

//ajax请求
var xmlHttp;
function createXmlHttpRequestObject(){
  try {
    xmlHttp = new XMLHttpRequest();
  } catch (trymicrosoft) {
    try {
      xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (othermicrosoft) {
      try {
	xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (failed) {
	xmlHttp = false;
      }
    }
  }
  if (!xmlHttp){
    alert("无法创建 XMLHttpRequest 对象！");
  }
}

//截取字符串长度，区别中英文
function mysubstr(str, len)
{
  if( ! str || ! len)
    {
      return '';
    }
  // 预期计数：中文2字节，英文1字节
  var a = 0;
  // 循环计数
  var i = 0;
  // 临时字串
  var temp = '';
  for (i = 0; i < str.length; i ++ )
    {
      if (str.charCodeAt(i) > 255)
	{
	  // 按照预期计数增加2
	  a += 2;
	}
      else
	{
	  a ++ ;
	}
      // 如果增加计数后长度大于限定长度，就直接返回临时字符串
      if(a > len)
	{
	  return temp;
	}
      // 将当前内容加到临时字符串
      temp += str.charAt(i);
    }
  // 如果全部是单字节字符，就直接返回源字符串
  return str;
}


//排序方法
function myarray(data){

  for(var i = 0; i < data.length; i++){
    for(var j = i+1; j < data.length; j++){
      var temp;
      if(data[i]['image'] == null || data[i]['image'] == ""){
	temp = data[i];
	data[i] = data[j];
	data[j] = temp;
      }
    }
  }
  return data;
}

function addLoadEvent(func){
    var oldonload=window.onload;
    if(typeof window.onload != "function"){
        window.onload=func;
    }else{
        window.onload=function(){
            oldonload();
            func();
        }
    }
}