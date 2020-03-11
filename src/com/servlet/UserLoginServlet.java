package com.servlet;

import java.io.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;
import javax.swing.JOptionPane;

import com.vo.* ;
import com.dao.factory.* ;




public class UserLoginServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		this.doPost(request,response) ;
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		String path = "index.jsp" ;
		String status = request.getParameter("status") ;
		if("personal".equals(status))
		{
			
			
			String name = request.getParameter("name") ;
			String password = request.getParameter("password") ;
			// 2、将请求的内容赋值给VO类
			Note note = new Note() ;
			note.setName(name) ;
			note.setPassword(password) ;
			System.out.println(name);
			System.out.println(password);
			
			try
			{
				// 进行数据库验证
				//System.out.print("111");
				boolean b=DAOFactory.getNoteDAOInstance().login(note);
				System.out.println(b);
				
				if(b)
				{
					// 如果为真，则表示用户ID和密码合法
					// 设置用户姓名到session范围之中
					request.getSession().setAttribute("uname",note.getName()) ;
					// 修改跳转路径
					path = "jsp/person.jsp" ;
				}
				else
				{
					// 登陆失败
					// 设置错误信息
					//path="jsp/login_error.jsp";
					//request.setAttribute("index","错误的用户ID及密码！！！") ;
					JOptionPane.showMessageDialog(null, "用户名或者密码错误，请仔细核对后重新登录！");
				}
			}
			catch(Exception e)
			{}

			request.getRequestDispatcher(path).forward(request,response) ;
			
		}
		else
		{
			
			String companyname = request.getParameter("name") ;
			String companypassword = request.getParameter("password") ;
			// 2、将请求的内容赋值给VO类
			Note note = new Note() ;
			note.setCompanyname(companyname) ;
			note.setCompanypassword(companypassword) ;
			System.out.println(companyname);
			System.out.println(companypassword);
			
			try
			{
				// 进行数据库验证
				System.out.println("999");
				boolean b=DAOFactory.getNoteDAOInstance().companylogin(note);
				System.out.println(b);
				
				if(b)
				{
				System.out.println("369");
					// 如果为真，则表示用户ID和密码合法
					// 设置用户姓名到session范围之中
					request.getSession().setAttribute("uname",note.getCompanyname()) ;
					companyname =note.getCompanyname();
					companypassword =note.getCompanypassword();
					//System.out.println(companyname);
					// 修改跳转路径
					path = "jsp/company.jsp" ;
				}
				else
				{
					// 登陆失败
					// 设置错误信息
					JOptionPane.showMessageDialog(null, "用户名或者密码错误，请仔细核对后重新登录！");
					//request.setAttribute("index","错误的用户ID及密码！！！") ;
				}
			}
			catch(Exception e)
			{}

			request.getRequestDispatcher(path).forward(request,response) ;
			
		}
	}
	
	
	
};
