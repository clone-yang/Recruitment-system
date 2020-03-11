<%@ page language="java" pageEncoding="UTF-8"%>


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

<div style="text-align:left; width:980px; height:130px;">
	<div style="padding-top:103px; padding-left:200px;">
	 <!--span><a href="index.jsp">网站首页</a></span>
	  <span><a href="/test/job.jsp">职位信息</a></span>
	  <span><a href="/test/person.jsp">人才信息</a></span>
	  <span style="padding-left:50px;"><a href="/test1/jsp/news.jsp">新闻动态</a></span-->
	  	<div style="color:#0000ff; padding-left: 50px;"><span id="time"></span></div>
	</div>
</div>

