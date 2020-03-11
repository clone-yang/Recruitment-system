<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body>
<div style="background-color:#CCCCCC; height:670px;">
<center>
	<h1>用户管理</h1>
	<hr>
	<br>
	<%
		// 进行乱码处理
		request.setCharacterEncoding("GB2312") ;
	%>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
	<%
			response.setHeader("refresh","5;URL=../index.jsp") ;
			boolean b = ((Boolean)request.getAttribute("flag")).booleanValue() ;
			if(b)
			{
	%>
				<h3 style="color: red">用户注册成功，五秒后跳转到主页，请重新登录进行相关操作！！！</h3>
				如果没有跳转，请按<a href="../index.jsp">这里</a>！！！
	<%
			}
			else
			{
	%>
				<h2>用户注册失败，换个注册名或者请请仔细检查所填选项</h2>
				五秒后跳转到主页,如果没有跳转，请按<a href="../index.jsp">这里</a>！！！
	<%
			}
	%>
	<%
		}
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=../index.jsp") ;
	%>
			您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a href="../index.jsp">这里</a>！！！<br>
	<%
		}
	%>
</center>
</div>
</body>
</html>


