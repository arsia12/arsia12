package com.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.member.model.MemberDAO;
import com.member.model.MemberVO;
import com.member.model.NotUserException;

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
	
	@Override
	public MemberVO loginCheck(MemberVO member) throws NotUserException{
		MemberVO m = memberDAO.loginCheck(member);
		if(m==null) {
			throw new NotUserException("���̵� �������� �ʽ��ϴ�.");
		}else{
			if(m.getPwd().equals(member.getPwd())) {
				return m;
			}else {
				throw new NotUserException("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
			} 
		}
	}
}
