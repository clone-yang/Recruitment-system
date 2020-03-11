package com.servlet;

import java.io.*;
import com.db.DB3;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class UpLoad extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		this.doPost(request,response) ;
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
	String path="MyJsp1.jsp";
    try{
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
        
    String name1 =request.getParameter("name");
    System.out.println(name1);
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
    String fileplace = filename;
    System.out.println(fileplace);
	
    path = "MyJsp.jsp";
    }
    catch (Exception e) {
		// TODO: handle exception
    	
	}
    request.getRequestDispatcher(path).forward(request,response) ;
}
}