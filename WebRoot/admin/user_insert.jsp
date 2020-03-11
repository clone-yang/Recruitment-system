<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body style="background-color:#9999CC; margin: 0;">
<div>
<center>
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
				<td colspan="2">系统用户添加</td>
			</tr>
			<tr>
				<td height="15"></td>
			</tr>
			<tr>
				<td>用户姓名：</td>
				<td><input type="text" name="name" /></td>
			</tr>
			
			<tr>
				<td>用户密码：</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="status" value="userinsert">
					<input type="submit" value="添加">
					<input type="reset" value="重置">
				</td>
			</tr>
		</table>
	</form>
	<h3><a href="userlist.jsp">回到用户列表页</a></h3>
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