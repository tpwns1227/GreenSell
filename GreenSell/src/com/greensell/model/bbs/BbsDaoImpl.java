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
	public boolean Insert(BbsVo b) throws SQLException{
		int t = sqlsession.insert("bbs.bbsinsert", b);
		if(t==1){return true;}
		return false;
	}

	@Override
	//게시글 번호를 받아 삭제
	public boolean Delete(int no) {
		int t = sqlsession.delete("bbs.delete", no);
		if(t==1){return true;}
		return false;
	}

	@Override
	public boolean Update(BbsVo dao) {
		int t = sqlsession.update("bbs.update", dao);
		if(t==1){return true;}
		return false;
	}

	@Override
	public List<ReplyVo> selectcommet() throws SQLException {
		List<ReplyVo> list=sqlsession.selectList("bbs.cmselect");
		return list;
	}

	@Override
	public List<BbsVo> selectAll() throws SQLException{
		List<BbsVo> list = sqlsession.selectList("bbs.bbsselectall");
		return list;
	}

	@Override	
	public List<BbsVo> selecttarget() throws SQLException{
		List<BbsVo> list = sqlsession.selectList("bbs.bbsselecttarget");
		return list;
	}

	@Override
	public boolean Hitup(BbsVo dao) throws SQLException {
		int t = sqlsession.update("bbs.hitup", dao);
		if(t==1){return true;}
		return false;
	}

}
