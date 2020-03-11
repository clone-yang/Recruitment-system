<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'company_select_person.jsp' starting page</title>
    

  </head>
  
  <body style="text-align:center;">
  <form action="Note.tttt" method="post">
 	 毕业学校：<input type="text" name="school" /><br /><br />
   	 所学专业：<input type="text" name="edu_class" /><br /><br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="status" value="company_select1">
	<input type="submit" value="搜索" />
  </form>
  <br /><br />
  <form action="Note.tttt" method="post">
  	应聘岗位：<input type="text" name="job" /><br /><br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="status" value="company_select2">
	<input type="submit" value="搜索" /><br /><br />
  </form>
  </body>
</html>
