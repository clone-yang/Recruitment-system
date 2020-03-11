<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>岗位信息发布网页</title>
    
  </head>
  <body style="background-color:#9999CC; padding-left:15px; margin:0;">
  <center>
 			<%
 				String companyname = null;
	  			if(session.getAttribute("uname")!=null)
					{
						companyname = (String) session.getAttribute("uname");
						System.out.println("二次读取");
						
  				}
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
		<form action="Note.tttt" method="post">
		<input type="hidden"    name="companyname" value=<%= companyname%> />
		  <table width="548" height="425" border="1">
            <tr>
              <td colspan="4" bgcolor="#666699">公司信息</td>
            </tr>
            <tr>
              <td width="86">企业全称：</td>
              <td colspan="3"><label>
                <input name="fullname" type="text" value="<%=fullname %>" size="55" width="350">
              </label></td>
            </tr>
            <tr>
              <td height="23">企业性质：</td>
              <td width="173"><label>
              <input type="text" name="property" value="<%=property %>">
              </label></td>
              <td width="85">行业职称：</td>
              <td width="176"><label>
                <input type="text" name="trade" value="<%=trade %>">
              </label></td>
            </tr>

            <tr>
              <td>公司介绍：</td>
              <td colspan="3"><label>
                <textarea name="info" cols="50" rows="10"><%=info %></textarea>
              </label></td>
            </tr>
            <tr>
              <td>所在城市：</td>
              <td><label>
                <input type="text" name="place" value="<%=place %>">
              </label></td>
              <td>联系人：</td>
              <td><label>
                <input type="text" name="contact" value="<%=contact %>">
              </label></td>
            </tr>
            <tr>
              <td>公司邮件：</td>
              <td><label>
                <input type="text" name="web" value="<%=companyemail %>">
              </label></td>
              <td>联系电话：</td>
              <td><label>
                <input type="text" name="phone" value="<%=phone %>">
              </label></td>
            </tr>
            <tr>
              <td>公司网址：</td>
              <td colspan="3"><label>
                <input name="companyemail" type="text" value="<%=web %>" size="55">
              </label>
                <label></label></td>
            </tr>
            <tr>
              <td>公司地址：</td>
              <td colspan="3"><label>
                <input name="companyaddress" type="text" value="<%=companyaddress %>" size="55">
              </label></td>
            </tr>
            <tr>
              <td colspan="4" bgcolor="#6666CC">岗位信息</td>
            </tr>
            <tr>
              <td>岗位名称：</td>
              <td colspan="3"><label>
                <input type="text" name="positionname" value="<%=positionname %>">
              </label></td>
            </tr>
            <tr>
              <td>招聘人数：</td>
              <td colspan="3"><label>
                <input type="text" name="number" value="<%=number %>">
              </label>                <label></label></td>
            </tr>
            <tr>
              <td>专业要求：</td>
              <td colspan="3"><label>
                <input type="text" name="edu_class" value="<%=edu_class %>">
              </label></td>
            </tr>
            <tr>
              <td>学历要求：</td>
              <td colspan="3"><label>
                <input type="text" name="education" value="<%=education %>">
              </label></td>
            </tr>
            <tr>
              <td>职位描述：</td>
              <td colspan="3"><label>
                <textarea name="description" cols="50" rows="15"><%=description %></textarea>
              </label></td>
            </tr>
			<tr>
              <td colspan="4" style="text-align: center;">
              <input type="hidden" name="status" value="companyupdate">
			  <input type="submit" value="提交" /></td>
            </tr>
          </table>
		</form>
		<%
						}
		%>
		</center>
  </body>
</html>
