<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>岗位信息中心</title>
</head>
<body style="background:#6699FF; margin:0; padding-left:15px;">
	<div>
		<center>
		<br />
		<h2><font color="blue">信息预览</font>  </h2>
		</center>
		<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
		%>
		
			<% 
				DB3 db=new DB3();
			%>
			<%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				String sql = "select * from company where companyname='"+(String) session.getAttribute("uname")+"'";
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
						String name = rs.getString("companyname");
						String fullname = rs.getString("fullname");
						String property = rs.getString("property");
						String place=rs.getString("place");
						String trade=rs.getString("trade");
						String positionname = rs.getString("positionname");
						String number = rs.getString("number");
						String education = rs.getString("education");
						String edu_class = rs.getString("edu_class");
						String description = rs.getString("description");
						String info = rs.getString("info");
						String companyaddress = rs.getString("companyaddress");
						String web = rs.getString("web");
						String contact = rs.getString("contact");
						String phone = rs.getString("phone");
						String companyemail = rs.getString("companyemail");
						
						
				
						Note note= new Note() ;
						note.setId(rs.getInt(1)) ;
						note.setCompanyname(rs.getString(2)) ;
						note.setFullname(rs.getString(4)) ;
						note.setProperty(rs.getString(5)) ;
						note.setPlace(rs.getString(6)) ;
						note.setTrade(rs.getString(7)) ;
						note.setPositionname(rs.getString(8)) ;
						note.setNumber(rs.getString(9)) ;
						note.setEducation(rs.getString(10)) ;
						note.setEdu_class(rs.getString(11)) ;
						note.setDescription(rs.getString(12)) ;
						note.setInfo(rs.getString(13)) ;
						note.setCompanyaddress(rs.getString(14)) ;
						note.setWeb(rs.getString(15)) ;
						note.setContact(rs.getString(16)) ;
						note.setPhone(rs.getString(17)) ;
						note.setCompanyemail(rs.getString(18)) ;
						
						all.add(note) ;
						
				        }
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
											String edu_class = note.getEdu_class();
											String description = note.getDescription();
											String info =note.getInfo();
											String companyaddress=note.getCompanyaddress();
											String web=note.getWeb();
											String contact = note.getContact();
											String phone=note.getPhone();
											String companyemail=note.getCompanyemail();
											
									%>
			<%
			if(fullname==null){
			%>
			<center>
			<h2>还未填写相关信息，无法产生预览！</h2>
			</center>
			<%
			}
			%>
			<%
			if(fullname!=null){
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
              <td>专业要求：</td>
              <td colspan="3"><label>
                <%=edu_class %>
              </label></td>
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
          	</table>
				<%
			}
				%>
			<%
			} 
		}
		else {
					// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","5;URL=../index.jsp") ;
		%>
			<h2 style="color:#FF0000;">您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			
			
			</h2><br>
			<% 
				}
			 %>
		
	</div>
</body>
</html>



