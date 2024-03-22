package com.ptconnect.myapp.domain;


public class PaymentDTO {
	
	private String pmNo;
	private String odNo;
	private String portOneNo;
	private String pgCorp;
	private String pmMethod;
	private String pmCard;
	private int pmPrice;
	private String pmDate;
	private String pmState;
	
	/*mbName=구매자이름 , tnName=판매자이름*/

	private String mbName;
	private String mbPhone;
	private String tnName;
	
	private int mbNo;
	private int nmNo;
	private int odPoint;
	private int odCoupon;
	private int odPrice;
	private String odDate;
	
	private int opNo;
	private int tnNo;
	private String opIntro;
	
	private int pcPrice;
	private String pcContent;
	private String pcDate;
	private String pcState;
	
	private int ptNo;
	private int ptPoint;
	private int ptBalance;
	private String ptContent;
	private String ptDate;
	private String ptDateM;
	
	private int upNo;
	private int usePoint;
	private String useContent;
	private String useDate;
	
	private int usePointDetail;
	
	private String nmName;
	private String nmPwd;
	private String nmPhone;
	private String nmDate;
	private String nmDelYN;
	
	private int remainUsePoint;
	private int orderUserMbNo;
	private String oderMbPhone;
	
	public String getNmPhone() {
		return nmPhone;
	}
	public void setNmPhone(String nmPhone) {
		this.nmPhone = nmPhone;
	}
	public String getNmName() {
		return nmName;
	}
	public void setNmName(String nmName) {
		this.nmName = nmName;
	}
	public String getNmPwd() {
		return nmPwd;
	}
	public void setNmPwd(String nmPwd) {
		this.nmPwd = nmPwd;
	}
	public String getNmDate() {
		return nmDate;
	}
	public void setNmDate(String nmDate) {
		this.nmDate = nmDate;
	}
	public String getNmDelYN() {
		return nmDelYN;
	}
	public void setNmDelYN(String nmDelYN) {
		this.nmDelYN = nmDelYN;
	}
	public int getUpNo() {
		return upNo;
	}
	public void setUpNo(int upNo) {
		this.upNo = upNo;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public String getUseContent() {
		return useContent;
	}
	public void setUseContent(String useContent) {
		this.useContent = useContent;
	}
	public String getUseDate() {
		return useDate;
	}
	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}
	public int getUsePointDetail() {
		return usePointDetail;
	}
	public void setUsePointDetail(int usePointDetail) {
		this.usePointDetail = usePointDetail;
	}
	public int getPtPoint() {
		return ptPoint;
	}
	public void setPtPoint(int ptPoint) {
		this.ptPoint = ptPoint;
	}
	public int getPtBalance() {
		return ptBalance;
	}
	public void setPtBalance(int ptBalance) {
		this.ptBalance = ptBalance;
	}
	public String getPtContent() {
		return ptContent;
	}
	public void setPtContent(String ptContent) {
		this.ptContent = ptContent;
	}
	public String getPtDate() {
		return ptDate;
	}
	public void setPtDate(String ptDate) {
		this.ptDate = ptDate;
	}
	public String getPtDateM() {
		return ptDateM;
	}
	public void setPtDateM(String ptDateM) {
		this.ptDateM = ptDateM;
	}
	public int getPcPrice() {
		return pcPrice;
	}
	public void setPcPrice(int pcPrice) {
		this.pcPrice = pcPrice;
	}
	public String getPcContent() {
		return pcContent;
	}
	public void setPcContent(String pcContent) {
		this.pcContent = pcContent;
	}
	public String getPcDate() {
		return pcDate;
	}
	public void setPcDate(String pcDate) {
		this.pcDate = pcDate;
	}
	public String getPcState() {
		return pcState;
	}
	public void setPcState(String pcState) {
		this.pcState = pcState;
	}
	public int getOpNo() {
		return opNo;
	}
	public void setOpNo(int opNo) {
		this.opNo = opNo;
	}
	public int getTnNo() {
		return tnNo;
	}
	public void setTnNo(int tnNo) {
		this.tnNo = tnNo;
	}
	public String getOpIntro() {
		return opIntro;
	}
	public void setOpIntro(String opIntro) {
		this.opIntro = opIntro;
	}
	public int getMbNo() {
		return mbNo;
	}
	public void setMbNo(int mbNo) {
		this.mbNo = mbNo;
	}
	public int getNmNo() {
		return nmNo;
	}
	public void setNmNo(int nmNo) {
		this.nmNo = nmNo;
	}
	public int getOdPoint() {
		return odPoint;
	}
	public void setOdPoint(int odPoint) {
		this.odPoint = odPoint;
	}
	public int getOdCoupon() {
		return odCoupon;
	}
	public void setOdCoupon(int odCoupon) {
		this.odCoupon = odCoupon;
	}
	public int getOdPrice() {
		return odPrice;
	}
	public void setOdPrice(int odPrice) {
		this.odPrice = odPrice;
	}
	public String getOdDate() {
		return odDate;
	}
	public void setOdDate(String odDate) {
		this.odDate = odDate;
	}
	public String getPmNo() {
		return pmNo;
	}
	public void setPmNo(String pmNo) {
		this.pmNo = pmNo;
	}
	public String getOdNo() {
		return odNo;
	}
	public void setOdNo(String odNo) {
		this.odNo = odNo;
	}
	public String getPortOneNo() {
		return portOneNo;
	}
	public void setPortOneNo(String portOneNo) {
		this.portOneNo = portOneNo;
	}
	public String getPgCorp() {
		return pgCorp;
	}
	public void setPgCorp(String pgCorp) {
		this.pgCorp = pgCorp;
	}
	public String getPmMethod() {
		return pmMethod;
	}
	public void setPmMethod(String pmMethod) {
		this.pmMethod = pmMethod;
	}
	public String getPmCard() {
		return pmCard;
	}
	public void setPmCard(String pmCard) {
		this.pmCard = pmCard;
	}
	public int getPmPrice() {
		return pmPrice;
	}
	public void setPmPrice(int pmPrice) {
		this.pmPrice = pmPrice;
	}
	public String getPmDate() {
		return pmDate;
	}
	public void setPmDate(String pmDate) {
		this.pmDate = pmDate;
	}
	public String getPmState() {
		return pmState;
	}
	public void setPmState(String pmState) {
		this.pmState = pmState;
	}
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getTnName() {
		return tnName;
	}
	public void setTnName(String tnName) {
		this.tnName = tnName;
	}
	public String getMbPhone() {
		return mbPhone;
	}
	public void setMbPhone(String mbPhone) {
		this.mbPhone = mbPhone;
	}
	public int getRemainUsePoint() {
		return remainUsePoint;
	}
	public void setRemainUsePoint(int remainUsePoint) {
		this.remainUsePoint = remainUsePoint;
	}
	public int getPtNo() {
		return ptNo;
	}
	public void setPtNo(int ptNo) {
		this.ptNo = ptNo;
	}
	public int getOrderUserMbNo() {
		return orderUserMbNo;
	}
	public void setOrderUserMbNo(int orderUserMbNo) {
		this.orderUserMbNo = orderUserMbNo;
	}
	public String getOderMbPhone() {
		return oderMbPhone;
	}
	public void setOderMbPhone(String oderMbPhone) {
		this.oderMbPhone = oderMbPhone;
	}
	
}
