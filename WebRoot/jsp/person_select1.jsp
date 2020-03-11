<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="com.vo.*"%>
<html>
<head>
	<title>网上招聘系统</title>
</head>
<body style="background-color:#3366FF;margin: 0;padding-left: 10px;">
<div>
<center>
	<br>
	<h1>招聘信息</h1>
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
		List all =new ArrayList() ;
		all = (List)request.getAttribute("all") ;
	%>
	<%
									Iterator iter = all.iterator() ;
									while(iter.hasNext())
									{
										 Note note = (Note)iter.next() ;
										i++ ;
										// 进行循环打印，打印出所有的内容，以表格形式
										// 从数据库中取出内容
										int id = note.getId() ;
										String name= note.getCompanyname() ;
										String fullname = note.getFullname();
										String property = note.getProperty() ;
										String place = note.getPlace();
										String trade = note.getTrade();
										String positionname = note.getPositionname();
										String number = note.getNumber();
										String education = note.getEducation();
										String description = note.getDescription();
										String info =note.getInfo();
										String companyaddress=note.getCompanyaddress();
										String web=note.getWeb();
										String contact = note.getContact();
										String phone=note.getPhone();
										String companyemail=note.getCompanyemail();

				%>
					
			<table width="548" height="425" border="1">
            <tr>
              <td colspan="4" bgcolor="#666699">公司信息</td>
            </tr>
            <tr>
              <td width="83">企业全称：</td>
              <td colspan="3"><label>
                <%=fullname %>
              </label></td>
            </tr>
            <tr>
              <td height="23">企业性质：</td>
              <td colspan="3"><label>
              <%=property %>
              </label></td>
			  </tr>
			  <tr>
              <td width="83">行业职称：</td>
              <td colspan="3"><label>
                <%=trade %>
              </label></td>
            </tr>

            <tr>
              <td>公司介绍：</td>
              <td colspan="3"><label>
                <%=info %>
              </label></td>
            </tr>
            <tr>
              <td>所在城市：</td>
              <td width="449"><label>
                <%=place %>
              </label></td>
			  </tr>
			  <tr>
              <td width="83">联系人：</td>
              <td width="449" colspan="3"><label>
                <%=contact %>
              </label></td>
            </tr>
            <tr>
              <td>公司邮件：</td>
              <td><label>
                <%=companyemail %>
              </label></td>
			  </tr>
			  <tr>
              <td>联系电话：</td>
              <td><label>
                <%=phone %>
              </label></td>
            </tr>
            <tr>
              <td>公司网址：</td>
              <td colspan="3"><label>
                <%=web %>
              </label>
                <label></label></td>
            </tr>
            <tr>
              <td>公司地址：</td>
              <td colspan="3"><label>
                <%=companyaddress %>
              </label></td>
            </tr>
            <tr>
              <td colspan="4" bgcolor="#6666CC">岗位信息</td>
            </tr>
            <tr>
              <td>岗位名称：</td>
              <td colspan="3"><label>
                <%=positionname %>
              </label></td>
            </tr>
            <tr>
              <td>招聘人数：</td>
              <td colspan="3"><label>
                <%=number %>
              </label>                <label></label></td>
            </tr>
            <tr>
              <td>学历要求：</td>
              <td colspan="3"><label>
                <%=education %>
              </label></td>
            </tr>
            <tr>
              <td>职位描述：</td>
              <td colspan="3"><label>
                <%=description %>
              </label></td>
            </tr>
				
				<%
						}
						// 判断i的值是否改变，如果改变，则表示有内容，反之，无内容
				%>
				<br/>
				<br/>
					<%		
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
				<br>
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