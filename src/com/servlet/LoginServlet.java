package com.servlet;

import java.io.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;
import com.vo.* ;
import com.dao.factory.* ;

public class LoginServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		this.doPost(request,response) ;
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		String path = "login.jsp" ;
		// 1、接收传递的参数
		String name = request.getParameter("name") ;
		String password = request.getParameter("password") ;
		// 2、将请求的内容赋值给VO类
		User person = new User() ;
		person.setName(name) ;
		person.setPassword(password) ;
		
		try
		{
			// 进行数据库验证
			
			boolean b=DAOFactory.getUserDAOInstance().login(person);
			
			if(b)
			{
			System.out.print("111");
				// 如果为真，则表示用户ID和密码合法
				// 设置用户姓名到session范围之中
				request.getSession().setAttribute("uname",person.getName()) ;
				// 修改跳转路径
				path = "login_success.jsp" ;
			}
			else
			{
				// 登陆失败
				// 设置错误信息
				request.setAttribute("err","错误的用户ID及密码！！！") ;
			}
		}
		catch(Exception e)
		{}

		request.getRequestDispatcher(path).forward(request,response) ;
	}
};
