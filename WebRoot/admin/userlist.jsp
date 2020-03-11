<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>网上招聘系统后台用户信息</title>
</head>
<body style="background:#9999CC;">
	<div>
		<center>
		<br>
		<h2><font color="blue">系统管理员列表</font>  </h2>
		<br />
		<br />
		
		<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
		%>
			<% 
				String jspUrl= "userlist.jsp";
			%>	
			<% 
				int lineSize =5;
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
				String sql = "select id from user";
				ResultSet rs=db.executeQuery(sql);
				
				rs.last();
				allRecorders=rs.getRow();
				System.out.println("allrecorders="+allRecorders);
				pageSize=(allRecorders+lineSize-1)/lineSize;
			 %>
			<% 
		
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				sql = "select *  from user";
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

				<form name="form1" method="post" action="user_insert.jsp"  >
				  <label>添加用户
				    <input name="s1" type="submit" id="s1" value="添加" >
			      </label>
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
			<table width="95%" border="1">
	<tr>
		<td>用户ID</td>
		<td>用户姓名</td>
		<td>用户密码</td>
		<td>删除</td>
	</tr>
	
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
						String name = rs.getString("name");
					    String password = rs.getString("password");
						
						
				
						Note note= new Note() ;
						note.setId(rs.getInt(1)) ;
						note.setName(rs.getString(2)) ;
						note.setPassword(rs.getString(3)) ;
						all.add(note) ;
						
				        }
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
									%>
	
				<tr>
					<td><%=id %></td>
					<td><%= name %></td>
					<td><%= password %></td>
					<td><a href="Note.tttt?id=<%=id %>&status=userdelete">删除</a></td>
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



