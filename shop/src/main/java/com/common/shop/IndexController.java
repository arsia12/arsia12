package com.common.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	public IndexController() {
		System.out.println("��Ʈ�ѷ�������");
	}
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	} 
}
 