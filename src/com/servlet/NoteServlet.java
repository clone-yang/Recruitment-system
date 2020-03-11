package com.servlet;


import java.io.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;
import javax.swing.JOptionPane;

import com.dao.factory.* ;
import com.vo.* ;


public class NoteServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		this.doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		request.setCharacterEncoding("utf-8") ;
		String path = "../index.jsp" ;
		// 接收要操作的参数值
		String status = request.getParameter("status") ;
		if(status!=null)
		{
			
			// 插入操作
			if("personinsert".equals(status))
			{
				// 1、接收插入的信息
				String name= request.getParameter("name") ;
				String password= request.getParameter("password") ;
				System.out.println(name);
				System.out.println(password);
				boolean flag = false ;
				// 2、实例化VO对象
				Note note = new Note() ;
				note.setName(name) ;
				note.setPassword(password) ;
				// 3、调用DAO完成数据库的插入操作
				//boolean flag = false ;
				try
				{
					
					
					DAOFactory.getNoteDAOInstance().personinsert(note) ;
					flag = true ;
					
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
				request.getSession().setAttribute("uname",note.getName()) ;
				path = "person_register_do.jsp" ;
			}
			
			if("userinsert".equals(status))
			{
				// 1、接收插入的信息
			
				String name= request.getParameter("name") ;
				String password= request.getParameter("password") ;
				Note note = new Note() ;
				note.setName(name) ;
				note.setPassword(password) ;
			
				// 3、调用DAO完成数据库的插入操作
				boolean flag = false ;
				try
				{
					
					DAOFactory.getNoteDAOInstance().userInsert(note) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "insert_do.jsp" ;
			}
			
			if("companyinsert".equals(status))
			{
				// 1、接收插入的信息
				System.out.print("增加");
				String companyname= request.getParameter("companyname") ;
				String companypassword= request.getParameter("companypassword") ;
				System.out.print("增加");
				// 2、实例化VO对象
				Note note = new Note() ;
				note.setCompanyname(companyname) ;
				note.setCompanypassword(companypassword) ;
				
			
				// 3、调用DAO完成数据库的插入操作
				boolean flag = false ;
				try
				{
					
					
					DAOFactory.getNoteDAOInstance().companyInsert(note) ;
					flag = true ;
					
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
				request.getSession().setAttribute("uname",note.getCompanyname()) ;
				path = "company_register_do.jsp" ;//原来的是goodsinsert_do.jsp
			}
			
			if("newsinsert".equals(status))
			{
				// 1、接收插入的信息
			
				String name= request.getParameter("name") ;
				Note note = new Note() ;
				note.setName(name) ;
			
				// 3、调用DAO完成数据库的插入操作
				boolean flag = false ;
				try
				{
					
					DAOFactory.getNoteDAOInstance().newsInsert(note) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "web_note_insert_do.jsp" ;
			}
			// 按ID查询操作，修改之前需要将数据先查询出来
			
			if("newsselectid".equals(status))
			{
				// 接收参数
				int id = 0 ;
				try
				{
					id = Integer.parseInt(request.getParameter("id")) ;
				}
				catch(Exception e)
				{}
				try
				{
					request.setAttribute("all",DAOFactory.getNoteDAOInstance().newsQueryById(id)) ;
				}
				catch (Exception e)
				{
				}				
				path = "web_noteupdate.jsp" ;
			}
			
			if("companyselectid".equals(status))
			{
				// 接收参数
				int id = 0 ;
				try
				{
					id = Integer.parseInt(request.getParameter("id")) ;
				}
				catch(Exception e)
				{}
				try
				{
					
					request.setAttribute("note",DAOFactory.getNoteDAOInstance().companyQueryById(id)) ;
				}
				catch (Exception e)
				{
				}				
				path = "company_update.jsp" ; //原来的为goodsupdate.jsp
			}
			if("personselectid".equals(status))
			{
				// 接收参数
				int id = 0 ;
				try
				{
					id = Integer.parseInt(request.getParameter("id")) ;
					System.out.println(id);
				}
				catch(Exception e)
				{}
				try
				{
					
					request.setAttribute("note",DAOFactory.getNoteDAOInstance().personQueryById(id)) ;
				}
				catch (Exception e)
				{
				}				
				path = "person_update.jsp" ; //原来的为goodsupdate.jsp
			}
			// 更新操作
			if("userupdate".equals(status))
			{
				int id = 0 ;
				try
				{
					id = Integer.parseInt(request.getParameter("id")) ;
				}
				catch(Exception e)
				{}
				String name =new String(request.getParameter("name").getBytes("utf8")) ;
				String password = new String(request.getParameter("password").getBytes("gbk")) ;
				
				Note note= new Note() ;
				note.setId(id);
				note.setName(name);
				note.setPassword(password);
			
		
				boolean flag = false ;
				try
				{
					DAOFactory.getNoteDAOInstance().userUpdate(note) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
			
				path = "update_do.jsp" ;
			}
			if("newsupdate".equals(status))
			{
				int id = 0 ;
				try
				{
					id = Integer.parseInt(request.getParameter("id")) ;
					System.out.println(id);
				}
				catch(Exception e)
				{}
				String name =request.getParameter("name") ;
				System.out.println(name);
				Note note= new Note() ;
				note.setId(id);
				note.setName(name);
				boolean flag = false ;
				try
				{
					DAOFactory.getNoteDAOInstance().newsUpdate(note) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
			
				path = "web_noteupdate_do.jsp" ;
			}
			
			
			if("personupdate".equals(status))
			{
				try
				{
					//id = Integer.parseInt(request.getParameter("id")) ;
				}
				catch(Exception e)
				{}
				String name = new String(request.getParameter("name")) ;
				String realname = new String(request.getParameter("realname")) ;
				String sex =  new String(request.getParameter("sex")) ;
				String age=  new String(request.getParameter("age")) ;
				String nation =  new String(request.getParameter("nation")) ;
				String marry =  new String(request.getParameter("marry")) ;
				String province =  new String(request.getParameter("province")) ;
				String education =  new String(request.getParameter("education")) ;
				String school =  new String(request.getParameter("school")) ;
				String edu_class =  new String(request.getParameter("edu_class")) ;
				String language =  new String(request.getParameter("language")) ;
				String lang_level =  new String(request.getParameter("lang_level")) ;
				String salary =  new String(request.getParameter("salary")) ;
				String phone =  new String(request.getParameter("phone")) ;
				String email =  new String(request.getParameter("email")) ;
				String address =  new String(request.getParameter("address")) ;
				String posts =  new String(request.getParameter("posts")) ;
				String job =  new String(request.getParameter("job")) ;
				String skills =  new String(request.getParameter("skills")) ;
				String experience =  new String(request.getParameter("experience")) ;
				String item_exp =  new String(request.getParameter("item_exp")) ;
				String introduce =  new String(request.getParameter("introduce")) ;
				
				System.out.println("天上");
				System.out.println(name);
				
				Note note= new Note() ;
				
				note.setName(name);
				note.setRealname(realname);
				note.setSex(sex);
				note.setAge(age);
				note.setNation(nation);
				note.setMarry(marry);
				note.setProvince(province);
				note.setEducation(education);
				note.setSchool(school);
				note.setEdu_class(edu_class);
				note.setLanguage(language);
				note.setLang_level(lang_level);
				note.setSalary(salary);
				note.setPhone(phone);
				note.setEmail(email);
				note.setAddress(address);
				note.setPosts(posts);
				note.setJob(job);
				note.setSkills(skills);
				note.setExperience(experience);
				note.setItem_exp(item_exp);
				note.setIntroduce(introduce);
				
			
		
				boolean flag = false ;
				try
				{
				
					DAOFactory.getNoteDAOInstance().personupdate(note) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "person_update_do.jsp" ;
			}
			
			
			if("companyupdate".equals(status))
			{
				//int id = 0;
				try
				{
					//id = Integer.parseInt(request.getParameter("id")) ;
				}
				catch(Exception e)
				{}
				String name =  new String(request.getParameter("companyname")) ;
				String fullname = new String(request.getParameter("fullname")) ;
				String property =  new String(request.getParameter("property")) ;
				String place=  new String(request.getParameter("place")) ;
				String trade =  new String(request.getParameter("trade")) ;
				String positionname =  new String(request.getParameter("positionname")) ;
				String number =  new String(request.getParameter("number")) ;
				String education =  new String(request.getParameter("education")) ;
				String edu_class =  new String(request.getParameter("edu_class")) ;
				String description =  new String(request.getParameter("description")) ;
				String info =  new String(request.getParameter("info")) ;
				String web =  new String(request.getParameter("web")) ;
				String companyaddress =  new String(request.getParameter("companyaddress")) ;
				String contact =  new String(request.getParameter("contact")) ;
				String phone =  new String(request.getParameter("phone")) ;
				String companyemail =  new String(request.getParameter("companyemail")) ;
				System.out.println("天上");
				System.out.println(name);
				
				Note note= new Note() ;
				
				note.setCompanyname(name);
				note.setFullname(fullname);
				note.setProperty(property);
				note.setPlace(place);
				note.setTrade(trade);
				note.setPositionname(positionname);
				note.setNumber(number);
				note.setEducation(education);
				note.setEdu_class(edu_class);
				note.setDescription(description);
				note.setInfo(info);
				note.setWeb(web);
				note.setCompanyaddress(companyaddress);
				note.setContact(contact);
				note.setPhone(phone);
				note.setCompanyemail(companyemail);

				
			
		
				boolean flag = false ;
				try
				{
				
					DAOFactory.getNoteDAOInstance().companyUpdate(note) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "company_update_do.jsp" ;
			}
			
			if("company_password_update".equals(status))
			{
				try
				{
					//String companyname = new String(request.getParameter("companyname").getBytes("gbk"));
				}
				catch(Exception e)
				{}
				String companyname =  new String(request.getParameter("companyname")) ;
				String companypassword =  new String(request.getParameter("companypassword")) ;
				System.out.println("天上");
				System.out.println(companyname);
				
				Note note= new Note() ;
				
				note.setCompanypassword(companypassword);
				note.setCompanyname(companyname);
		
				boolean flag = false ;
				try
				{
				
					DAOFactory.getNoteDAOInstance().company_passwordUpdate(note) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "company_password_update_do.jsp" ;
			}
			if("person_password_update".equals(status))
			{
				try
				{
					//String companyname = new String(request.getParameter("companyname").getBytes("gbk"));
				}
				catch(Exception e)
				{}
				String name =  new String(request.getParameter("name")) ;
				String password =  new String(request.getParameter("password")) ;
				System.out.println(name);
				
				Note note= new Note() ;
				
				note.setName(name);
				note.setPassword(password);
		
				boolean flag = false ;
				try
				{
				
					DAOFactory.getNoteDAOInstance().person_passwordUpdate(note) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "person_password_update_do.jsp" ;
			}
//			if("companyupdate".equals(status))
//			{
//				try
//				{
//					//String companyname = new String(request.getParameter("companyname").getBytes("gbk"));
//					//System.out.println(companyname);
//					System.out.println("更新1");
//					String fullname = new String(request.getParameter("fullname")) ;
//					String property =  new String(request.getParameter("property")) ;
//					String place=  new String(request.getParameter("place")) ;
//					String trade =  new String(request.getParameter("trade")) ;
//					String positionname =  new String(request.getParameter("positionname")) ;
//					String number =  new String(request.getParameter("number")) ;
//					String description =  new String(request.getParameter("description")) ;
//					String info =  new String(request.getParameter("info")) ;
//					String web =  new String(request.getParameter("web")) ;
//					String companyaddress =  new String(request.getParameter("companyaddress")) ;
//					String contact =  new String(request.getParameter("contact")) ;
//					String phone =  new String(request.getParameter("phone")) ;
//					String companyemail =  new String(request.getParameter("companyemail")) ;
//					String companyname =  new String(request.getParameter("companyname")) ;
//					System.out.println(companyname);
//				  
//					Note note= new Note() ;
//					
//					note.setFullname(fullname);
//					note.setProperty(property);
//					note.setPlace(place);
//					note.setTrade(trade);
//					note.setPositionname(positionname);
//					note.setNumber(number);
//					note.setDescription(description);
//					note.setInfo(info);
//					note.setWeb(web);
//					note.setCompanyaddress(companyaddress);
//					note.setContact(contact);
//					note.setPhone(phone);
//					note.setCompanyemail(companyemail);
//					note.setCompanyname(companyname);
//					System.out.println("中间测试");
//					
//					boolean flag = false ;
//					System.out.println("zhy007");
//					DAOFactory.getNoteDAOInstance().companyUpdate(note) ;
//					flag = true ;
//					System.out.println(flag);
//					
//					request.setAttribute("flag",new Boolean(flag)) ;
//					
//				}
//				catch(Exception e)
//				{}
//				
//				path = "company_update_do.jsp" ; //goodsupdate_do.jsp
//			}
			
			// 模糊查询
//			if("userselectbylike".equals(status))
//			{
//				String keyword = new String(request.getParameter("keyword").getBytes("gbk"));
//				//request.getSession().setAttribute("yy", keyword);
//				try
//				{
//					request.setAttribute("all",DAOFactory.getNoteDAOInstance().userQueryByLike(keyword)) ;
//				}
//				catch (Exception e)
//				{
//				}
//				path = "select_userlist.jsp" ;//2newslist_notes.jsp
//			}
			
			
			if("personselectbylike".equals(status))
			{
				String keyword = new String(request.getParameter("keyword").getBytes("gbk"));
				//request.getSession().setAttribute("yy", keyword);
				System.out.println(keyword);
				try
				{
					request.setAttribute("all",DAOFactory.getNoteDAOInstance().personqueryByLike(keyword)) ;
				}
				catch (Exception e)
				{
				}
				path = "select_personlist.jsp" ;
			}
			
			if("person_select1".equals(status))
			{
				String positionname = new String(request.getParameter("positionname"));
				String education = new String(request.getParameter("education"));
				System.out.println(positionname);
				System.out.println(education);
				
				Note note= new Note() ;
				
				note.setPositionname(positionname);
				note.setEducation(education);
				try
				{
					request.setAttribute("all",DAOFactory.getNoteDAOInstance().person_select1(note));
				}
				catch (Exception e)
				{
					
				}
				//request.setAttribute("flag",new Boolean(flag)) ;
				path = "person_select1.jsp" ;
			}
			
			if("person_select2".equals(status))
			{
				String keyword = new String(request.getParameter("fullname").getBytes("gbk"));
				System.out.println(keyword);
				try
				{
					
					request.setAttribute("all",DAOFactory.getNoteDAOInstance().person_select2(keyword)) ;
				}
				catch (Exception e)
				{
					
				}
				path = "person_select2.jsp" ;
			}
			
			if("newsselectbylike".equals(status))
			{
				String keyword = new String(request.getParameter("keyword").getBytes("gbk"));
				//request.getSession().setAttribute("yy", keyword);
				
			
				try
				{
					request.setAttribute("all",DAOFactory.getNoteDAOInstance().newsQueryByLike(keyword)) ;
				}
				catch (Exception e)
				{
				}
				path = "web_notelist_select.jsp" ;
			}
			
			if("companyselectbylike".equals(status))
			{
				String keyword = new String(request.getParameter("keyword").getBytes("gbk"));
				//request.getSession().setAttribute("yy", keyword);
				System.out.println(keyword);
				try
				{
					
					request.setAttribute("all",DAOFactory.getNoteDAOInstance().companyQueryByLike(keyword)) ;
				}
				catch (Exception e)
				{
					
				}
				path = "select_companylist.jsp" ;//2goodslist_notes.jsp
			}
			if("company_select1".equals(status))
			{
				String school = new String(request.getParameter("school"));
				String edu_class = new String(request.getParameter("edu_class"));
				System.out.println(school);
				System.out.println(edu_class);
				
				Note note= new Note() ;
				
				note.setSchool(school);
				note.setEdu_class(edu_class);
				try
				{
					request.setAttribute("all",DAOFactory.getNoteDAOInstance().company_select1(note));
				}
				catch (Exception e)
				{
					
				}
				//request.setAttribute("flag",new Boolean(flag)) ;
				path = "company_select1.jsp" ;
			}
			if("company_select2".equals(status))
			{
				String keyword = new String(request.getParameter("job").getBytes("gbk"));
				System.out.println(keyword);
				try
				{
					
					request.setAttribute("all",DAOFactory.getNoteDAOInstance().company_select2(keyword)) ;
				}
				catch (Exception e)
				{
					
				}
				path = "company_select2.jsp" ;
			}
			
			
			
			// 删除操作
			if("userdelete".equals(status))
			{
				// 接收参数
				int id = 0 ;
				try
				{
					id = Integer.parseInt(request.getParameter("id")) ;
				}
				catch(Exception e)
				{}
				boolean flag = false ;
				try
				{
					DAOFactory.getNoteDAOInstance().userdelete(id) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "userdelet_do.jsp" ;
			}
			
			if("persondelete".equals(status))
			{
				// 接收参数
				int id = 0 ;
				try
				{
					id = Integer.parseInt(request.getParameter("id")) ;
				}
				catch(Exception e)
				{}
				boolean flag = false ;
				try
				{
					DAOFactory.getNoteDAOInstance().persondelete(id) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "persondelet_do.jsp" ;
			}
			
			
			if("companydelete".equals(status))
			{
				// 接收参数
				int id = 0 ;
				try
				{
					id = Integer.parseInt(request.getParameter("id")) ;
				}
				catch(Exception e)
				{}
				boolean flag = false ;
				try
				{  
					
					DAOFactory.getNoteDAOInstance().companydelete(id) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "companydelete_do.jsp" ;//goodsdelete_do
			}
			
			
			
			if("newsdelete".equals(status))
			{
				// 接收参数
				int id = 0 ;
				try
				{
					id = Integer.parseInt(request.getParameter("id")) ;
				}
				catch(Exception e)
				{}
				boolean flag = false ;
				try
				{  
					DAOFactory.getNoteDAOInstance().newsdelete(id) ;
					flag = true ;
				}
				catch (Exception e)
				{}
				request.setAttribute("flag",new Boolean(flag)) ;
				path = "web_notedelete_do.jsp" ;
			}
			
			

		}
		else
		{
			// 则表示无参数，非法的客户请求
		}
		request.getRequestDispatcher(path).forward(request,response) ;
	}
	
	
	
	
};


