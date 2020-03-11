package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

public class DB3 
{	
		 public Connection con=null;
		 Statement stmt=null;
		 ResultSet rs=null;
		 int rn=0;
		String url="jdbc:mysql://localhost:3306/job?user=root&password=123456&useUnicode=true&characterEncoding=8859_1&characterEncoding=UTF-8";
		public DB3()
		{
			//1 加载驱动
			try 
			{
				Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				JOptionPane.showMessageDialog(null, "驱动加载实例化异常");
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				JOptionPane.showMessageDialog(null, "非法访问操作异常");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				JOptionPane.showMessageDialog(null, "驱动类找不到异常");
			}
			//2 完成连接
			try 
			{
				con=DriverManager.getConnection(url);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				JOptionPane.showMessageDialog(null, "连接异常");
			}
			//3 产生语句执行体
			try 
			{
				stmt=con.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				JOptionPane.showMessageDialog(null, "语句执行体产生异常");
			}
		}
		//4 处理结果
		  //4-1 查询类
		public ResultSet executeQuery(String sql)
		{
			try 
			{
				rs=stmt.executeQuery(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				JOptionPane.showMessageDialog(null,"查询语句执行异常");
				rs=null;
			}
			return rs;
		}
			//4-2 更新类
		public int executeUpdate(String sql)
		{
			try 
			{
				rn=stmt.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				JOptionPane.showMessageDialog(null,"更新语句执行异常");
				rn=0;
			}
			return rn;
		}


		//5 关闭
		public void close()
		{
			try 
			{
				stmt.close();
				rs.close();
				con.close();
				JOptionPane.showMessageDialog(null, "关闭正常");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				JOptionPane.showMessageDialog(null, "关闭操作异常");
			}
			
		}
		
	
}

