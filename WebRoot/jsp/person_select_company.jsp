<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'company_select_person.jsp' starting page</title>
    

  </head>
  
  <body style="text-align:center;">
  <form action="Note.tttt" method="post">
 	 岗位名称：<input type="text" name="positionname" /><br /><br />
               学历要求：<input type="text" name="education" /><br /><br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="status" value="person_select1">
	<input type="submit" value="搜索" />
  </form>
  <br /><br />
  <form action="Note.tttt" method="post">
  	单位名称：<input type="text" name="fullname" /><br /><br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="status" value="person_select2">
	<input type="submit" value="搜索" /><br /><br />
  </form>
  </body>
</html>