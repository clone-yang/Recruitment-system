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
  <body>
    <%
 				String name1 = null;
	  			if(session.getAttribute("uname")!=null)
					{
						name1 = (String) session.getAttribute("uname");
						System.out.println("二次读取");
						
  				}
  			 %>
  			 <%
				DB3 db=new DB3();
  			 %>
  			 <%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				String sql = "select * from person where name='"+(String) session.getAttribute("uname")+"'";
				System.out.println(sql);
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
					if(rs.next()) 
						{
					
						int id = rs.getInt("id");
						String name = rs.getString("name");
						String password = rs.getString("password");
						String realname = rs.getString("realname");
						String sex = rs.getString("sex");
						String nation = rs.getString("nation");
						String age = rs.getString("age");
						String marry = rs.getString("marry");
						String province=rs.getString("province");
						String education=rs.getString("education");
						String school = rs.getString("school");
						String edu_class = rs.getString("edu_class");
						String language = rs.getString("language");
						String lang_level = rs.getString("lang_level");
						String salary = rs.getString("salary");
						String phone = rs.getString("phone");
						String email = rs.getString("email");
						String address = rs.getString("address");
						String posts = rs.getString("posts");
						String job = rs.getString("job");
						String skills = rs.getString("skills");
						String experience = rs.getString("experience");
						String item_exp = rs.getString("item_exp");
						String introduce = rs.getString("introduce");
						
						Note note= new Note() ;
						
						note.setId(rs.getInt(1)) ;
						note.setName(rs.getString(2)) ;
						note.setPassword(rs.getString(3)) ;
						note.setRealname(rs.getString(4)) ;
						note.setSex(rs.getString(5)) ;
						note.setNation(rs.getString(6)) ;
						note.setAge(rs.getString(7)) ;
						note.setMarry(rs.getString(8)) ;
						note.setProvince(rs.getString(9)) ;
						note.setEducation(rs.getString(10)) ;
						note.setSchool(rs.getString(11)) ;
						note.setEdu_class(rs.getString(12)) ;
						note.setLanguage(rs.getString(13)) ;
						note.setLang_level(rs.getString(14)) ;
						note.setSalary(rs.getString(15)) ;
						note.setPhone(rs.getString(16)) ;
						note.setEmail(rs.getString(17)) ;
						note.setAddress(rs.getString(18)) ;
						note.setPosts(rs.getString(19)) ;
						note.setJob(rs.getString(20)) ;
						note.setSkills(rs.getString(21)) ;
						note.setExperience(rs.getString(22)) ;
						note.setItem_exp(rs.getString(23)) ;
						note.setIntroduce(rs.getString(24)) ;
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
											// 从数据库中取出内容
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
											String  job =note.getJob();
											String skills =note.getSkills();
											String experience = note.getExperience();
											String item_exp=note.getItem_exp();
											String introduce = note.getIntroduce();
											%>
											
  	<div style="width:550px; height:550px;">
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
		  %>
		  <span class="STYLE2">个性简历上传：</span>
	 	  <form action="fileupload.jsp" method="post"enctype="multipart/form-data">
		  <table width="500" border="1">
	            <tr>
              	<td width="82">个性简历：</td>
              	<td><label>
              	  <input name="file" type="file" size="45">
              	</label></td>
            	</tr>
				<tr style="text-align: center;">
              	<td colspan="2"><label>
              	    <input type="submit" value="提交">
              	</label></td>
              	</tr>
		</table>
	 </form>
	</div>
  </body>
</html>
