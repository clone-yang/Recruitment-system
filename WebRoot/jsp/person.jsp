<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<title>个人简历信息</title>
        <link href="../css/test.css" rel="stylesheet" type="text/css">
  </head>
			<%
	  			if(session.getAttribute("uname")!=null)
					{
						String name = (String) session.getAttribute("uname");
						System.out.println(name);
						System.out.println("账号读取");
					}
  			 %>
  <script type="text/javascript">
			//显示系统时间
			function updateTime(){
		  			var d=new Date();
		   		//var time=d.getYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
		   		var time=d.toLocaleString(); 
		   		document.getElementById("time").innerHTML=time;
		   		setTimeout("updateTime()",1000);
		   	}
		   	window.attachEvent("onload",updateTime);
		</script>
  <body style="margin:0px; padding:0px; background-color:#003063; text-align:center;">
  	<div style="width:800px; height:730px; border-style:solid; border-color:#336666;">
			<div style=" height:130px; width: 800px;background-color:#99CCFF; background-image:url(top.jpg);">
					
						<div style="height:40px; width:800px;">
						 
						</div>
						<div class="STYLE1" style="height:63px; padding-left:100px; text-align:left;">
						  欢迎光临网上信息招聘						  </div>
						<div style="height:27px; width:800px;">
						<span><a style="text-decoration:none;" href="index.jsp">网站首页</a></span>
			  			<span id="time" style="margin-left:100px;color:#0000ff;"></span>	
						</div>
					</div>
		
		<div style="width:800px; height:550px;">
			<div style="width:200px; height:550px; float:left; background-color:#e4f7Fc; text-align:left;">
				<table border="0">
							<tr>
								<td style="padding-left:45px;">个人信息</td>
							</tr>
							<tr>
								<td height="5"></td>
							</tr>
							<tr>
								<td style="padding-left:65px;"><a style="text-decoration:none;" href="jsp/person_update.jsp" target="tt">信息发布</a></td>
							</tr>
							<tr>
								<td height="5"></td>
							</tr>
							<tr>
								<td style="padding-left:65px;"><a style="text-decoration:none;" href="jsp/person_password_update.jsp" target="tt">密码修改</a></td>
							</tr>
							<tr>
								<td height="5"></td>
							</tr>
							<tr>
								<td style="padding-left:65px;"><a style="text-decoration:none;" href="jsp/person_test.jsp"  target="tt">信息预览</a></td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td style="padding-left:45px;">岗位搜索</td>
							</tr>
							<tr>
								<td height="5"></td>
							</tr>
							<tr>
								<td style="padding-left:65px;"><a style="text-decoration:none;" href="jsp/person_show_company.jsp">岗位需求</a></td>
							</tr>
							<tr>
								<td height="5"></td>
							</tr>
							<tr>
								<td style="padding-left:65px;"><a style="text-decoration:none;" href="jsp/person_select_company.jsp" target="tt">详细搜索</a></td>
							</tr>
							
			  </table>
		  </div>
			
					<div style="width:600px; height:550px; float:left; background-color:#CCCCCC;">
						<div style="margin: 0px;padding: 0px;">
						<iframe frameborder="0" style="width:600px; height:550px; margin-top:0px; padding-left: 0px;" src="jsp/welcome.jsp" name="tt">
						</iframe>
						</div>
					</div>
	  </div>
			<div style="width:800px; height:10px; background-color:#A2C0E1;"></div>

			
  </div>
		
  </body>
</html>
