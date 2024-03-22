package com.ptconnect.myapp.domain;

import java.util.ArrayList;

public class ReviewDTO extends TrainerInfoDTO{
	
	private int rvNo;
	private String rvContent;
	private ArrayList<FileDetailDTO> rvFilename;
	private int rvRate;
	private String rvDate;
	private String rvDateM;
	private String rvDelYN;
	
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public ArrayList<FileDetailDTO> getRvFilename() {
		return rvFilename;
	}
	public void setRvFilename(ArrayList<FileDetailDTO> rvFilename) {
		this.rvFilename = rvFilename;
	}
	public int getRvRate() {
		return rvRate;
	}
	public void setRvRate(int rvRate) {
		this.rvRate = rvRate;
	}
	public String getRvDate() {
		return rvDate;
	}
	public void setRvDate(String rvDate) {
		this.rvDate = rvDate;
	}
	public String getRvDateM() {
		return rvDateM;
	}
	public void setRvDateM(String rvDateM) {
		this.rvDateM = rvDateM;
	}
	public String getRvDelYN() {
		return rvDelYN;
	}
	public void setRvDelYN(String rvDelYN) {
		this.rvDelYN = rvDelYN;
	}
	
}
