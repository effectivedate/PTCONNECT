package com.ptconnect.myapp.domain;

import java.util.ArrayList;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class CenterInfoDTO extends MemberDTO{
	
	private int ctNo;
	private int flNo;
	private String ctName;
	private String ctIntro;
	private String ctOperate;
	private String ctInfo;
//	@Pattern(regexp="^[0-9]{3}[0-9]{2}[0-9]{5}$", message="전화번호를 정확히 입력해주세요.")
//	@NotEmpty(message = "전화번호를 입력해주세요.")
	private String ctBn;
	private String ctPrice;
	
	

	private int cpNo;
	private String cpCount;
	private String centerPrice;
	private String cpDate;
	private String cpDateM;
	
	private String ctDate;
	private String ctDateM;
	private String ctDelYN;

	private ArrayList<FileDetailDTO> cioFileName;
	
	
	
	public ArrayList<FileDetailDTO> getCioFileName() {
		return cioFileName;
	}
	public void setCioFileName(ArrayList<FileDetailDTO> cioFileName) {
		this.cioFileName = cioFileName;
	}
	public int getCtNo() {
		return ctNo;
	}
	public void setCtNo(int ctNo) {
		this.ctNo = ctNo;
	}
	public int getFlNo() {
		return flNo;
	}
	public void setFlNo(int flNo) {
		this.flNo = flNo;
	}
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}
	public String getCtIntro() {
		return ctIntro;
	}
	public void setCtIntro(String ctIntro) {
		this.ctIntro = ctIntro;
	}
	public String getCtOperate() {
		return ctOperate;
	}
	public void setCtOperate(String ctOperate) {
		this.ctOperate = ctOperate;
	}
	public String getCtInfo() {
		return ctInfo;
	}
	public void setCtInfo(String ctInfo) {
		this.ctInfo = ctInfo;
	}
	public String getCtBn() {
		return ctBn;
	}
	public void setCtBn(String ctBn) {
		this.ctBn = ctBn;
	}
	
	public int getCpNo() {
		return cpNo;
	}
	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}
	public String getCpCount() {
		return cpCount;
	}
	public void setCpCount(String cpCount) {
		this.cpCount = cpCount;
	}
	public String getCenterPrice() {
		return centerPrice;
	}
	public void setCenterPrice(String centerPrice) {
		this.centerPrice = centerPrice;
	}
	public String getCpDate() {
		return cpDate;
	}
	public void setCpDate(String cpDate) {
		this.cpDate = cpDate;
	}
	public String getCpDateM() {
		return cpDateM;
	}
	public void setCpDateM(String cpDateM) {
		this.cpDateM = cpDateM;
	}
	public String getCtDate() {
		return ctDate;
	}
	public void setCtDate(String ctDate) {
		this.ctDate = ctDate;
	}
	public String getCtDateM() {
		return ctDateM;
	}
	public void setCtDateM(String ctDateM) {
		this.ctDateM = ctDateM;
	}
	public String getCtPrice() {
		return ctPrice;
	}
	public void setCtPrice(String ctPrice) {
		this.ctPrice = ctPrice;
	}
	public String getCtDelYN() {
		return ctDelYN;
	}
	public void setCtDelYN(String ctDelYN) {
		this.ctDelYN = ctDelYN;
	}

}
