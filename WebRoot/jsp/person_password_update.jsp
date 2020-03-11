<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>个人密码更新网页</title>
    
  </head>
  <body>
 			<%
 				String name = null;
	  			if(session.getAttribute("uname")!=null)
					{
						name = (String) session.getAttribute("uname");
						System.out.println("二次读取");
						System.out.println(name);
  				}
  			 %>
  <div style="width:600px; height:550px;">
		<form action="Note.tttt" method="post">
					<input type="hidden"    name="name" value=<%= name%> />
					原始密码<input type="password" name="_password" /><br />
					重设密码<input type="password" name="password" /><br />
					重复密码<input type="password" name="re_password" /><br />	
					<input type="hidden" name="status" value="person_password_update">
					<input type="submit" value="提交"  />
					
					<input type="reset"  />
		</form>
	</div>
  </body>
</html>
