package com.common.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.model.ReviewVO;
import com.board.service.BoardService;
import com.common.util.CommonUtil;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommonUtil util;
	
	
	@RequestMapping(value="/review")
	public String review(Model m) throws Exception {
		
		List<ReviewVO> list = boardService.reviewList();
		
		m.addAttribute("list",list);
		
		return "board/review";
	} 
	
	@RequestMapping(value="/bbsWrite")
	public String reviewForm() {
		return "board/reviewForm";
	}
	
	
	// 여기하는중!!!!!
	@RequestMapping(value="/reviewInsert")
	public String reviewInsert(Model m, @ModelAttribute("review") ReviewVO review) {
		
		int n = boardService.insertReview(review);
		String msg=(n>0)? "등록성공":"등록실패";
		String loc="review";
		
		return util.addMsgLoc(m, msg, loc);
	}
}
