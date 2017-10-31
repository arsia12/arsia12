package com.board.model;

import java.util.List;

public interface BoardDAO {

	int insertReview(ReviewVO review);
	
	List<ReviewVO> reviewList() throws Exception;;
}
