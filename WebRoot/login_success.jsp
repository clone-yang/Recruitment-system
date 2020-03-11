<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>网上招聘系统</title>
	<style>
	   html,body
	   {
	     margin:0px;
	     padding:0px;
		 text-align:center;
	   }
	   #bg-pic
	   {
	     background:url(pic/lg.jpg) no-repeat;
		 width:1000px;
		 height:692px;
	   }
	.STYLE1 {
	color: #00CCFF;
	font-weight: bold;
	text-decoration: blink;
}
    </style>
</head>
<body>
<div id="bg-pic">
<center>
   <br/>
     <br/>
      <br/>
	<h1 class="STYLE1">管理员登陆</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
			<h2 class="STYLE1">登陆成功</h2>
			<h2 class="STYLE1">欢迎<font color="red" size="10">
				<%=session.getAttribute("uname")%>
			</font>登陆</h2>
			<h3><a href="admin/personlist.jsp"><span class="STYLE1">进入个人信息管理页面</span></a></h3>
			<h3><a href="admin/companylist.jsp"><span class="STYLE1">进入岗位管信息理页面</span></a></h3>
			<h3><a href="admin/userlist.jsp"><span class="STYLE1">进入用户信息管理页面</span></a></h3>
			<h3><a href="admin/web_notelist.jsp"><span class="STYLE1">进入站务公告管理页面</span></a></h3>
	<%
		}
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","5;URL=login.jsp") ;
	%>
			<h2 style="color:#FF0000;">您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a style="color:#00FF00;" href="login.jsp">这里</a>！！！</h2><br>
	<%
		}
	%>
</center>
</div>
</body>
</html>