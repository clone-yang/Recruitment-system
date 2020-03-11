package com.dao.factory;


import com.dao.* ;
import com.daoImpl.* ;

public class DAOFactory
{
	public static UserDAO getUserDAOInstance()
	{
		return new UserDAOImpl() ;
	}

	public static NoteDAO getNoteDAOInstance()
	{
		return new NoteDAOImpl() ;
	}
};
