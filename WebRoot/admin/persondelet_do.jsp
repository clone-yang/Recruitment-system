<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body style="background-color:#9999CC;margin: 0;">
<div>
<center>
	<h1>删除信息提示界面</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>	
	<%
			response.setHeader("refresh","2;URL=personlist.jsp") ;
			boolean b = ((Boolean)request.getAttribute("flag")).booleanValue() ;
			if(b)
			{
				
	%>
				个人信息删除成功，两秒后跳转到个人列表页！！！<br>
				如果没有跳转，请按<a href="personlist.jsp">这里</a>！！！
	<%
			}
			else
			{
	%>
				删除个人信息失败，两秒后跳转到个人列表页！！！<br>
				如果没有跳转，请按<a href="personlist.jsp">这里</a>！！！
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
	<%
		}
	%>
</center>
</div>
</body>
</html>