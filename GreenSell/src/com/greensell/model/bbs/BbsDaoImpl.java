package com.greensell.model.bbs;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class BbsDaoImpl implements BbsDao {
	
	@Autowired //데이터 타입이 같은 bean을 찾아 적용
	private SqlSession sqlsession;

	@Override
	public boolean Insert(BbsDao dao) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean Delete(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean Update(BbsDao dao) {
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

}
