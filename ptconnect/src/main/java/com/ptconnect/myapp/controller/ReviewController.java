package com.ptconnect.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptconnect.myapp.domain.FileDetailDTO;
import com.ptconnect.myapp.domain.MemberDTO;
import com.ptconnect.myapp.domain.PageMaker;
import com.ptconnect.myapp.domain.ReviewDTO;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.service.CenterService;
import com.ptconnect.myapp.service.PaymentService;
import com.ptconnect.myapp.service.TrainerService;

@Controller
public class ReviewController {
	
	@Autowired
	TrainerService ts;
	
	@Autowired
	CenterService cs;
	
	@Autowired
	PaymentService ps;
	
	@Autowired(required = false)
	PageMaker pm;
	
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public String trainerInfoReviews(@RequestParam(name = "tnNo", required = true) int idx,
									HttpServletRequest request,
									Model model) {
		
		HttpSession session = request.getSession();
		
		//트레이너 번호 받아서 해당 트레이너 정보 가져옴
		TrainerInfoDTO tio = ts.TrainerInfoView(idx);
		Integer mbNo = (Integer) session.getAttribute("mbNo");
		System.out.println("mbNo : " + mbNo);
		
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
		
		//해당 트레이너에 대한 리뷰(후기)들 가져옴
		ArrayList<ReviewDTO> rvo_alist = ts.TrainerInfoView_reviews(idx);
		
		//각각의 리뷰들에 대해 리뷰의 flNo 가져가서 리뷰가 첨부한 사진들 가져옴
		for(int i = 0; i < rvo_alist.size(); i++) {
			ArrayList<FileDetailDTO> fdo_alist = new ArrayList<FileDetailDTO>();
			fdo_alist = ts.TrainerInfoView_reviews_files(rvo_alist.get(i).getFlNo());
			rvo_alist.get(i).setRvFilename(fdo_alist);
			
			System.out.println("rvo_alist.get(i).getRvRate() : " + rvo_alist.get(i).getRvRate());
		}
		
		model.addAttribute("tio", tio);
		model.addAttribute("rvo_alist", rvo_alist);
		model.addAttribute("tio_photo_alist", tio_photo_alist);
		model.addAttribute("centerPhotos", centerPhotos);
		
		if(mbNo != null) {
			int sumPoint = ps.sumPoint(mbNo);
			System.out.println("sumPoint : " + sumPoint);
			
		model.addAttribute("sumPoint", sumPoint);
		}else {
			model.addAttribute("sumPoint", 0);
		}
		
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
		
		return "trainer/review";
	}

}
