<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body style="background-color:#9999CC;margin: 0;">
<div>
<center>
	<h1>添加公告</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
	<form action="Note.tttt" method="post">
		<table>
			<tr>
				<td style="color: #FF3399;">
					新<br>
					添<br>
					内<br>
					容<br>
				</td>
				<td width="10px;"></td>
				<td><textarea name="name" cols="30" rows="6"></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td width="10px;"></td>
				<td style="text-align: center;">
					<input type="hidden" name="status" value="newsinsert">
					<input type="submit" value="添加">
					<input type="reset" value="重置">
				</td>
			</tr>
		</table>
	</form>
	<h3><a href="web_notelist.jsp">回到公告列表页</a></h3>
	<%
		}
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=login.jsp") ;
	%>
			您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a href="../login.jsp">这里</a>！！！<br>
	<%
		}
	%>
</center>
</div>
</body>
</html>