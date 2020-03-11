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
    
    <title>My JSP 'index_person.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body style="width:760px; height:170px; background-color:#996600;margin: 0px;padding: 0px;">
    								<%
										DB3 db=new DB3();
									%>
										
									<%
										request.setCharacterEncoding("utf-8");
										response.setCharacterEncoding("utf-8");
										String sql1 = "select * from person order by id desc";
										//rs=db.executeQuery(sql1);
										ResultSet rs=db.executeQuery(sql1);
									 %>
									<%
										// 如果有内容，则修改变量i，如果没有，则根据i的值进行无内容提示
										int i = 0 ;
										List all =new ArrayList() ;
										//all = (List)request.getAttribute("all") ;
									%>
										
									<table width="100%" style="border-style:groove;" border="1">
									<tr>
										<td>姓名</td>
										<td>性别</td>
										<td>学历</td>
										<td>专业</td>
										<td>应聘岗位</td>
									</tr>
							
									<% 				
										for(int j=0; j<6;j++) {		
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
												String fileplace = rs.getString("fileplace");
												
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
												note.setFileplace(rs.getString(25)) ;
										
										
												all.add(note) ;
										
								        }
											}
											 %>			
									
							
							
									<%
											Iterator iter1 = all.iterator() ;
											while(iter1.hasNext())
											{
												 Note note = (Note)iter1.next() ;
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
												String job =note.getJob();
												String skills =note.getSkills();
												String experience = note.getExperience();
												String item_exp=note.getItem_exp();
												String introduce = note.getIntroduce();
												String fileplace = note.getFileplace();
											%>
										<tr>
											<td><%=realname %></td>
											<td><%=sex %></td>
											<td><%=education %></td>
											<td><%=edu_class %></td>
											<td><%=job %></td>
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
  </body>
</html>
