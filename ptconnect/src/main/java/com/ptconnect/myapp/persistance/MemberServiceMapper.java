package com.ptconnect.myapp.persistance;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.MemberDTO;
import com.ptconnect.myapp.domain.NonMemberDTO;
import com.ptconnect.myapp.domain.PaymentDTO;

public interface MemberServiceMapper {
	public int memberInsert(MemberDTO mo);
	public int centerInsert(CenterInfoDTO cio);
	public int centerInfoInsert(CenterInfoDTO cio);
	public int memberEmailCheck(String mbEmail);
	public MemberDTO memberLogin(@Param("mbEmail")String mbEmail);
	public String memberEmailFind(@Param("mbName")String mbName, @Param("mbPhone")String mbPhone);
	public int memberPwdFind(@Param("mbEmail")String mbEmail, @Param("mbPhone")String mbPhone);
	public NonMemberDTO nonMemberLogin(@Param("nmPhone")String nmPhone);
	public ArrayList<PaymentDTO> nonMemberOrderList(@Param("nmNo")int nmNo);
	public MemberDTO memberPwdCheck(@Param("mbNo")int mbNo);
	public int memberPwdUpdate(MemberDTO mo);
	
}
