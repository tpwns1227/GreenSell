package com.greensell.model.bbs;

import java.sql.SQLException;
import java.util.List;
import com.greensell.bbs.beans.BbsVo;

public interface BbsDao {
	public boolean Insert(BbsVo bean) throws SQLException;
	public boolean Delete(String name)throws SQLException;
	public boolean Update(BbsVo dao)throws SQLException;
	public BbsDao select(String name) throws SQLException;
	public List<BbsDao> selectAll();
}


