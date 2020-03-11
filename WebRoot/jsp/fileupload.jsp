<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" import="java.io.*"%>
<%@page import="java.sql.*,com.db.DB3"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
	<%
		if(session.getAttribute("uname")!=null)
		{
			
		      try
		        {
		      String tempFileName=new String("tempFile1");//接收上传的文件内容的临时文件的文件名  
		      File tempFile1=new File("D:\\",tempFileName);
		      FileOutputStream outputFile=new FileOutputStream(tempFile1);
		      InputStream fileSource=request.getInputStream();//得到客户端提交的所有数据
		      byte b[]=new byte[1000];
		      int n;
		      while((n=fileSource.read(b))!=-1)
		        outputFile.write(b,0,n);//将得到的客户端数据写入临时文件
		      outputFile.close();
		      fileSource.close();
		      
		      
		      RandomAccessFile randomFile1=new RandomAccessFile(tempFile1,"r");
		      randomFile1.readLine();//读取第一行数据
		      String FilePath=randomFile1.readLine();//读取第二行数据，这行数据包括了文件的路径和文件名
		      int position=FilePath.lastIndexOf('\\');//等到文件名 
		      String filename=FilePath.substring(position+1,FilePath.length()-1);
		      filename=new String(filename.getBytes("iso-8859-1"),"utf-8");
		      
		      randomFile1.readLine();
		      randomFile1.readLine();
		      long forthEnterPosition= randomFile1.getFilePointer();//找到上传的文件数据的结束位置，即倒数第4行
		      
		      
		      File FileUploadDir=new File("D:\\","load");
		      FileUploadDir.mkdir();
		      File saveFile1=new File("D:\\",filename);
		      RandomAccessFile randomFile2=new RandomAccessFile(saveFile1,"rw");
		      
		      long endPosition=randomFile1.length();
		      int j=1;
		      while((endPosition>=0)&&(j<=4))
		         {
		       endPosition--;
		       randomFile1.seek(endPosition);
		       if(randomFile1.readByte()=='\n')
		        j++;
		         }
		      randomFile1.seek(forthEnterPosition);  
		      long startPoint=randomFile1.getFilePointer();  
		      while(startPoint<endPosition-1)  
		        {  
		           randomFile2.write(randomFile1.readByte());  
		           startPoint=randomFile1.getFilePointer();  
		        }  
		      
		      randomFile1.close();
		      randomFile2.close();
		      tempFile1.delete();
		      out.print("上传成功");
		      String fileplace = filename;
		      System.out.println(fileplace);
		      DB3 db=new DB3();
		      
				     String sql1 = "update person set fileplace=? where name='"+(String) session.getAttribute("uname")+"'" ;
				 	 PreparedStatement pstmt = null ;
				 	 DB3 dbc = null ;
				 	 dbc = new DB3() ;
					 	 try
					 	 {
						 	 pstmt = dbc.con.prepareStatement(sql1) ;
						 	 System.out.print(sql1);
						 	 pstmt.setString(1,fileplace) ;
						 	 pstmt.executeUpdate() ;
						 	 pstmt.close() ;
					 	 }
					 	 catch (Exception e)
					 	 {
					 	 	out.print("上传地址更新失败!");
				 		 }
				 	
				      }
		      catch(Exception e)
		      {
		            out.print("上传失败");
		      }
		}
    %>
</body>
</html>

