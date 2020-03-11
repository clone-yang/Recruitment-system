<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>个人简历更新（填写）</title>
    

    <style type="text/css">
<!--
.STYLE2 {color: #CC3300}
-->
    </style>
</head>
  <body style="background-color:#9999CC;">
	<center>
    <%
	  			if(session.getAttribute("uname")!=null)
					{
						
  			 %>
  			 <%
  				Note note = (Note)request.getAttribute("note") ;
  			 %>
			 <%
			 if(note!=null)
				{
							int id = note.getId() ;
							String name= note.getName() ;
							String password= note.getPassword() ;
							String realname = note.getRealname();
							String sex = note.getSex();
							String nation = note.getNation() ;
							String age = note.getAge() ;
							String marry = note.getMarry();
							String province = note.getProvince();
							String education = note.getEducation();
							String school = note.getSchool();
							String edu_class = note.getEdu_class();
							String language = note.getLanguage();
							String lang_level = note.getLang_level();
							String salary = note.getSalary();								
							String phone=note.getPhone();
							String email=note.getEmail();
							String address=note.getAddress();								
							String posts = note.getPosts();
							String job =note.getJob();
							String skills =note.getSkills();
							String experience = note.getExperience();
							String item_exp=note.getItem_exp();
							String introduce = note.getIntroduce();
							String fileplace = note.getFileplace();
						%>
											
		<form action="Note.tttt" method="post">
		<input type="hidden" name="name" value="<%=name %>" >
		  <table border="1">
            <tr>
              <td colspan="4" bgcolor="#6600FF">个人信息</td>
            </tr>
            <tr>
              <td>真实姓名：</td>
              <td><label>
                <input type="text" name="realname" value="<%=realname %>" >
              </label></td>
              <td>性 别：</td>
              <td><label>
                <input type="text" name="sex" value="<%=sex %>">
              </label></td>
            </tr>
			<tr>
              <td>年 龄：</td>
              <td><label>
                <input type="text" name="age" value="<%=age %>">
              </label></td>
              <td>名 族：</td>
              <td><label>
                <input type="text" name="nation" value="<%=nation %>">
              </label></td>
            </tr>
			<tr>
              <td>婚 否：</td>
              <td><label>
                <input type="text" name="marry" value="<%=marry %>">
              </label></td>
              <td>籍 贯：</td>
              <td><label>
                <input type="text" name="province" value="<%=province %>">
              </label></td>
            </tr>
            <tr>
              <td>联系电话：</td>
              <td><label>
                <input type="text" name="phone" value="<%=phone %>">
              </label></td>
              <td>电子邮件：</td>
              <td><label>
                <input type="text" name="email" value="<%=email %>">
              </label></td>
            </tr>
             <tr>
              <td>联系地址：</td>
              <td><label>
                <input type="text" name="address" value="<%=address %>">
              </label></td>
              <td>邮政编码：</td>
              <td><label>
                <input type="text" name="posts" value="<%=posts %>">
              </label></td>
            </tr>
		  </table>
		  <table border="1">
            <tr>
              <td colspan="4" bgcolor="#6600FF">教育信息</td>
            </tr>
            <tr>
              <td>毕业学校：</td>
              <td><label>
                <input type="text" name="school" value="<%=school %>">
              </label></td>
              <td>专有名称：</td>
              <td><label>
                <input type="text" name="edu_class" value="<%=edu_class %>">
              </label></td>
            </tr>
            <tr>
              <td>学历等级：</td>
              <td><label>
                <input type="text" name="education" value="<%=education %>">
              </label></td>
              <td>外语语种：</td>
              <td><label>
                <input type="text" name="language" value="<%=language %>">
              </label></td>
            </tr>
            <tr>
              <td>外语等级：</td>
              <td colspan="3"><label>
                <input type="text" name="lang_level" value="<%=lang_level %>">
              </label></td>
            </tr>
		  </table>
			<table border="1"> 
            <tr>
              <td colspan="4" bgcolor="#3366FF">求职信息</td>
            </tr>
            <tr>
              <td>应聘岗位：</td>
              <td><label>
                <input type="text" name="job" value="<%=job %>">
              </label></td>
              <td>薪资要求：</td>
              <td><label>
                <input type="text" name="salary" value="<%=salary %>">
              </label></td>
            </tr>
            <tr>
              <td>职业技能：</td>
              <td colspan="3"><label></label>
              <label>
              <textarea name="skills" cols="45" rows="5"><%=skills %></textarea>
              </label></td>
            </tr>
            <tr>
              <td>个人经历：</td>
              <td colspan="3"><label>
                <textarea name="experience" cols="45" rows="5"><%=experience %></textarea>
              </label></td>
            </tr>
            <tr>
              <td>项目经验：</td>
              <td colspan="3"><label>
                <textarea name="item_exp" cols="45" rows="5"><%=item_exp %></textarea>
              </label></td>
            </tr>
            <tr>
              <td>自我介绍：</td>
              <td colspan="3"><label>
                <textarea name="introduce" cols="45" rows="5"><%=introduce %></textarea>
              </label></td>
            </tr>
            <tr style="text-align:center;">
              <td colspan="4"><label>
			    <input type="hidden" name="status" value="personupdate">
                <input type="submit" name="Submit" value="提交">
              </label>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                
			  <label>
              <input type="reset" name="Submit2" value="重置">
              </label></td>
              </tr>
          </table>
		  <label></label>
	  </form>
	  	  <%
			} 
					}
		  %>
		 </center>
  </body>
</html>
