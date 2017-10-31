package com.board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("boardDAOImpl")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlsession;
	
	private final String NS="com.board.model.BoardMapper";
	
	@Override
	public int insertReview(ReviewVO review) {
		return sqlsession.insert(NS+".insertReivew", review);
	}
	
	@Override
	public List<ReviewVO> reviewList() throws Exception {
		return sqlsession.selectList(NS+".reviewList");
	}
	
}
