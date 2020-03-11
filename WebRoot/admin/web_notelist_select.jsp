<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body style="background-color:#9999CC;;margin: 0;">
<div>
<center>
	<h1>留言管理</h1>
	<hr>
	<br>
	<%
		// 编码转换
		request.setCharacterEncoding("GB2312") ;
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
	<%
		// 如果有内容，则修改变量i，如果没有，则根据i的值进行无内容提示
		int i = 0 ;
		//String keyword = request.getParameter("yy") ;
		List all = null ;
		all = (List)request.getAttribute("all") ;
	%>
<form action="Note.tttt" method="POST">
	请输入查询内容：<input type="text" name="keyword">
	<input type="hidden" name="status" value="newsselectbylike">
	<input type="submit" value="查询">
</form>
<table width="80%" border="1">
	<tr>
		<td>公告ID</td>
		<td>新闻内容</td>
		<td>信息删除</td>
		<td>修改更新</td>
	</tr>
	<%
			Iterator iter = all.iterator() ;
			while(iter.hasNext())
			{
				 Note note = (Note)iter.next() ;
				i++ ;
				// 进行循环打印，打印出所有的内容，以表格形式
				// 从数据库中取出内容
				int id = note.getId() ;
				String name = note.getName() ;
				
	%>
	
				<tr>
					<td><%=id %></td>
					<td><%=name %></td>
					<td><a href="Note.tttt?id=<%=id%>&status=newsdelete">信息删除</a></td>
					<td><a href="Note.tttt?id=<%=id%>&status=newsselectid">修改更新</a></td>
				</tr>
				
				
	<%
			}
			// 判断i的值是否改变，如果改变，则表示有内容，反之，无内容
			if(i==0)
			{
				// 进行提示
	%>
				<tr>
					<td colspan="5">没有任何内容！！！</td>
				</tr>
	<%
			}
	%>
	</table>
		<h3><a href="web_notelist.jsp">回到新闻列表页</a></h3>
	<%
		}
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=../login.jsp") ;
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