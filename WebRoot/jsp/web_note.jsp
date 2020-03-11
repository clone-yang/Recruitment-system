<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'web_note.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  					<center>
						<h2 style="color:#FF0000;">站务公告</h2>
					</center>
  			<% 
				DB3 db=new DB3();
			%>
			<%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				String sql = "select * from news order by id desc";
				ResultSet rs=db.executeQuery(sql);
				
			 %>
			<%
			// 如果有内容，则修改变量i，如果没有，则根据i的值进行无内容提示
			int i = 0 ;
			//String keyword = request.getParameter("keyword") ;
			List all =new ArrayList() ;
			//all = (List)request.getAttribute("all") ;
			%>
			<%
					for(int j=0; j<2;j++){
						if(rs.next()) 
						{
					
						int id = rs.getInt("id");
						String name = rs.getString("name");
						
						Note note= new Note() ;
						
						note.setName(rs.getString(2)) ;
						all.add(note) ;
						}
				        }
			%>			
			<%
										Iterator iter = all.iterator() ;
										while(iter.hasNext())
										{
											 Note note= (Note)iter.next() ;
											i++ ;
											// 进行循环打印，打印出所有的内容，以表格形式
											// 从数据库中取出内容
											String name= note.getName() ;
										%>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=name %><br/>
					<%
										}
					%>
							
  </body>
</html>
