package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


public class DownloadFile extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * Constructor of the object.
     */
    public DownloadFile() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    /**
     * The doGet method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
        javax.servlet.ServletOutputStream out = response.getOutputStream();

        String filepath=new String(request.getParameter("path").getBytes("utf-8"),"gbk").toString();
        String filename=new String(request.getParameter("filename").getBytes("utf-8"),"utf-8").toString();
        System.out.println("DownloadFile filepath:" + filepath);
        System.out.println("DownloadFile filename:" + filename);
        java.io.File file = new java.io.File(filepath + filename);
        if (!file.exists()) {
         System.out.println(file.getAbsolutePath() + " 文件不存在!");;
         //JOptionPane.showMessageDialog(null, "文件不存在或已被删除！");
            return;
        }
        // 读取文件流
        // 读取文件流
        java.io.FileInputStream fileInputStream = new java.io.FileInputStream(file);
            // 下载文件
            // 设置响应头和下载保存的文件名
            if (filename != null && filename.length() > 0) {
                response.setContentType("application/x-msdownload");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(filename.getBytes("gb2312"),"iso8859-1") + "\"");
                if (fileInputStream != null) {
                    int filelen = fileInputStream.available();
                    //文件太大时内存不能一次读出,要循环
                    byte[] buf = new byte[1024];
                    int n = 0;
                    while (n != -1) 
                    {
                      n = fileInputStream.read(buf);
                      if(n>0) out.write(buf, 0, n);
                    }
                }
                fileInputStream.close();
                out.close();
            }
        }
    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to post.
     *
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("    This is ");
        out.print(this.getClass().getName());
        out.println(", using the POST method");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }

    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException
     *             if an error occure
     */
    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException
     *             if an error occure
     */
    public void init() throws ServletException {
        // Put your code here
    }
}