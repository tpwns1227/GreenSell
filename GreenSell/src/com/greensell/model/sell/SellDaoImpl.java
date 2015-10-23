package com.greensell.model.sell;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class SellDaoImpl implements SellDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String personList() {
		// TODO Auto-generated method stub
		String p = sqlSession.selectOne("emp.empname");
		return p;
	}

	
	
}
