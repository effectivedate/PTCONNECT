package com.ptconnect.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.MemberDTO;
import com.ptconnect.myapp.domain.NonMemberDTO;
import com.ptconnect.myapp.domain.PaymentDTO;

public interface MemberService {
	public int memberInsert(MemberDTO mo);
	public int trainerInsert(MemberDTO mo);
	public int centerInsert(CenterInfoDTO cio);
	public int memberEmailCheck(String mbEmail);

	public MemberDTO memberLogin(String mbEmail);
	public NonMemberDTO nonMemberLogin(String nmPhone);
	public ArrayList<PaymentDTO> nonMemberOrderList(int nmNo);
	public String memberEmailFind(String mbName, String mbPhone);
	public int memberPwdFind(String mbEmail, String mbPhone);
	
	public MemberDTO memberPwdCheck(int mbNo);
	public int memberPwdUpdate(MemberDTO mo);
}
