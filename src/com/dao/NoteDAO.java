package com.dao;

import com.vo.*;

import java.util.*;
public interface NoteDAO {
	

	
	public boolean login(Note note) throws Exception ;
	public boolean companylogin(Note note) throws Exception ;
	// 增加操作
	public void personinsert(Note note) throws Exception ;
	public void newsInsert(Note note) throws Exception ;
	public void companyInsert(Note note) throws Exception ;
	public void userInsert(Note note) throws Exception ;
	// 修改操作
	public void personupdate(Note note) throws Exception ;
	public void newsUpdate(Note note) throws Exception ;
	public void companyUpdate(Note note) throws Exception ;
	public void userUpdate(Note note) throws Exception ;
	public void company_passwordUpdate(Note note) throws Exception ;
	public void person_passwordUpdate(Note note) throws Exception ;
	// 删除操作
	public void persondelete(int id) throws Exception ;
	public void newsdelete(int id) throws Exception ;
	public void companydelete(int id) throws Exception ;
	public void userdelete(int id) throws Exception ;
	// 按ID查询，主要为更新使用
	public Note personQueryById(int id) throws Exception ;
	//public Note newsQueryById(int id) throws Exception ;
	public Note companyQueryById(int id) throws Exception ;
	//public Note userQueryById(int id) throws Exception ;
	// 模糊查询
	public List personqueryByLike(String cond) throws Exception ;
	public List newsQueryByLike(String cond) throws Exception ;
	public List companyQueryByLike(String cond) throws Exception ;
	public List company_select1(Note note) throws Exception ;
	public List company_select2(String cond) throws Exception ;
	public List person_select1(Note note) throws Exception ;
	public List person_select2(String cond) throws Exception ;
	public List newsQueryById(int id) throws Exception ;
	
}


