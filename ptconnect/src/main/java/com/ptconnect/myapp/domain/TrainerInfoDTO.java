package com.ptconnect.myapp.domain;

import java.util.ArrayList;

public class TrainerInfoDTO extends CenterInfoDTO{
	
	private int tnNo;
	private int mbNo;
	private int ctNo;
	private int flNo;
	private int ctFlNo;
	private ArrayList<FileDetailDTO> tioFileName;
	private String tnOneLine;
	private String tnIntro;
	private int tnTicket;
	private String tnDate;
	private String tnDateM;
	private String tnDelYN;
	private String tnImage;
	
	private int qlNo;
	private String qualify;
	private String qlDate;
	private String qlDateM;
	private String qlDelYN;
	
	
	private int lpNo;
	private String lpCf;
	private String lpCount;
	private String lessonPrice;
	private String lpDate;
	private String lpDateM;
	private String lpDelYN;
	
	private int pgNo;
	private String pgContent;
	private String pgDate;
	private String pgDateM;
	private String pgDelYN;

	private String priceInfo;
	
	private int reviewCnt; //리뷰 개수 임시 추가
	private float reviewRate;
	private double distance;
	private double selectMapY;
	private double selectMapX;
	
	private int totalSales;
	
	private ArrayList<PaymentDTO> salesList;
	
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public float getReviewRate() {
		return reviewRate;
	}
	public void setReviewRate(float reviewRate) {
		this.reviewRate = reviewRate;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public double getSelectMapY() {
		return selectMapY;
	}
	public void setSelectMapY(double selectMapY) {
		this.selectMapY = selectMapY;
	}
	public double getSelectMapX() {
		return selectMapX;
	}
	public void setSelectMapX(double selectMapX) {
		this.selectMapX = selectMapX;
	}	
	
	
	
	public String getPriceInfo() {
		return priceInfo;
	}
	public void setPriceInfo(String priceInfo) {
		this.priceInfo = priceInfo;
	}
	public int getPgNo() {
		return pgNo;
	}
	public void setPgNo(int pgNo) {
		this.pgNo = pgNo;
	}
	public String getPgContent() {
		return pgContent;
	}
	public void setPgContent(String pgContent) {
		this.pgContent = pgContent;
	}
	public String getPgDate() {
		return pgDate;
	}
	public void setPgDate(String pgDate) {
		this.pgDate = pgDate;
	}
	public String getPgDateM() {
		return pgDateM;
	}
	public void setPgDateM(String pgDateM) {
		this.pgDateM = pgDateM;
	}
	public String getPgDelYN() {
		return pgDelYN;
	}
	public void setPgDelYN(String pgDelYN) {
		this.pgDelYN = pgDelYN;
	}
	public int getQlNo() {
		return qlNo;
	}
	public void setQlNo(int qlNo) {
		this.qlNo = qlNo;
	}
	public String getQualify() {
		return qualify;
	}
	public void setQualify(String qualify) {
		this.qualify = qualify;
	}
	public String getQlDate() {
		return qlDate;
	}
	public void setQlDate(String qlDate) {
		this.qlDate = qlDate;
	}
	public String getQlDateM() {
		return qlDateM;
	}
	public void setQlDateM(String qlDateM) {
		this.qlDateM = qlDateM;
	}
	public String getQlDelYN() {
		return qlDelYN;
	}
	public void setQlDelYN(String qlDelYN) {
		this.qlDelYN = qlDelYN;
	}
	public int getLpNo() {
		return lpNo;
	}
	public void setLpNo(int lpNo) {
		this.lpNo = lpNo;
	}
	public String getLpCf() {
		return lpCf;
	}
	public void setLpCf(String lpCf) {
		this.lpCf = lpCf;
	}
	public String getLpCount() {
		return lpCount;
	}
	public void setLpCount(String lpCount) {
		this.lpCount = lpCount;
	}
	public String getLessonPrice() {
		return lessonPrice;
	}
	public void setLessonPrice(String lessonPrice) {
		this.lessonPrice = lessonPrice;
	}
	public String getLpDate() {
		return lpDate;
	}
	public void setLpDate(String lpDate) {
		this.lpDate = lpDate;
	}
	public String getLpDateM() {
		return lpDateM;
	}
	public void setLpDateM(String lpDateM) {
		this.lpDateM = lpDateM;
	}
	public String getLpDelYN() {
		return lpDelYN;
	}
	public void setLpDelYN(String lpDelYN) {
		this.lpDelYN = lpDelYN;
	}
	public int getTnNo() {
		return tnNo;
	}
	public void setTnNo(int tnNo) {
		this.tnNo = tnNo;
	}
	public int getMbNo() {
		return mbNo;
	}
	public void setMbNo(int mbNo) {
		this.mbNo = mbNo;
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
	public int getCtFlNo() {
		return ctFlNo;
	}
	public void setCtFlNo(int ctFlNo) {
		this.ctFlNo = ctFlNo;
	}
	public ArrayList<FileDetailDTO> getTioFileName() {
		return tioFileName;
	}
	public void setTioFileName(ArrayList<FileDetailDTO> tioFileName) {
		this.tioFileName = tioFileName;
	}
	public String getTnOneLine() {
		return tnOneLine;
	}
	public void setTnOneLine(String tnOneLine) {
		this.tnOneLine = tnOneLine;
	}
	public String getTnIntro() {
		return tnIntro;
	}
	public void setTnIntro(String tnIntro) {
		this.tnIntro = tnIntro;
	}
	public int getTnTicket() {
		return tnTicket;
	}
	public void setTnTicket(int tnTicket) {
		this.tnTicket = tnTicket;
	}
	public String getTnDate() {
		return tnDate;
	}
	public void setTnDate(String tnDate) {
		this.tnDate = tnDate;
	}
	public String getTnDateM() {
		return tnDateM;
	}
	public void setTnDateM(String tnDateM) {
		this.tnDateM = tnDateM;
	}
	public String getTnDelYN() {
		return tnDelYN;
	}
	public void setTnDelYN(String tnDelYN) {
		this.tnDelYN = tnDelYN;
	}
	public String getTnImage() {
		return tnImage;
	}
	public void setTnImage(String tnImage) {
		this.tnImage = tnImage;
	}
	public ArrayList<PaymentDTO> getSalesList() {
		return salesList;
	}
	public void setSalesList(ArrayList<PaymentDTO> salesList) {
		this.salesList = salesList;
	}
	public int getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}
	}
