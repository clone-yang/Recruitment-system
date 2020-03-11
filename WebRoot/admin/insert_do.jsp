<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body style="background-color:#9999CC;margin: 0;">
<div>
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
			response.setHeader("refresh","2;URL=userlist.jsp") ;
			boolean b = ((Boolean)request.getAttribute("flag")).booleanValue() ;
			if(b)
			{
	%>
				用户添加成功，两秒后跳转到用户列表页！！！<br>
				如果没有跳转，请按<a href="userlist.jsp">这里</a>！！！
	<%
			}
			else
			{
	%>
				用户添加失败，两秒后跳转到用户列表页！！！<br>
				如果没有跳转，请按<a href="userlist.jsp">这里</a>！！！
	<%
			}
	%>
	<%
		}
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=login.jsp") ;
	%>
			您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a href="login.jsp">这里</a>！！！<br>
	<%
		}
	%>
</center>
</div>
</body>
</html>