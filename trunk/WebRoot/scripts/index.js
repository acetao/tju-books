function getRecommend(){
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp =  new XMLHttpRequest();
	}
	else{
		xmlhttp =  new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("GET","/TjuBooks/recommend.action",false);
	xmlhttp.send();
}