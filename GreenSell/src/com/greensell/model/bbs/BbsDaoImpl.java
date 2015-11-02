package com.greensell.model.bbs;

import java.sql.SQLException;
import java.util.List;
import com.greensell.bbs.beans.BbsVo;
import com.greensell.bbs.beans.ReplyVo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class BbsDaoImpl implements BbsDao {
	
	@Autowired //������ Ÿ���� ���� bean�� ã�� ����
	private SqlSession sqlsession;

	@Override
	public boolean insert(BbsVo b) throws SQLException{
		int t = sqlsession.insert("bbs.bbsinsert", b);
		if(t==1){return true;}
		return false;
	}

	@Override
	//게시글 번호를 받아 삭제
	public boolean delete(int no) {
		int t = sqlsession.delete("bbs.bbsdelete", no);
		if(t==1){return true;}
		return false;
	}

	@Override
	public boolean update(BbsVo dao) {
		int t = sqlsession.update("bbs.bbsupdate", dao);
		if(t==1){return true;}
		return false;
	}

	@Override
	public List<ReplyVo> selectComment(ReplyVo reply) throws SQLException {
		List<ReplyVo> list=sqlsession.selectList("bbs.cmselect",reply);
		return list;
	}

	@Override
	public List<BbsVo> selectAll() throws SQLException{
		List<BbsVo> list = sqlsession.selectList("bbs.bbsselectall");
		return list;
	}

	@Override	
	public List<BbsVo> selectTitle(String title) throws SQLException{
		List<BbsVo> list = sqlsession.selectList("bbs.bbsselecttitle", title);
		return list;
	}
	
	@Override	
	public List<BbsVo> selectContent(String bbscontent) throws SQLException{
		List<BbsVo> list = sqlsession.selectList("bbs.bbsselectcontent", bbscontent);
		return list;
	}

	@Override
	public boolean hitUp(BbsVo dao) throws SQLException {
		int t = sqlsession.update("bbs.hitup", dao);
		if(t==1){return true;}
		return false;
	}

	@Override
	public BbsVo view(int no) throws SQLException {
		BbsVo bbsVo = sqlsession.selectOne("bbs.view",no);
		return bbsVo;
	}

	@Override
	public boolean insert(ReplyVo Vo) throws SQLException {
		int t = sqlsession.insert("bbs.cminsert", Vo);
		if(t==1){return true;}
		return false;
	}

	@Override
	public int count() throws SQLException {
		int num = sqlsession.selectOne("bbs.count");
		return num;
	}

	@Override
	public boolean cmdelete(int cmno) throws SQLException {
		int t = sqlsession.delete("bbs.cmdelete", cmno);
		if(t==1){return true;}
		return false;
	}

	@Override
	public boolean cmAlldelete(int no) throws SQLException {
		int t = sqlsession.delete("bbs.cmAlldelete", no);
		if(t==1){return true;}
		return false;
	}

}
