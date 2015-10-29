package com.greensell.model.bbs;

import java.sql.SQLException;
import java.util.List;
import com.greensell.bbs.beans.*;

public interface BbsDao {
	public boolean Insert(BbsVo bean) throws SQLException;
	
	public boolean Delete(int no)throws SQLException;
	
	public boolean Update(BbsVo dao)throws SQLException;
	
	public List<ReplyVo> selectcomment(ReplyVo reply)throws SQLException;
	
	public List<BbsVo> selectAll()throws SQLException;
	
	public List<BbsVo> selecttitle(String title)throws SQLException;
	
	public List<BbsVo> selectcontent(String content)throws SQLException;
	
	public boolean Hitup(BbsVo dao)throws SQLException;
	
	public BbsVo view(int no)throws SQLException;
	
	public boolean Insert(ReplyVo Vo) throws SQLException;
}


