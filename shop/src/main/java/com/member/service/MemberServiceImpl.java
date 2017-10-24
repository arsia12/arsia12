package com.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.member.model.MemberDAO;
import com.member.model.MemberVO;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Autowired
	@Qualifier("memberDAOImpl")
	private MemberDAO memberDAO;
	
	@Override
	public int insertUser(MemberVO member) {
		return memberDAO.insertUser(member);
	}
	
	@Override
	public boolean idCheck(String id) {
		return memberDAO.idCheck(id);
	}
}
