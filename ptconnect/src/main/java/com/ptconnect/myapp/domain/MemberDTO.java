package com.ptconnect.myapp.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/*
     * @Valid 어노테이션을 이용해서 model의 값을 지정하는 경우 아래의 방식으로 통해서 데이터 유효성 검증을 진행 할 수 있습니다.
     * 
     * @AssertFalse : false 값만 통과 가능
     * @AssertTrue : true 값만 통과 가능
     * @DecimalMax(value=) : 지정된 값 이하의 실수만 통과 가능
     * @DecimalMin(value=) : 지정된 값 이상의 실수만 통과 가능
     * @Digits(integer=,fraction=) : 대상 수가 지정된 정수와 소수 자리수보다 적을 경우 통과 가능
     * @Future : 대상 날짜가 현재보다 미래일 경우만 통과 가능
     * @Past : 대상 날짜가 현재보다 과거일 경우만 통과 가능
     * @Max(value) : 지정된 값보다 아래일 경우만 통과 가능
     * @Min(value) : 지정된 값보다 이상일 경우만 통과 가능
     * @NotNull : null 값이 아닐 경우만 통과 가능
     * @Null : null일 겨우만 통과 가능
     * @Pattern(regex=, flag=) : 해당 정규식을 만족할 경우만 통과 가능
     * @Size(min=, max=) : 문자열 또는 배열이 지정된 값 사이일 경우 통과 가능
     * @Valid : 대상 객체의 확인 조건을 만족할 경우 통과 가능
     * */


public class MemberDTO {
	
	private int mbNo;
	private String mbAuth;
	@Email(message = "이메일 형식을 맞게 입력해주세요.")
	@NotEmpty(message = "이메일을 입력해주세요.")
	private String mbEmail;
	@NotEmpty(message = "비밀번호를 입력해주세요.")
	@Size(min=8, max=15, message="비밀번호는 8자 ~15자 사이로 입력해주세요.")
	private String mbPwd;
	@NotEmpty(message = "이름을 입력해주세요.")
	@Size(min=2, max=12, message="이름은 2자~12자 사이로 입력해주세요")
	private String mbName;
	@Pattern(regexp="^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$", message="전화번호를 정확히 입력해주세요.")
	@NotEmpty(message = "전화번호를 입력해주세요.")
	private String mbPhone;
	private String mbAddr;
	@NotEmpty(message = "주소를 입력해주세요.")
	private String postcode;
	@NotEmpty(message = "주소를 입력해주세요.")
	private String addr;
	@NotEmpty(message = "상세주소를 입력해주세요.")
	private String addrDetail;
	@NotNull(message = "주소 찾기를 사용해서 주소를 입력해주세요")
	private double mbMapY;
	@NotNull(message = "주소 찾기를 사용해서 주소를 입력해주세요")
	private double mbMapX;
	private String mbDate;
	private String mbDateM;

	public int getMbNo() {
		return mbNo;
	}
	public void setMbNo(int mbNo) {
		this.mbNo = mbNo;
	}
	public String getMbAuth() {
		return mbAuth;
	}
	public void setMbAuth(String mbAuth) {
		this.mbAuth = mbAuth;
	}
	public String getMbEmail() {
		return mbEmail;
	}
	public void setMbEmail(String mbEmail) {
		this.mbEmail = mbEmail;
	}
	public String getMbPwd() {
		return mbPwd;
	}
	public void setMbPwd(String mbPwd) {
		this.mbPwd = mbPwd;
	}
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getMbPhone() {
		return mbPhone;
	}
	public void setMbPhone(String mbPhone) {
		this.mbPhone = mbPhone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getMbAddr() {
		return mbAddr;
	}
	public void setMbAddr(String mbAddr) {
		this.mbAddr = mbAddr;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public double getMbMapY() {
		return mbMapY;
	}
	public void setMbMapY(double mbMapY) {
		this.mbMapY = mbMapY;
	}
	public double getMbMapX() {
		return mbMapX;
	}
	public void setMbMapX(double mbMapX) {
		this.mbMapX = mbMapX;
	}
	public String getMbDate() {
		return mbDate;
	}
	public void setMbDate(String mbDate) {
		this.mbDate = mbDate;
	}
	public String getMbDateM() {
		return mbDateM;
	}
	public void setMbDateM(String mbDateM) {
		this.mbDateM = mbDateM;
	}
}
