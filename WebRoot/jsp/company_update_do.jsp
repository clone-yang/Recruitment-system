<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body style="background-color:#CCCCCC;margin: 0;">
<div>
<center>
	<h1>更新信息提示界面</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>	
	<%
			//response.setHeader("refresh","2;URL=company.jsp") ;
			
			boolean b = ((Boolean)request.getAttribute("flag")).booleanValue() ;
			if(b)
			{
				
	%>
				岗位信息更新成功，您可以进行其他相关操作！
				
	<%
			}
			else
			{
	%>
				新闻信息更新失败，请重试！！！<br>
				
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
	<%
		}
	%>
</center>
</div>
</body>
</html>