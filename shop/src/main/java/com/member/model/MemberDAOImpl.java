package com.member.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("memberDAOImpl")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlsession;
	
	private final String NS="com.member.model.UserMapper";
	
	@Override
	public int insertUser(MemberVO member) {
		return sqlsession.insert(NS+".insertUser", member);
	}
	
	@Override
	public boolean idCheck(String id) {
		boolean isUse=false;
		int n=sqlsession.selectOne(NS+".idCheck", id);
		isUse=(n>0)? false:true;
		return isUse;
	}
	
	@Override
	public MemberVO loginCheck(MemberVO member) {
		return sqlsession.selectOne(NS+".loginCheck", member.getId());
	}

}
