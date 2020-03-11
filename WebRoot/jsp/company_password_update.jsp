<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>更新密码网页</title>
    
  </head>
  <body>
 			<%
 				String companyname = null;
	  			if(session.getAttribute("uname")!=null)
					{
						companyname = (String) session.getAttribute("uname");
						System.out.println("二次读取");
  				}
  			 %>
  <div style="width:600px; height:550px; text-align: center;">
		<form action="Note.tttt" method="post">
					<input type="hidden"    name="companyname" value="<%=companyname%>" />
					原始密码<input type="password" name="_companypassword" /><br />
					重设密码<input type="password" name="companypassword" /><br />
					重复密码<input type="password" name="re_companypassword" /><br />	
					<input type="hidden" name="status" value="company_password_update">
					<input type="submit" value="提交"  />
					<input type="reset"  />
		</form>
	</div>
  </body>
</html>
