<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<title></title>
		<script type="text/javascript">
			//显示系统时间
			function updateTime(){
		  			var d=new Date();
		   		//var time=d.getYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
		   		var time=d.toLocaleString(); 
		   		document.getElementById("time").innerHTML=time;
		   		setTimeout("updateTime()",1000);
		   	}
		   	window.attachEvent("onload",updateTime);
		</script>
        <link href="../css/test.css" rel="stylesheet" type="text/css">
  </head>
<body style="text-align:center;">  
<div style="width:800px; height:130px;">
  <div style="padding-top:103px;width:800px; height:130px;">
	  <span><a style="text-decoration:none;" href="index.jsp">网站首页</a></span>
	  <span><a style="text-decoration:none;" href="/test1/jsp/news.jsp">新闻动态</a></span>
	  <span id="time" style="margin-left:100px;color:#0000ff;"></span>
  </div>
</div>
</body>
</html>