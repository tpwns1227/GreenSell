package com.greensell.model.bbs;

import java.sql.SQLException;
import java.util.List;
import com.greensell.bbs.beans.*;

public interface BbsDao {
	public boolean insert(BbsVo bean) throws SQLException;
	
	public boolean delete(int no)throws SQLException;
	
	public boolean update(BbsVo dao)throws SQLException;
	
	public List<ReplyVo> selectComment(ReplyVo reply)throws SQLException;
	
	public List<BbsVo> selectAll(int start, int end)throws SQLException;
	
	public List<BbsVo> selectTitle(String title)throws SQLException;
	
	public List<BbsVo> selectContent(String bbscontent)throws SQLException;
	
	public boolean hitUp(BbsVo dao)throws SQLException;
	
	public BbsVo view(int no)throws SQLException;
	
	public boolean insert(ReplyVo Vo) throws SQLException;
	
	public int count() throws SQLException;
	
	public boolean cmAlldelete(int no)throws SQLException;
	
	public boolean cmdelete(int cmno)throws SQLException;
	
}


