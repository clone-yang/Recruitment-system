<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>网上招聘系统</title>
</head>
<body style="height:520px;">
	<div>
		<center><h2><font color="blue">个人信息预览</font></h2>
		<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
		%>
				<% 
					DB3 db=new DB3();
				%>
				<%
					request.setCharacterEncoding("utf-8");
					response.setCharacterEncoding("utf-8");
					String sql = "select fileplace from person where name='"+(String) session.getAttribute("uname")+"'";
					System.out.println(sql);
					ResultSet rs=db.executeQuery(sql);
					
				 %>
				<%
				int i = 0 ;
				List all =new ArrayList() ;
				%>
				<%
					if(rs.next()) 
						{
					
						String fileplace = rs.getString("fileplace");
						
						Note note= new Note() ;
						
						note.setFileplace(rs.getString(1)) ;
						
						all.add(note) ;
						
				        }
				%>			
				<%
						Iterator iter = all.iterator() ;
						while(iter.hasNext())
						{
							 Note note= (Note)iter.next() ;
							i++ ;
							// 进行循环打印，打印出所有的内容，以表格形式
							String fileplace = note.getFileplace();
				%>
				<table width="200" border="1">
                  <tr>
                    <td colspan="3"><a href="xx.txt">xiazai</a></td>
                  </tr>
                </table>
		 	    <%
						}
		 	%>		
	   <%
		}
       %>
					
</center>
</div>
</body>
</html>