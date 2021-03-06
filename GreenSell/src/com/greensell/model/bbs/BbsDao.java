package com.greensell.model.bbs;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.greensell.bbs.beans.*;
import com.greensell.member.beans.*;


public interface BbsDao {
   public boolean insert(BbsVo bean) throws SQLException;
   
   public boolean delete(int no)throws SQLException;
   
   public boolean update(BbsVo dao)throws SQLException;
   
   public List<ReplyVo> selectComment(ReplyVo reply)throws SQLException;
   
   public List<BbsVo> selectAll(int bbsno, int page)throws SQLException;
   
   public List<BbsVo> selectTitle(int bbsno,int start, int end, String title)throws SQLException;
   
   public List<BbsVo> selectContent(int bbsno,int start, int end,String bbscontent)throws SQLException;
   
   public boolean hitUp(BbsVo dao)throws SQLException;
   
   public BbsVo view(int no)throws SQLException;
   
   public boolean insert(ReplyVo Vo) throws SQLException;
   
   public int count(int bbsno) throws SQLException;
   
   public int counttitle(int bbsno, String title) throws SQLException;
   
   public int countcontent(int bbsno, String bbscontent) throws SQLException;
   
   public boolean cmAlldelete(int no)throws SQLException;
   
   public boolean cmdelete(int cmno)throws SQLException;
   
   public int grade(String email)throws SQLException;
   
   public List<BbsVo> selectSearch(int bbsno, int page, String title)throws SQLException;
   
   public int searchcount(Map<String, Object> map) throws SQLException;
   
}

