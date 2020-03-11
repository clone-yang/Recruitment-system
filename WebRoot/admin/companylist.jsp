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
<body style="background:#9999CC;margin: 0;">
	<div>
		<center>
		<br>
		<h2><font color="blue">公司岗位信息管理</font>  </h2>
		<br />
		<br />
		
		<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
		%>
			<% 
				String jspUrl= "companylist.jsp";
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
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				String sql = "select id from company";
				ResultSet rs=db.executeQuery(sql);
				
				rs.last();
				allRecorders=rs.getRow();
				System.out.println("allrecorders="+allRecorders);
				pageSize=(allRecorders+lineSize-1)/lineSize;
			 %>
			<% 
		
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				sql = "select *  from company";
				rs=db.executeQuery(sql);
			%>
			<script type="text/javascript">
				function openPage(page) { 
					document.pag.cp.value = page;
					document.pag.submit();
				}
				function selOpenPage() {
					document.pag.cp.value = document.pag.selpage.value;
					document.pag.submit();
				}	
			</script>
			
			<%
		// 如果有内容，则修改变量i，如果没有，则根据i的值进行无内容提示
		int i = 0 ;
		//String keyword = request.getParameter("keyword") ;
		List all =new ArrayList() ;
		//all = (List)request.getAttribute("all") ;
	%>
					
				<form action="Note.tttt" method="POST">
						请输入查询内容：<input type="text" name="keyword">
						<input type="hidden" name="status" value="companyselectbylike">
						<input type="submit" value="查询">
				</form>
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
			int count = 0;
				//按需要空出记录数 首页 不空出 第二页 空出10条 第三页 空出20条...
				for(int j=0; j<(currentPage-1)*lineSize; j++) {
					rs.next();
				}
				
				for(int j=0; j<lineSize;j++) {		
					if(rs.next()) 
						{
					
						int id = rs.getInt("id");
						String companyname = rs.getString("companyname");
						String fullname = rs.getString("fullname");
						String property = rs.getString("property");
						String place=rs.getString("place");
						String trade=rs.getString("trade");
						String positionname = rs.getString("positionname");
						String number = rs.getString("number");
						String education = rs.getString("education");
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
						note.setDescription(rs.getString(11)) ;
						note.setInfo(rs.getString(12)) ;
						note.setCompanyaddress(rs.getString(13)) ;
						note.setWeb(rs.getString(14)) ;
						note.setContact(rs.getString(15)) ;
						note.setPhone(rs.getString(16)) ;
						note.setCompanyemail(rs.getString(17)) ;
						
						all.add(note) ;
						
				        }
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
											String companyname= note.getCompanyname() ;
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
	
				
			<table width="548" height="425" border="1" style="text-align: left;">
			<tr>
              <td>编号</td>
              <td colspan="3"><%=id %></td>
            </tr>
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
            <tr>
              <td>删除操作：</td>
              <td colspan="3"><label>
                <a href="Note.tttt?id=<%=id %>&status=companydelete">删除</a>
              </label></td>
            </tr>
            <tr>
              <td>修改操作：</td>
              <td colspan="3"><label>
                <a href="Note.tttt?id=<%=id %>&status=companyselectid">修改</a>
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
								<td height="30px;" colspan="23"> 没有任何内容！！！</td>
							</tr>	
			
				<%
						}
				%>
			</table>
			<h3><a href="../login_success.jsp">回到管理列表页</a></h3> 
			<%
			} 
		else {
					// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","5;URL=../login.jsp") ;
		%>
			<h2 style="color:#FF0000;">您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			
			
			</h2><br>
			<% 
				}
			 %>

		 
		
		</center>
	</div>
</body>
</html>



