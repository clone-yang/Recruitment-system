package com.daoImpl;

import java.sql.*;
import java.util.*;

import org.omg.CORBA.Request;

import com.vo.*;
import com.dao.*;
import com.db.*;

public class NoteDAOImpl implements NoteDAO {
	// 增加操作
	 public void personinsert(Note note) throws Exception
	 {
			 String sql = "INSERT INTO person(name,password) VALUES(?,?) " ;
			 System.out.println(sql);
			 PreparedStatement pstmt = null ;
			 DB3 dbc = null ;
			 dbc = new DB3() ;
			 try
			 {
					 pstmt = dbc.con.prepareStatement(sql) ;
					 pstmt.setString(1,note.getName()) ;
					 pstmt.setString(2,note.getPassword()) ;
					 
					 pstmt.executeUpdate() ;
					 pstmt.close() ;
						
			 }
				 catch (Exception e)
				 {
					 	throw new Exception("操作中出现错误！！！") ;
				 }
	 }

	public void userInsert(Note note) throws Exception {
		String sql = "INSERT INTO user(name,password) VALUES(?,?) ";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql);

			pstmt.setString(1, note.getName());
			pstmt.setString(2, note.getPassword());
			pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {

			throw new Exception("操作中出现错误！！！");
		}

	}
	
	public void newsInsert(Note note) throws Exception {
		String sql = "INSERT INTO news(name) VALUES(?)";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql);

			pstmt.setString(1, note.getName());
			pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {

			throw new Exception("操作中出现错误！！！");
		}
		
	}

	public void companyInsert(Note note) throws Exception {
		String sql = "INSERT INTO company(companyname,companypassword) VALUES(?,?) ";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, note.getCompanyname());
			pstmt.setString(2, note.getCompanypassword());
			
			pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {

			throw new Exception("操作中出现错误！！！");
		}
	}

	// 修改操作
	 public void userUpdate(Note note) throws Exception
	 {
	 String sql1 = "update note set password=? where id=?" ;
	 PreparedStatement pstmt = null ;
	 DB3 dbc = null ;
	 dbc = new DB3() ;
	 try
	 {
			
	 pstmt = dbc.con.prepareStatement(sql1) ;
	 System.out.print(sql1);
	 pstmt.setString(1,note.getPassword()) ;
	 
	 pstmt.setInt(2,note.getId()) ;
	 
	 pstmt.executeUpdate() ;
	 pstmt.close() ;
	 }
	 catch (Exception e)
	 {
	 throw new Exception("操作中出现错误！！！") ;
	 }
	
	 }

	public void newsUpdate(Note note) throws Exception {
		String sql1 = "update news set name=? where id=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql1);
			
			pstmt.setString(1, note.getName());
			pstmt.setInt(2, note.getId());

			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作中出现错误！！！");
		}

	}

	public void companyUpdate(Note note) throws Exception {
		String sql1 = "update company set fullname=?,property=?,place=?,trade=?,positionname=?,number=?,education=?,edu_class=?,description=?,info=?,web=?,companyaddress=?,contact=?,phone=?,companyemail=? where companyname=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {

			pstmt = dbc.con.prepareStatement(sql1);
			pstmt.setString(1, note.getFullname());
			pstmt.setString(2, note.getProperty());
			pstmt.setString(3, note.getPlace());
			pstmt.setString(4, note.getTrade());
			pstmt.setString(5, note.getPositionname());
			pstmt.setString(6, note.getNumber());
			pstmt.setString(7, note.getEducation());
			pstmt.setString(8, note.getEdu_class());
			pstmt.setString(9, note.getDescription());
			pstmt.setString(10, note.getInfo());
			pstmt.setString(11, note.getWeb());
			pstmt.setString(12, note.getCompanyaddress());
			pstmt.setString(13, note.getContact());
			pstmt.setString(14, note.getPhone());
			pstmt.setString(15, note.getCompanyemail());
			pstmt.setString(16, note.getCompanyname());
			System.out.println("XXX");
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作中出现错误！！！");
		}

	}
	
	public void company_passwordUpdate(Note note) throws Exception {
		String sql1 = "update company set companypassword=?  where companyname=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {

			pstmt = dbc.con.prepareStatement(sql1);
			pstmt.setString(1, note.getCompanypassword());
			pstmt.setString(2, note.getCompanyname());
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作中出现错误！！！");
		}

	}
	public void person_passwordUpdate(Note note) throws Exception {
		String sql1 = "update person set password=?  where name=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {

			pstmt = dbc.con.prepareStatement(sql1);
			pstmt.setString(1, note.getPassword());
			pstmt.setString(2, note.getName());
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作中出现错误！！！");
		}

	}
	// 删除操作
	 public void persondelete(int id) throws Exception
	 {
				 String sql = "DELETE FROM person WHERE id=?" ;
				 PreparedStatement pstmt = null ;
				 DB3 dbc = null ;
				 dbc = new DB3() ;
				 try
				 {
						 pstmt = dbc.con.prepareStatement(sql) ;
						 pstmt.setInt(1,id) ;
									
						 pstmt.executeUpdate() ;
						 pstmt.close() ;
				 }
				 catch (Exception e)
				 {
					 	throw new Exception("操作中出现错误！！！") ;
				 }
	
	 }
	 
	 public void userdelete(int id) throws Exception
	 {
				 String sql = "DELETE FROM user WHERE id=?" ;
				 PreparedStatement pstmt = null ;
				 DB3 dbc = null ;
				 dbc = new DB3() ;
				 try
				 {
						 pstmt = dbc.con.prepareStatement(sql) ;
						 pstmt.setInt(1,id) ;
									
						 pstmt.executeUpdate() ;
						 pstmt.close() ;
				 }
				 catch (Exception e)
				 {
					 	throw new Exception("操作中出现错误！！！") ;
				 }
	
	 }
	 
	public void newsdelete(int id) throws Exception {
		String sql = "DELETE FROM news WHERE id=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql);
			pstmt.setInt(1, id);

			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作中出现错误！！！");
		}

	}

	public void companydelete(int id) throws Exception {
		String sql = "DELETE FROM company WHERE id=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql);
			pstmt.setInt(1, id);

			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作中出现错误！！！");
		}

	}

	// 按ID查询，主要为更新使用
	// public Note queryById(int id) throws Exception
	// {
	// Note note = null ;
	// String sql = "SELECT id,title,author,content,reply FROM note WHERE id=?"
	// ;
	// PreparedStatement pstmt = null ;
	// DB3 dbc = null ;
	// dbc = new DB3() ;
	// try
	// {
	// pstmt = dbc.con.prepareStatement(sql) ;
	// pstmt.setInt(1,id) ;
	// ResultSet rs = pstmt.executeQuery() ;
	// if(rs.next())
	// {
	// note = new Note() ;
	// note.setId(rs.getInt(1)) ;
	// note.setTitle(rs.getString(2)) ;
	// note.setAuthor(rs.getString(3)) ;
	// note.setContent(rs.getString(4)) ;
	// note.setReply(rs.getString(5)) ;
	// }
	// rs.close() ;
	// pstmt.close() ;
	// }
	// catch (Exception e)
	// {
	// throw new Exception("操作中出现错误！！！") ;
	// }
	// return note ;
	// }

	public List newsQueryById(int id) throws Exception {
		
		List all = new ArrayList() ;
		String sql = "SELECT * FROM news WHERE id=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				Note note = new Note();
				
				note.setId(rs.getInt(1));
				note.setName(rs.getString(2));

				all.add(note);
			}
		}
		catch (Exception e) 
		{

			e.printStackTrace();
		}

		return all;
	}

	public Note companyQueryById(int id) throws Exception {
		Note note = null;
		String sql = "SELECT * FROM company WHERE id=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				note = new Note();
				note.setId(rs.getInt(1));
				note.setCompanyname(rs.getString(2));
				note.setCompanypassword(rs.getString(3));
				note.setFullname(rs.getString(4));
				note.setProperty(rs.getString(5));
				note.setPlace(rs.getString(6));
				note.setTrade(rs.getString(7));
				note.setPositionname(rs.getString(8));
				note.setNumber(rs.getString(9));
				note.setEducation(rs.getString(10));
				note.setDescription(rs.getString(11));
				note.setInfo(rs.getString(12));
				note.setCompanyaddress(rs.getString(13));
				note.setWeb(rs.getString(14));
				note.setContact(rs.getString(15));
				note.setPhone(rs.getString(16));
				note.setCompanyemail(rs.getString(17));

			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作中出现错误！！！");
		}

		return note;
	}
	
	public Note personQueryById(int id) throws Exception {
		Note note = null;
		String sql = "SELECT * FROM person WHERE id=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				note = new Note();
				note.setId(rs.getInt(1)) ;
				note.setName(rs.getString(2)) ;
				note.setPassword(rs.getString(3)) ;
				note.setRealname(rs.getString(4)) ;
				note.setSex(rs.getString(5)) ;
				note.setNation(rs.getString(6)) ;
				note.setAge(rs.getString(7)) ;
				note.setMarry(rs.getString(8)) ;
				note.setProvince(rs.getString(9)) ;
				note.setEducation(rs.getString(10)) ;
				note.setSchool(rs.getString(11)) ;
				note.setEdu_class(rs.getString(12)) ;
				note.setLanguage(rs.getString(13)) ;
				note.setLang_level(rs.getString(14)) ;
				note.setSalary(rs.getString(15)) ;
				note.setPhone(rs.getString(16)) ;
				note.setEmail(rs.getString(17)) ;
				note.setAddress(rs.getString(18)) ;
				note.setPosts(rs.getString(19)) ;
				note.setJob(rs.getString(20)) ;
				note.setSkills(rs.getString(21)) ;
				note.setExperience(rs.getString(22)) ;
				note.setItem_exp(rs.getString(23)) ;
				note.setIntroduce(rs.getString(24)) ;
				note.setFileplace(rs.getString(25)) ;

			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作中出现错误！！！");
		}

		return note;
	}

	// 模糊查询
//	public static void main(String args[]) {
//	NoteDAOImpl dao = new NoteDAOImpl();
//	List list = null;
//	try {
//		//Object request;
//		//String keyword = new String(request.getParameter("keyword"));
//		list = dao.personqueryByLike("x");
//		for (int i = 0; i < list.size()-1; i++) {
//			Note note = (Note) list.get(i);
//			System.out.println(note.getName());
//		}
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//
//}
	 public List personqueryByLike(String cond) throws Exception
	 {
	 List all = new ArrayList() ;
	 String sql ="SELECT * FROM person WHERE id LIKE ? or name LIKE ? or realname LIKE ? or province LIKE ?" +
		" or education LIKE ? or school LIKE ? or edu_class LIKE ? or language LIKE ? or lang_level LIKE ? or salary LIKE ? or phone LIKE ?" +
		" or email LIKE ? or address LIKE ? or posts LIKE ? or job LIKE ? or skills LIKE ? or experience LIKE ? or item_exp LIKE ?" +
		" or introduce LIKE ? or fileplace LIKE ?" ;
	 PreparedStatement pstmt = null ;
	 DB3 dbc = null ;
	 dbc = new DB3() ;
	 try
	 {
								 pstmt = dbc.con.prepareStatement(sql) ;
								 pstmt.setString(1,"%"+cond+"%") ;
								 pstmt.setString(2,"%"+cond+"%") ;
								 pstmt.setString(3,"%"+cond+"%") ;
								 pstmt.setString(4,"%"+cond+"%") ;
								 pstmt.setString(5,"%"+cond+"%") ;
								 pstmt.setString(6,"%"+cond+"%") ;
								 pstmt.setString(7,"%"+cond+"%") ;
								 pstmt.setString(8,"%"+cond+"%") ;
								 pstmt.setString(9,"%"+cond+"%") ;
								 pstmt.setString(10,"%"+cond+"%") ;
								 pstmt.setString(11,"%"+cond+"%") ;
								 pstmt.setString(12,"%"+cond+"%") ;
								 pstmt.setString(13,"%"+cond+"%") ;
								 pstmt.setString(14,"%"+cond+"%") ;
								 pstmt.setString(15,"%"+cond+"%") ;
								 pstmt.setString(16,"%"+cond+"%") ;
								 pstmt.setString(17,"%"+cond+"%") ;
								 pstmt.setString(18,"%"+cond+"%") ;
								 pstmt.setString(19,"%"+cond+"%") ;
								 pstmt.setString(20,"%"+cond+"%") ;
								 
								 ResultSet rs = pstmt.executeQuery() ;
											
								 while(rs.next())
								 {
											 Note note = new Note() ;
											 note.setId(rs.getInt(1)) ;
											 note.setName(rs.getString(2)) ;
											 note.setRealname(rs.getString(4)) ;
											 note.setSex(rs.getString(5)) ;
											 note.setNation(rs.getString(6)) ;
											 note.setAge(rs.getString(7)) ;
											 note.setMarry(rs.getString(8)) ;
											 note.setProvince(rs.getString(9)) ;
											 note.setEducation(rs.getString(10)) ;
											 note.setSchool(rs.getString(11)) ;
											 note.setEdu_class(rs.getString(12)) ;
											 note.setLanguage(rs.getString(13)) ;
											 note.setLang_level(rs.getString(14)) ;
											 note.setSalary(rs.getString(15)) ;
											 note.setPhone(rs.getString(16)) ;
											 note.setEmail(rs.getString(17)) ;
											 note.setAddress(rs.getString(18)) ;
											 note.setPosts(rs.getString(19)) ;
											 note.setJob(rs.getString(20)) ;
											 note.setSkills(rs.getString(21)) ;
											 note.setExperience(rs.getString(22)) ;
											 note.setItem_exp(rs.getString(23)) ;
											 note.setIntroduce(rs.getString(24)) ;
											 note.setFileplace(rs.getString(25)) ;
											 all.add(note) ;
								 }
						 }
						 catch (Exception e)
						 {
							 e.printStackTrace();
						 }
				return all ;
	 }
	 
	 public List person_select1(Note note) throws Exception {
			
			List all = new ArrayList();
			String sql2 = "SELECT * FROM company WHERE positionname LIKE ? and education LIKE ?";
			System.out.println(sql2);
			PreparedStatement pstmt = null;
			DB3 dbc = null;
			dbc = new DB3();
			try {
				pstmt = dbc.con.prepareStatement(sql2);
				pstmt.setString(1, "%"+note.getPositionname()+"%");
				pstmt.setString(2, "%"+note.getEducation()+"%");

				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
					Note note1 = new Note();
					
					note1.setId(rs.getInt(1));
					note1.setCompanyname(rs.getString(2));
					note1.setCompanypassword(rs.getString(3));
					note1.setFullname(rs.getString(4));
					note1.setProperty(rs.getString(5));
					note1.setPlace(rs.getString(6));
					note1.setTrade(rs.getString(7));
					note1.setPositionname(rs.getString(8));
					note1.setNumber(rs.getString(9));
					note1.setEducation(rs.getString(10));
					note1.setDescription(rs.getString(11));
					note1.setInfo(rs.getString(12));
					note1.setCompanyaddress(rs.getString(13));
					note1.setWeb(rs.getString(14));
					note1.setContact(rs.getString(15));
					note1.setPhone(rs.getString(16));
					note1.setCompanyemail(rs.getString(17));
					System.out.println("XX");

					all.add(note1);

				}
			}
			catch (Exception e) 
			{

				e.printStackTrace();
			}
			return all;
		}

	public List person_select2(String cond) throws Exception 
		{
				List all = new ArrayList();
			
			String sql1 = "select * FROM company WHERE fullname LIKE ?";
			System.out.println(sql1);
			PreparedStatement pstmt = null;
			DB3 dbc = null;
			dbc = new DB3();
			try {
				pstmt = dbc.con.prepareStatement(sql1);
				pstmt.setString(1, "%" + cond + "%");


				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					Note note = new Note();
					
					note.setId(rs.getInt(1));
					note.setCompanyname(rs.getString(2));
					note.setCompanypassword(rs.getString(3));
					note.setFullname(rs.getString(4));
					note.setProperty(rs.getString(5));
					note.setPlace(rs.getString(6));
					note.setTrade(rs.getString(7));
					note.setPositionname(rs.getString(8));
					note.setNumber(rs.getString(9));
					note.setEducation(rs.getString(10));
					note.setDescription(rs.getString(11));
					note.setInfo(rs.getString(12));
					note.setCompanyaddress(rs.getString(13));
					note.setWeb(rs.getString(14));
					note.setContact(rs.getString(15));
					note.setPhone(rs.getString(16));
					note.setCompanyemail(rs.getString(17));

					all.add(note);
				}
			}
			catch (Exception e) 
			{

				e.printStackTrace();
			}

			return all;
		}

//	public static void main(String args[]) {
//		NoteDAOImpl dao = new NoteDAOImpl();
//		List list = null;
//		try {
//			//Object request;
//			//String keyword = new String(request.getParameter("keyword"));
//			list = dao.newsQueryByLike("y");
//			for (int i = 0; i < list.size()-1; i++) {
//				Note note = (Note) list.get(i);
//				System.out.println(note.getTitle());
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}

	public List newsQueryByLike(String cond) throws Exception {

		List all = new ArrayList();
		String sql = "SELECT id,name FROM news WHERE id LIKE ? or name LIKE ?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try{
		pstmt = dbc.con.prepareStatement(sql);
		pstmt.setString(1, "%" + cond + "%");
		pstmt.setString(2, "%" + cond + "%");

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			Note note = new Note();
			note.setId(rs.getInt(1));
			note.setName(rs.getString(2));

			all.add(note);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return all;
	}
	
//	public static void main(String args[]) {
//	NoteDAOImpl dao = new NoteDAOImpl();
//	List list = null;
//	try {
//		//Object request;
//		//String keyword = new String(request.getParameter("keyword"));
//		list = dao.companyQueryByLike("n");
//		for (int i = 0; i < list.size()-1; i++) {
//			Note note = (Note) list.get(i);
//			System.out.println(note.getCompanyname());
//		}
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//
//}

	public List companyQueryByLike(String cond) throws Exception {
		
		List all = new ArrayList();
		
		String sql1 = "SELECT id,companyname,companypassword,fullname,property,place,trade,positionname,number,education,description,info,web,companyaddress,contact,phone,companyemail FROM company WHERE id LIKE ? or companyname LIKE ? " +
				"or fullname LIKE ? or property LIKE ? or place LIKE ?"
				+ " or trade LIKE ? or positionname LIKE ? or number LIKE ? or education LIKE ? or description LIKE ? or info LIKE ? or web LIKE ?"
				+ " or companyaddress LIKE ? or contact LIKE ? or phone LIKE ? or companyemail LIKE ?";
		System.out.println("niha");
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql1);
			pstmt.setString(1, "%" + cond + "%");
			pstmt.setString(2, "%" + cond + "%");
			pstmt.setString(3, "%" + cond + "%");
			pstmt.setString(4, "%" + cond + "%");
			pstmt.setString(5, "%" + cond + "%");
			pstmt.setString(6, "%" + cond + "%");
			pstmt.setString(7, "%" + cond + "%");
			pstmt.setString(8, "%" + cond + "%");
			pstmt.setString(9, "%" + cond + "%");
			pstmt.setString(10, "%" + cond + "%");
			pstmt.setString(11, "%" + cond + "%");
			pstmt.setString(12, "%" + cond + "%");
			pstmt.setString(13, "%" + cond + "%");
			pstmt.setString(14, "%" + cond + "%");
			pstmt.setString(15, "%" + cond + "%");
			pstmt.setString(16, "%" + cond + "%");

			ResultSet rs = pstmt.executeQuery();
			System.out.println("dadi");

			while (rs.next()) {
				
				Note note = new Note();
				
				note.setId(rs.getInt(1));
				note.setCompanyname(rs.getString(2));
				note.setCompanypassword(rs.getString(3));
				note.setFullname(rs.getString(4));
				note.setProperty(rs.getString(5));
				note.setPlace(rs.getString(6));
				note.setTrade(rs.getString(7));
				note.setPositionname(rs.getString(8));
				note.setNumber(rs.getString(9));
				note.setEducation(rs.getString(10));
				note.setDescription(rs.getString(11));
				note.setInfo(rs.getString(12));
				note.setCompanyaddress(rs.getString(13));
				note.setWeb(rs.getString(14));
				note.setContact(rs.getString(15));
				note.setPhone(rs.getString(16));
				note.setCompanyemail(rs.getString(17));

				all.add(note);
			}
		}
		catch (Exception e) 
		{

			e.printStackTrace();
		}

		return all;
	}

	


	public Note personqueryById(int id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	

	public void personupdate(Note note) throws Exception 
	{
		String sql1 = "update person set realname=?,sex=?,age=?,nation=?,marry=?,province=?,education=?,school=?,edu_class=?,language=?,lang_level=?,salary=?,phone=?,email=?,address=?,posts=?,job=?,skills=?,experience=?,item_exp=?,introduce=? where name=?";
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {

			pstmt = dbc.con.prepareStatement(sql1);
			pstmt.setString(1, note.getRealname());
			pstmt.setString(2, note.getSex());
			pstmt.setString(3, note.getAge());
			pstmt.setString(4, note.getNation());
			pstmt.setString(5, note.getMarry());
			pstmt.setString(6, note.getProvince());
			pstmt.setString(7, note.getEducation());
			pstmt.setString(8, note.getSchool());
			pstmt.setString(9, note.getEdu_class());
			pstmt.setString(10, note.getLanguage());
			pstmt.setString(11, note.getLang_level());
			pstmt.setString(12, note.getSalary());
			pstmt.setString(13, note.getPhone());
			pstmt.setString(14, note.getEmail());
			pstmt.setString(15, note.getAddress());
			pstmt.setString(16, note.getPosts());
			pstmt.setString(17, note.getJob());
			pstmt.setString(18, note.getSkills());
			pstmt.setString(19, note.getExperience());
			pstmt.setString(20, note.getItem_exp());
			pstmt.setString(21, note.getIntroduce());
			pstmt.setString(22, note.getName());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作中出现错误！！！");
		}

		
	}

	public boolean companylogin(Note note) throws Exception 
		{
			boolean flag = false ;
			String sql = "SELECT companyname FROM company WHERE companyname=? and companypassword=?" ;
			PreparedStatement pstmt = null ;
			DB3 dbc = null ;
			dbc = new DB3() ;
			try
			{
				pstmt = dbc.con.prepareStatement(sql) ;
				System.out.println("NoteDAOImpl。。。。");
				pstmt.setString(1,note.getCompanyname()) ;
				pstmt.setString(2,note.getCompanypassword()) ;
				ResultSet rs = pstmt.executeQuery() ;
				if(rs.next())
				{
					System.out.println("查找成功。。。。");
					flag = true ;
					System.out.println("flag:"+flag);
					note.setCompanyname(rs.getString(1)) ;
				}
				rs.close() ;
				pstmt.close() ;
			}
			catch (Exception e)
			{
				throw new Exception("操作出现错误！！！") ;
			}

			return flag ;
		}
		
	public boolean login(Note note) throws Exception 
		{
			boolean flag = false ;
			String sql = "SELECT name FROM person WHERE name=? and password=?" ;
			PreparedStatement pstmt = null ;
			DB3 dbc = null ;
			dbc = new DB3() ;
			try
			{
				pstmt = dbc.con.prepareStatement(sql) ;
				System.out.println("NoteDAOImpl。。。。");
				pstmt.setString(1,note.getName()) ;
				pstmt.setString(2,note.getPassword()) ;
				ResultSet rs = pstmt.executeQuery() ;
				if(rs.next())
				{
					System.out.println("查找成功。。。。");
					flag = true ;
					System.out.println("flag:"+flag);
					note.setName(rs.getString(1)) ;
				}
				rs.close() ;
				pstmt.close() ;
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}

			return flag ;
		
	
	}


//	public static void main(String args[]) {
//	NoteDAOImpl dao = new NoteDAOImpl();
//	List list = null;
//	try {
//		//Object request;
//		//String keyword = new String(request.getParameter("keyword"));
//		list = dao.company_select1(null);
//		for (int i = 0; i < list.size()-1; i++) {
//			Note note = (Note) list.get(i);
//			System.out.println(note.getCompanyname());
//		}
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//
//}

	public List company_select1(Note note) throws Exception {
		
		List all = new ArrayList();
		String sql2 = "SELECT * FROM person WHERE school LIKE ? and edu_class LIKE ?";
		System.out.println(sql2);
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql2);
			pstmt.setString(1, "%"+note.getSchool()+"%");
			pstmt.setString(2, "%"+note.getEdu_class()+"%");

			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				Note note1 = new Note();
				
				note1.setId(rs.getInt(1));
				note1.setName(rs.getString(2));
				note1.setPassword(rs.getString(3));
				note1.setRealname(rs.getString(4));
				note1.setSex(rs.getString(5));
				note1.setNation(rs.getString(6));
				note1.setAge(rs.getString(7));
				note1.setMarry(rs.getString(8));
				note1.setProvince(rs.getString(9));
				note1.setEducation(rs.getString(10));
				note1.setSchool(rs.getString(11));
				note1.setEdu_class(rs.getString(12));
				note1.setLanguage(rs.getString(13));
				note1.setLang_level(rs.getString(14));
				note1.setSalary(rs.getString(15));
				note1.setPhone(rs.getString(16));
				note1.setEmail(rs.getString(17));
				note1.setAddress(rs.getString(18));
				note1.setPosts(rs.getString(19));
				note1.setJob(rs.getString(20));
				note1.setSkills(rs.getString(21));
				note1.setExperience(rs.getString(22));
				note1.setItem_exp(rs.getString(23));
				note1.setIntroduce(rs.getString(24));
				note1.setFileplace(rs.getString(25));

				all.add(note1);

			}
			
		}
		catch (Exception e) 
		{

			e.printStackTrace();
		}
		return all;
	}

	public List company_select2(String cond) throws Exception 
	{
			List all = new ArrayList();
		
		String sql1 = "select * FROM person WHERE job LIKE ?";
		System.out.println(sql1);
		PreparedStatement pstmt = null;
		DB3 dbc = null;
		dbc = new DB3();
		try {
			pstmt = dbc.con.prepareStatement(sql1);
			pstmt.setString(1, "%" + cond + "%");


			ResultSet rs = pstmt.executeQuery();
			System.out.println("dadi");

			while (rs.next()) {
				
				Note note = new Note();
				
				note.setId(rs.getInt(1));
				note.setName(rs.getString(2));
				note.setPassword(rs.getString(3));
				note.setRealname(rs.getString(4));
				note.setSex(rs.getString(5));
				note.setNation(rs.getString(6));
				note.setAge(rs.getString(7));
				note.setMarry(rs.getString(8));
				note.setProvince(rs.getString(9));
				note.setEducation(rs.getString(10));
				note.setSchool(rs.getString(11));
				note.setEdu_class(rs.getString(12));
				note.setLanguage(rs.getString(13));
				note.setLang_level(rs.getString(14));
				note.setSalary(rs.getString(15));
				note.setPhone(rs.getString(16));
				note.setEmail(rs.getString(17));
				note.setAddress(rs.getString(18));
				note.setPosts(rs.getString(19));
				note.setJob(rs.getString(20));
				note.setSkills(rs.getString(21));
				note.setExperience(rs.getString(22));
				note.setItem_exp(rs.getString(23));
				note.setIntroduce(rs.getString(24));
				note.setFileplace(rs.getString(25));

				all.add(note);
			}
		}
		catch (Exception e) 
		{

			e.printStackTrace();
		}

		return all;
	}


};
