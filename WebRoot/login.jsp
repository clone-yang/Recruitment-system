<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title> 招聘系统后台</title>
	<style>
	   html,body
	   {
	     margin:0px;
	     padding:0px;
		 text-align:center;
	   }
	   #bg-pic
	   {
	     background:url(pic/lg.jpg) no-repeat;
		 width:1000px;
		 height:692px;
	   }
	.STYLE1 {
	color: #00CCFF;
	font-weight: bold;
}
    </style>
</head>
<body>
<div id="bg-pic">
<center>
    <br/>
     <br/>
      <br/>
	<h1 class="STYLE1">网上招聘系统<br/><br/>管理员登陆</h1>
	<hr>
	<br>
	<%
		// 判断是否有错误信息，如果有则打印
		// 如果没有此段代码，则显示时会直接打印null
		if(request.getAttribute("err")!=null)
		{
	%>
			<h2 class="STYLE1"><%=request.getAttribute("err")%></h2>
	<%
		}
	%>
	<br/>
     <br/>
	 
	<form action="Login.tttt" method="post">

	<table width="80%">
	
	<tr>
		<td><div align="right" class="STYLE1" >&nbsp;&nbsp;&nbsp;用户名：</div></td>
		<td>
		  <div align="left" >
		    <input name="name" type="text" size="21" >
	      </div></td>
	</tr>
	
	<tr>
		<td><div align="right" class="STYLE1">&nbsp;&nbsp;&nbsp;密 码：</div></td>
		<td>
		  <div align="left" >
		    <input name="password" type="password" size="22" >
	      </div></td>
	</tr>
	
	<tr>
		<td colspan="2">
			<div align="center">
			<br>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
			 <input type="submit" value="登陆">
			  <input type="reset" value="重置">
	        </div></td>
	</tr>
	</table>
	</form>
</center>
</div>
</body>
</html>