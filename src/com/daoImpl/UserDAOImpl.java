package com.daoImpl;

import java.sql.* ;
import com.vo.* ;
import com.db.* ;
import com.dao.* ;

public class UserDAOImpl implements UserDAO
{
	/*
		功能：
			· 判断是否是正确的用户名或密码
			· 从数据库中取出用户的真实姓名
	*/
	public boolean login(User user) throws Exception
	{
		boolean flag = false ;
		String sql = "SELECT name FROM user WHERE name=? and password=?" ;
		PreparedStatement pstmt = null ;
		DB3 dbc = null ;
		dbc = new DB3() ;
		try
		{
			pstmt = dbc.con.prepareStatement(sql) ;
			System.out.println("UserDAOImpl。。。。");
			pstmt.setString(1,user.getName()) ;
			pstmt.setString(2,user.getPassword()) ;
			ResultSet rs = pstmt.executeQuery() ;
			if(rs.next())
			{
				System.out.println("查找成功。。。。");
				flag = true ;
				System.out.println("flag:"+flag);
				user.setName(rs.getString(1)) ;
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
};

