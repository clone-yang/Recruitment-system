<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<%@ page import="java.sql.*,com.db.DB3"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body style="background-color:#9999CC;margin: 0;">
<div>
<center>
	<h1>个人信息管理</h1>
	<hr>
	<br>
	<%
		// 编码转换
		request.setCharacterEncoding("GB2312") ;
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
	<% 
				String jspUrl= "select_personlist.jsp";
	%>	
	<% 
				int lineSize =1;
				int currentPage = 1;
				//定义总的记录数
				int allRecorders;
				//定义总的页数
				int pageSize;
	%>
	<% 
				try 
				{
					String cp = request.getParameter("cp");
					currentPage = Integer.parseInt(cp);
				}
				catch(Exception e) 
				{
				}		
	%>
	<% 
				DB3 db=new DB3();
	%>
	<%
				request.setCharacterEncoding("gbk");
				response.setCharacterEncoding("gbk");
				String keyword = request.getParameter("keyword");
				System.out.println("keyword="+keyword);
				String sql2 = "SELECT * FROM person WHERE name LIKE '"+"%"+keyword+"%"+"' or realname LIKE '"+"%"+keyword+"%"+"' or province LIKE '"+"%"+keyword+"%"+"'"+ 
				" or education LIKE '"+"%"+keyword+"%"+"' or school LIKE '"+"%"+keyword+"%"+"' or edu_class LIKE '"+"%"+keyword+"%"+"' or language LIKE '"+"%"+keyword+"%"+"' or lang_level LIKE '"+"%"+keyword+"%"+"' or salary LIKE '"+"%"+keyword+"%"+"' or phone LIKE '"+"%"+keyword+"%"+"'" +
				" or email LIKE '"+"%"+keyword+"%"+"' or address LIKE '"+"%"+keyword+"%"+"' or posts LIKE '"+"%"+keyword+"%"+"' or job LIKE '"+"%"+keyword+"%"+"' or skills LIKE '"+"%"+keyword+"%"+"' or experience LIKE '"+"%"+keyword+"%"+"' or item_exp LIKE '"+"%"+keyword+"%"+"'" +
				" or introduce LIKE '"+"%"+keyword+"%"+"'" ;
				ResultSet rs=db.executeQuery(sql2);
				rs.last();
				allRecorders=rs.getRow();
				System.out.println("allrecorders="+allRecorders);
				pageSize=(allRecorders+lineSize-1)/lineSize;
	%>
	<%
		// 如果有内容，则修改变量i，如果没有，则根据i的值进行无内容提示
		int i = 0 ;
		//String keyword = request.getParameter("yy") ;
		List all = null ;
		all = (List)request.getAttribute("all") ;
	%>
	<form name="pag" action="<%=jspUrl%>" >
				<input type="button" value="首页" onClick="openPage(1)" <%=currentPage==1?"disabled":""%>/>
				<input type="button" value="上一页" onClick="openPage(<%=currentPage-1 %>)"<%=currentPage==1?"disabled":""%>/>
				<input type="button" value="下一页" onClick="openPage(<%=currentPage+1 %>)"<%=currentPage==pageSize?"disabled":""%>/>
				<input type="button" value="尾页" onClick="openPage(<%=(allRecorders+lineSize-1)/lineSize %>)" <%=currentPage==pageSize?"disabled":""%>/>
				
				<input type="hidden" name="cp" value="" />
				<font color="red" size="5"><%=currentPage %></font>
				 / <font color=“red” size=“5”><%=pageSize %></font>
						 跳转到:<select name="selpage" onChange="selOpenPage()">
							<% 
								for(int x=1; x<=pageSize; x++) {
							%>
								<option value="<%=x %>" <%=currentPage==x?"selected":"" %>><%=x %></option>
							<% 
								}
							%>
					   </select>
	</form>
	<%
			Iterator iter = all.iterator() ;
			while(iter.hasNext())
			{
				 Note note = (Note)iter.next() ;
				i++ ;
				
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
			<%
					
					// 判断i的值是否改变，如果改变，则表示有内容，反之，无内容
					if(i==0)
					{
						// 进行提示
			%>
				<h3>没有任何内容！！！</h3>
			<%
					}
			%>
				
			<table border="1" style="text-align: left;">
			<tr>
			  <td bgcolor="#6600FF">编号：</td>
              <td colspan="3" style="text-align: center;"><%=id %></td>
            </tr>
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
              <td>删除操作：</td>
              <td colspan="3"><label>
                <a href="Note.tttt?id=<%=id %>&status=persondelete">删除</a>
              </label></td>
            </tr>
            <tr>
              <td>修改操作：</td>
              <td colspan="3"><label>
                <a href="Note.tttt?id=<%=id %>&status=personselectid">修改</a>
              </label></td>
            </tr>
			</table>
			<h3><a href="personlist.jsp">回到个人信息列表页</a></h3>
	<%
			}
		}
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=../login.jsp") ;
	%>
			您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a href="../login.jsp">这里</a>！！！<br>
	<%
		}
	%>
</center>
</div>
</body>
</html>