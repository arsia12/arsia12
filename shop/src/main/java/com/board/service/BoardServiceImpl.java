package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.board.model.BoardDAO;
import com.board.model.ReviewVO;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	@Qualifier("boardDAOImpl")
	private BoardDAO boardDAO;
	
	public int insertReview(ReviewVO review) {
		return boardDAO.insertReview(review);
	}
	
	public List<ReviewVO> reviewList() throws Exception{
		return boardDAO.reviewList();
	}
}
