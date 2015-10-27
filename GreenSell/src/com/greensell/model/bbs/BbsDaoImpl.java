package com.greensell.model.bbs;

import java.sql.SQLException;
import java.util.List;
import com.greensell.bbs.beans.BbsVo;

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
	public boolean Delete(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean Update(BbsVo dao) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public BbsDao select(String name) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BbsDao> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BbsDao> selectnum() {
		// TODO Auto-generated method stub
		return null;
	}

}
