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
    
    <title>My JSP 'welcome1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background-image:url(pic/h3.jpg); background-repeat: no-repeat;">
    <center>
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
				if(fullname!=null){
			%>				
			<div style="padding-top: 20px; color:#CC6699; font-size: 18px;">
  				欢迎<b style="color:#FF0000; "><%=name %></b>再次光临！
  			</div>
				<%
									}
										}
				%>
				<%
		}
				%>
    </center>
  </body>
</html>
