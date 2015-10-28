package com.greensell.model.bbs;

import java.sql.SQLException;
import java.util.List;
import com.greensell.bbs.beans.*;

public interface BbsDao {
	public boolean Insert(BbsVo bean) throws SQLException;
	public boolean Delete(String name)throws SQLException;
	public boolean Update(BbsVo dao)throws SQLException;
	public List<ReplyVo> selectcommet()throws SQLException;
	public List<BbsVo> selectAll()throws SQLException;
	public List<BbsVo> selecttarget()throws SQLException;
}


