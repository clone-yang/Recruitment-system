<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>新闻管理</title>
</head>
<body style="background:#9999CC;margin: 0;">
	<div>
		<center>
		<h2><font color="blue">公告管理</font>  </h2>
		<br />
		<br />
			<%
		// 如果有内容，则修改变量i，如果没有，则根据i的值进行无内容提示
		int i = 0 ;
		//String keyword = request.getParameter("yy") ;
		List all = null ;
		all = (List)request.getAttribute("all") ;
	%>

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
	
				<form action="Note.tttt" method="post">
				<input type="hidden" name="id" value="<%=id %>">
					<table>
						<tr>
							<td style="color: #FF3399;">
								新<br>
								闻<br>
								内<br>
								容<br>
							</td>
							<td width="10px;"></td>
							<td><textarea name="name" cols="30" rows="6"><%=name %></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td width="10px;"></td>
							<td style="text-align: center;">
								<input type="hidden" name="status" value="newsupdate">
								<input type="submit" value="更新">
								<input type="reset" value="重置">
							</td>
						</tr>
					</table>
				</form>
				<%
					}
				%>
			
			</table>
		 	<h3><a href="../admin/web_notelist.jsp">回到公告列表页</a></h3> 
		</center>
	</div>
</body>
</html>



