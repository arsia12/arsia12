package com.common.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping(value="/review")
	public String review() {
		
		return "board/review";
	}
	
}
