package com.ptconnect.myapp.domain;


public class BoardDTO extends MemberDTO{
	
	private int bdNo;
	private int mbNo;
	private String bdDate;
	private String bdDateM;
	private String bdDelYN;
	
	private String ntTitle;
	private String ntContent;
	private String FAQTitle;
	private String FAQContent;
	
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtContent() {
		return ntContent;
	}
	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}
	public String getFAQTitle() {
		return FAQTitle;
	}
	public void setFAQTitle(String fAQTitle) {
		FAQTitle = fAQTitle;
	}
	public String getFAQContent() {
		return FAQContent;
	}
	public void setFAQContent(String fAQContent) {
		FAQContent = fAQContent;
	}
	public int getBdNo() {
		return bdNo;
	}
	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}
	public int getMbNo() {
		return mbNo;
	}
	public void setMbNo(int mbNo) {
		this.mbNo = mbNo;
	}
	public String getBdDate() {
		return bdDate;
	}
	public void setBdDate(String bdDate) {
		this.bdDate = bdDate;
	}
	public String getBdDateM() {
		return bdDateM;
	}
	public void setBdDateM(String bdDateM) {
		this.bdDateM = bdDateM;
	}
	public String getBdDelYN() {
		return bdDelYN;
	}
	public void setBdDelYN(String bdDelYN) {
		this.bdDelYN = bdDelYN;
	}
	
}
