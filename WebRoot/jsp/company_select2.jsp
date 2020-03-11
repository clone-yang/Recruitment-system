<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="com.vo.*"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body style="background-color:#3366FF;margin: 0;padding-left: 15px;">
<div>
<center>
	<h1>简历信息</h1>
	<hr>
	<br>
		<%
			// 编码转换
			request.setCharacterEncoding("utf-8") ;
			if(session.getAttribute("uname")!=null)
			{
				
		%>
		<%
		// 如果有内容，则修改变量i，如果没有，则根据i的值进行无内容提示
		int i = 0 ;
		//String keyword = request.getParameter("keyword") ;
		List all = null;
		//List all =new ArrayList() ;
		all = (List)request.getAttribute("all") ;
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
											String fileplace = note.getFileplace();
											
									%>
	
				<table border="1">
            <tr>
              <td colspan="4" bgcolor="#6600FF">个人信息</td>
            </tr>
            <tr>
              <td width="80">真实姓名：</td>
              <td width="150">
              <label>
                <%=realname %>
              </label></td>
              <td width="85">性 别：</td>
              <td width="167">
			  <label>
                <%=sex %>
              </label></td>
            </tr>
			<tr>
              <td>年 龄：</td>
              <td width="150"><label>
                <%=age %>
              </label></td>
              <td>名 族：</td>
              <td width="167"><label>
                <%=nation %>
              </label></td>
            </tr>
			<tr>
              <td>婚 否：</td>
              <td width="150"><label>
                <%=marry %>
              </label></td>
              <td>籍 贯：</td>
              <td width="167"><label>
                <%=province %>
              </label></td>
            </tr>
            <tr>
              <td>联系电话：</td>
              <td width="150"><label>
                <%=phone %>
              </label></td>
              <td width="85">电子邮件：</td>
              <td><label>
                <%=email %>
              </label></td>
            </tr>
             <tr>
              <td>联系地址：</td>
              <td width="150"><label>
                <%=address %>
              </label></td>
              <td>邮政编码：</td>
              <td width="167"><label>
                <%=posts %>
              </label></td>
            </tr>
            <tr>
              <td colspan="4" bgcolor="#6600FF">教育信息</td>
            </tr>
            <tr>
              <td>毕业学校：</td>
              <td width="150"><label>
                <%=school %>
              </label></td>
              <td>专业名称：</td>
              <td width="167"><label>
                <%=edu_class %>
              </label></td>
            </tr>
            <tr>
              <td>学历等级：</td>
              <td width="150"><label>
                <%=education %>
              </label></td>
              <td>外语语种：</td>
              <td width="167"><label>
                <%=language %>
              </label></td>
            </tr>
            <tr>
              <td>外语等级：</td>
              <td colspan="3"><label>
                <%=lang_level %>
              </label></td>
            </tr>
            <tr>
              <td colspan="4" bgcolor="#3366FF">求职信息</td>
            </tr>
            <tr>
              <td>应聘岗位：</td>
              <td width="150"><label>
                <%=job %>
              </label></td>
              <td>薪资要求：</td>
              <td width="167"><label>
                <%=salary %>
              </label></td>
            </tr>
            <tr>
              <td>职业技能：</td>
              <td colspan="3"><label></label>
              <label>
              <%=skills %>
              </label></td>
            </tr>
            <tr>
              <td>个人经历：</td>
              <td colspan="3"><label>
                <%=experience %>
              </label></td>
            </tr>
            <tr>
              <td>项目经验：</td>
              <td colspan="3"><label>
                <%=item_exp %>
              </label></td>
            </tr>
            <tr>
              <td>自我介绍：</td>
              <td colspan="3"><label>
                <%=introduce %>
              </label></td>
            </tr>
            <tr>
              <td>个性简历：</td>
              <td colspan="3"><label>
                <%
	           	if(fileplace!=null){
	           	%>
	           		<a href="DownloadFile?path=D:/&filename=<%=fileplace %>"><%=fileplace %></a>
	           	<%
	           	}
				else{
				%>
				<h2 style="color: red;">未上传！</h2>
				<%
					}
				%>
              </label></td>
            </tr>
				<%		
										}
							// 判断i的值是否改变，如果改变，则表示有内容，反之，无内容
							if(i==0)
							{
								// 进行提示
					%>
								<tr>
									<td colspan="5">没有找到符合您要求的内容！</td>
								</tr>
					<%
						}
					%>
			</table>
			<%
			} 
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=../index.jsp") ;
		%>
			您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a href="../index.jsp">这里</a>！！！<br>
		<%
			}
		%>
			
</center>
</div>
</body>
</html>