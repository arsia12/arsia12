package com.board.service;

import java.util.List;

import com.board.model.ReviewVO;

public interface BoardService {

	int insertReview(ReviewVO review);
	
	List<ReviewVO> reviewList() throws Exception;
}
