package com.ptconnect.myapp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ptconnect.myapp.domain.FileDetailDTO;
import com.ptconnect.myapp.domain.MemberDTO;
import com.ptconnect.myapp.domain.PageMaker;
import com.ptconnect.myapp.domain.ReviewDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.service.CenterService;
import com.ptconnect.myapp.service.PaymentService;
import com.ptconnect.myapp.service.TrainerService;

@Controller
public class TrainerController {
	
	@Autowired
	TrainerService ts;
	
	@Autowired
	PaymentService ps;
	
	@Autowired
	CenterService cs;
	
	@Autowired(required = false)
	PageMaker pm;
	
	
	@GetMapping(value = "/findTrainer")
	public String findTrainer(HttpServletRequest request, SearchCriteria scri, Model model) {
		
		HttpSession session = request.getSession(false);
		int filterOnOff = 0;	//검색 or 필터 사용시 화면에 필터 펼쳐짐 상태 1:펼쳐짐, 0:졉혀짐
		String uAddr = null;	//로그인 한 유저 주소내용 전체에서 " "로 잘라서 n번째 주소값만 가져와 담기 위한 변수
		String[] uAddrReturn = null;
		
		//카카오맵에 찍은 좌표와 좌표로 변환한 주소
		String selectedAddr = null;
		double selectMapY = 0.0;
		double selectMapX = 0.0;
		
		//세션이 null이 아니면 그리고 세션의 mbNo가 널이 아니고 빈 문자열이 아니면 값 할당
		if(session != null) {
			if(session.getAttribute("mbNo") != null && !session.getAttribute("mbNo").equals("")) {
				scri.setMbNo((int)session.getAttribute("mbNo"));
				scri.setMbMapY((double)session.getAttribute("mbMapY"));
				scri.setMbMapX((double)session.getAttribute("mbMapX"));
				uAddr = ts.loginUserAddr((int)session.getAttribute("mbNo"));
				uAddrReturn = uAddr.split("/");
				uAddr = uAddrReturn[1];	//예시 
			}
		}
		
		//findTrainer 카카오맵 위에 마우스 클릭 시 클릭한 지점 좌표 받아와서 scri의 mbMapY, mbMapX에 할당 
		if(request.getParameter("selectMapY") != null && request.getParameter("selectMapY") != "") {
			if(request.getParameter("selectMapX") != null && request.getParameter("selectMapX") != "") {
				
				scri.setMbMapY(Double.parseDouble(request.getParameter("selectMapY")));
				scri.setMbMapX(Double.parseDouble(request.getParameter("selectMapX")));
				selectedAddr = request.getParameter("selectedAddr");
				selectMapY = Double.parseDouble(request.getParameter("selectMapY"));
				selectMapX = Double.parseDouble(request.getParameter("selectMapX"));
			}
			
		}
		
		//검색 키워드가 없거나 공백이면 null할당
		if(scri.getKeyword() == null || scri.getKeyword().equals("") || scri.getKeyword().equals(" ")) {
			scri.setKeyword(null);
		}
		
		//반경이 null이 아니면, findTrainer.jsp의 <input type="range">에서 설정한 최대 최소 범위를 초과한 값을 억지로 넣으면 범위 조정
		//기본값으로 1000(1km) 설정
		if(request.getParameter("distance") != null) {
			if(Integer.parseInt(request.getParameter("distance")) > 5000) {
				scri.setDistance(5000);
				filterOnOff = 1;
			}else if(Integer.parseInt(request.getParameter("distance")) < 500) {
				scri.setDistance(500);
				filterOnOff = 1;
			}else {
				scri.setDistance(Integer.parseInt(request.getParameter("distance")));
				filterOnOff = 1;
			}
			
		}else {
			scri.setDistance(1000);
		}
		
		//정렬 순서가 null이 아니고 들어온 값이 orderByList 문자열 단어 중에 하나가 있으면 정렬 기준 할당
		//아니면 기본 정렬순서를 distance(반경)으로 설정
		if(request.getParameter("orderBy") != null && request.getParameter("orderBy") != "") {
			String orderByTest = request.getParameter("orderBy");
			String orderByList = "distancereviewCnttnTicket";
			if(orderByList.contains(orderByTest)) {
				scri.setOrderBy(orderByTest);
				filterOnOff = 1;
			}
		}else {
			scri.setOrderBy("distance");
		}
		
		pm.setCurrentPage(scri.getPage());
		int totalCount = ts.trainerTotalCount(scri);
//		System.out.println("totalCount : " + totalCount);
		pm.setScri(scri);
		pm.setTotalCount(totalCount);
		
		model.addAttribute("pm", pm);
		model.addAttribute("filterOnOff", filterOnOff);
		model.addAttribute("uAddr", uAddr);
		model.addAttribute("selectedAddr", selectedAddr);
		model.addAttribute("selectMapY", selectMapY);
		model.addAttribute("selectMapX", selectMapX);
		
		ArrayList<TrainerInfoDTO> tio_alist = ts.findTrainer(scri);
		
		//사용자의 위치로부터 각 트레이너들 간의 거리 할당
		for(int i = 0; i < tio_alist.size(); i++) {
			ArrayList<FileDetailDTO> fdo_alist = new ArrayList<FileDetailDTO>();
			ArrayList<FileDetailDTO> fdo_alist2 = new ArrayList<FileDetailDTO>();
			fdo_alist = ts.TrainerInfoView_photo_two(tio_alist.get(i).getFlNo());
			fdo_alist2.add(ts.center_photo_one(tio_alist.get(i).getCtFlNo()));
			tio_alist.get(i).setTioFileName(fdo_alist);
			tio_alist.get(i).setCioFileName(fdo_alist2);
			tio_alist.get(i).setDistance(Math.round((tio_alist.get(i).getDistance()*10)/10));
		}
		
		model.addAttribute("tio_alist", tio_alist);
		
		return "trainer/findTrainer";
	}
	
	@GetMapping(value = "trainerInfoView")
	public String trainerInfoView(@RequestParam(name = "tnNo", required = true) int idx, HttpServletRequest request, Model model) throws IOException {
		
		int tnNo = 0;
		tnNo = idx;
		
		HttpSession session = request.getSession();
		session.setAttribute("tnNo", idx);
		System.out.println("tnNo : " + tnNo);
		
		Integer mbNo = (Integer) session.getAttribute("mbNo");
		System.out.println("mbNo : " + mbNo);
		
		//트레이너 번호 받아서 해당 트레이너 정보 가져옴
		TrainerInfoDTO tio = ts.TrainerInfoView(tnNo);
		
		//리뷰 평점 소수점 1자리까지만 표기
		float round1 = tio.getReviewRate()*10;
		round1 = Math.round(round1);
		round1 = round1/10;
		tio.setReviewRate(round1);
		
		//바로 위 tio의 flNo받아서 해당 트레이너에 대한 사진들 가져옴(사진 없으면 flNo 기본값 0)
		ArrayList<FileDetailDTO> tio_photo_alist = ts.TrainerInfoView_photos(tio.getFlNo());
		
		TrainerInfoDTO tio2 = cs.centerInfoView(idx);
		ArrayList<FileDetailDTO> centerPhotos = new ArrayList<FileDetailDTO>();
		centerPhotos = cs.centerInfoView_photos(tio2.getFlNo());
		
		String[] QualifyArr = null;
		if(tio.getQualify().contains(",")) {
			QualifyArr = tio.getQualify().split(",");
		}else {
			QualifyArr = new String[1];
			QualifyArr[0] = tio.getQualify();
		}
		
		JSONArray jsAry = new JSONArray();
		String[] lpCount = null;
		String[] lessonPrice = null;
		if(tio.getLpCount().contains(",")) {
			lpCount = tio.getLpCount().split(",");
			lessonPrice = tio.getLessonPrice().split(",");
			for(int i = 0; i < lpCount.length; i++) {
				String CP = "{\"lpCount\" : \""+lpCount[i]+"\", \"lessonPrice\" : \""+lessonPrice[i]+"\"}";
				
				int avglessonPrice = Integer.parseInt(lessonPrice[i]);
				int lessonCount = Integer.parseInt(lpCount[i]);
				int avgPrice = avglessonPrice / lessonCount;
				long roundedAvgPrice = Math.round(avgPrice / 100.0) * 100;
				
				JSONObject js = new JSONObject();
				js.put("lpCount",lpCount[i]);
				js.put("lessonPrice",lessonPrice[i]);
				js.put("avgPrice",roundedAvgPrice);
				jsAry.add(js);
			}
		}else {
			lpCount = new String[1];
			lessonPrice = new String[1];
			lpCount[0] = tio.getLpCount();
			lessonPrice[0] = tio.getLessonPrice();
		}
		
//		String testStr = ",,,,";
//		String[] testStrArr = testStr.split(",");
//		for (int i = 0; i <= testStrArr.length; i++) {
//			System.out.println("testStrArr["+i+"] : " + testStrArr[i] + "");
//		}
		
		//트레이너가 진행하는 프로그램들  가져옴
		ArrayList<TrainerInfoDTO> tio_alist = new ArrayList<TrainerInfoDTO>();
		tio_alist = ts.trainerInfoView_Programs(tnNo);
		
		//해당 트레이너에 대한 리뷰(후기)들 가져옴
		ArrayList<ReviewDTO> rvo_alist = ts.TrainerInfoView_reviews(tnNo);
		
		//리뷰들에 대해 리뷰들 각각의  flNo 가져가서 리뷰가 첨부한 사진들 가져옴
		for(int i = 0; i < rvo_alist.size(); i++) {
			ArrayList<FileDetailDTO> fdo_alist = new ArrayList<FileDetailDTO>();
			fdo_alist = ts.TrainerInfoView_reviews_files(rvo_alist.get(i).getFlNo());
			rvo_alist.get(i).setRvFilename(fdo_alist);
		}
		
		if(mbNo != null) {
			int sumPoint = ps.sumPoint(mbNo);
			System.out.println("sumPoint : " + sumPoint);
			
		model.addAttribute("sumPoint", sumPoint);
		}else {
			model.addAttribute("sumPoint", 0);
		}

		model.addAttribute("tio", tio);
		model.addAttribute("tio_alist", tio_alist);
		model.addAttribute("QualifyArr", QualifyArr);
		model.addAttribute("aryList", jsAry);
		model.addAttribute("rvo_alist", rvo_alist);
		model.addAttribute("tio_photo_alist", tio_photo_alist);
		model.addAttribute("centerPhotos", centerPhotos);
		
		if (mbNo != null) {
			MemberDTO mo = ts.memberSelectOne(mbNo);
			System.out.println("mbName :" + mo.getMbName());
			model.addAttribute("mo",mo);
			
			tio.setMbNo(mbNo);
			int checkOrder = ts.checkOrder(tio);
			System.out.println("tio.getMbNo()" + tio.getMbNo());
			System.out.println("tio.getTnNo()" + tio.getTnNo());
			System.out.println("checkOrder" + checkOrder);
			
			model.addAttribute("checkOrder",checkOrder);
			}
		
		return "trainer/trainerInfoView";
	}
	
	@RequestMapping(value = "reviewWriteAction", method = RequestMethod.POST)
	public String reviewWriteAction(ReviewDTO rvo,
									FileDetailDTO fdo,
									@RequestParam("files") MultipartFile[] files,
									@RequestParam("tnNo") int tnNo,
									HttpSession session,
									HttpServletRequest request) throws IOException {
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		
		rvo.setMbNo(mbNo);
		rvo.setTnNo(tnNo);
		
		int value = ts.reviewInsert(rvo);
		System.out.println("value : " + value);
		
		fdo.setRvNo(rvo.getRvNo());
		System.out.println("fdo.getRvNo() : " + fdo.getRvNo());
		fdo.setTnNo(0);
		System.out.println("fdo.getTnNo() : " + fdo.getTnNo());
		
		int value2 = ts.fileInsert(fdo);
		System.out.println("value2 : " + value2);
		int flNo = fdo.getFlNo();
		System.out.println("flNo : " + flNo);
		
		// 다중 파일 업로드 처리
	    List<FileDetailDTO> fileDetailsList = new ArrayList<>();
	    for (MultipartFile file : files) {
	        if (!file.isEmpty()) {
	        	
	        	String originalFilename = file.getOriginalFilename();

	        	String uniqueIdentifier = Long.toString(System.currentTimeMillis());
	            String filename = uniqueIdentifier + "_" + originalFilename;
	            
	            System.out.println("filename : " + filename);
	            System.out.println("originalFilename : " + originalFilename);
	            
	            String path = request.getSession().getServletContext().getRealPath("/resources/download");
	            
	            File uploadPath = new File(path, filename);
	            file.transferTo(uploadPath);

	         // 각 파일에 대한 FileDetailDTO 객체 생성
	            FileDetailDTO fdo2 = new FileDetailDTO();
	            fdo2.setFdName(filename);
	            fdo2.setFdPName(originalFilename);
	            fdo2.setFlNo(flNo);
	            
	            fileDetailsList.add(fdo2);
	        }
	    }
		
		for (FileDetailDTO newFdo : fileDetailsList) {
	        int value3 = ts.fileDetailInsert(newFdo);
	        System.out.println("value3 : " + value3);
	    }
		
		int value4 = ts.reviewUpdate(fdo);
		System.out.println("value4 : " + value4);
		
		return "trainer/trainerInfoView";
	}

}
