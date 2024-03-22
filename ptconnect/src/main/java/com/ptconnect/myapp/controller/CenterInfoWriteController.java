package com.ptconnect.myapp.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.FileDetailDTO;
import com.ptconnect.myapp.service.CenterService;
import com.ptconnect.myapp.service.TrainerService;

@Controller
public class CenterInfoWriteController {
	
	@Autowired
	private TrainerService ts;	
	@Autowired
	private CenterService cs;
	
	@RequestMapping(value = "centerInfoWrite", method = RequestMethod.GET)
	public String centerInfoWrite(Model model,
								HttpSession session,
								HttpServletResponse response) throws Exception {
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		
		System.out.println("mbNo : " + mbNo);
		
		CenterInfoDTO cio = new CenterInfoDTO();
		cio.setMbNo(mbNo);
		
		cio = cs.centerSelectOne(mbNo);
		
		System.out.println("cio.getCtDelYN() : " + cio.getCtDelYN());
		
		if(cio.getCtNo() != 0) {
			int ctNo = cio.getCtNo();
			int flNo = cio.getFlNo();
			System.out.println("ctNo : " + ctNo);
			System.out.println("flNo : " + flNo);
			
			session.setAttribute("flNo", flNo);
			session.setAttribute("ctNo", ctNo);
			session.setAttribute("mbNo", mbNo);
		}
		
		if(cio.getCtInfo() != null) {
			String[] ctInfoArr = null;
			if(cio.getCtInfo().contains(",")) {
				ctInfoArr = cio.getCtInfo().split(",");
			}else {
				ctInfoArr = new String[1];
				ctInfoArr[0] = cio.getCtInfo();
			}
			model.addAttribute("ctInfoArr", ctInfoArr);
		}
		
		if(cio.getCtPrice() != null) {
			String[] ctPriceArr = null;
			if(cio.getCtPrice().contains(",")) {
				ctPriceArr = cio.getCtPrice().split(",");
			}else {
				ctPriceArr = new String[1];
				ctPriceArr[0] = cio.getCtPrice();
			}
			
			model.addAttribute("ctPriceArr", ctPriceArr);
		}
		
		if(cio.getCtOperate() != null) {
			String[] ctOperateArr = null;
			if(cio.getCtOperate().contains(",")) {
				ctOperateArr = cio.getCtOperate().split(",");
			}else {
				ctOperateArr = new String[1];
				ctOperateArr[0] = cio.getCtOperate();
			}
			
			model.addAttribute("ctOperateArr", ctOperateArr);
		}
		
		model.addAttribute("cio", cio);
		
		return "centerMypage/centerInfoWrite";
	}
	
	@RequestMapping(value = "centerInfoWriteAction", method = RequestMethod.POST)
	public String centerInfoWriteAction(CenterInfoDTO cio,
										FileDetailDTO fdo,
										@RequestParam("files") MultipartFile[] files,
										HttpSession session,
										HttpServletRequest request) throws Exception {
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		
		System.out.println("mbNo : " + mbNo);
		cio.setMbNo(mbNo);
		
		int ctNo = Integer.parseInt(session.getAttribute("ctNo").toString());
		int centerFlNo = Integer.parseInt(session.getAttribute("flNo").toString());
		
		cio.setCtNo(ctNo);
		cio.setFlNo(centerFlNo);
		fdo.setCtNo(cio.getCtNo());
		
		System.out.println("ctNo : " + fdo.getCtNo());
		System.out.println("tnNo : " + fdo.getTnNo());
		System.out.println("rvNo : " + fdo.getRvNo());
		System.out.println("bdNo : " + fdo.getBdNo());
		System.out.println("centerFlNo : " + cio.getFlNo());
		
		if(cio.getFlNo() == 0) {
			int value1 = ts.fileInsert(fdo);
			System.out.println("fileInsert : " + value1);
		}else {
			int value = ts.file_Modify(fdo);
			System.out.println("file_Moidfy : " + value);
		}
		
		int flNo = fdo.getFlNo();
		System.out.println("flNo : " + flNo);
		cio.setFlNo(flNo);
		
		int value2 = cs.centerModify(cio);
		System.out.println("value2 : " + value2);
		
		
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
	    
	    int value3 = ts.fileDetailModify(fdo);
	    System.out.println("value3 : " + value3);
	    
	    for (FileDetailDTO newFdo : fileDetailsList) {
	        int value4 = ts.fileDetailInsert(newFdo);
	        System.out.println("value4 : " + value4);
	    }
		
		return "redirect:/centerInfo";
	}

}
