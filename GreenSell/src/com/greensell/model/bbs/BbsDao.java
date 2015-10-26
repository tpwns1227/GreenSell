package com.greensell.model.bbs;

import java.sql.SQLException;
import java.util.List;

public interface BbsDao {
	public boolean Insert(BbsDao dao);
	public boolean Delete(String name);
	public boolean Update(BbsDao dao);
	public BbsDao select(String name) throws SQLException;
	public List<BbsDao> selectAll();
}


