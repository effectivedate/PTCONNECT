package com.ptconnect.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ptconnect.myapp.domain.BoardDTO;
import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.PageMaker;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.service.AdminService;


@Controller
@RequestMapping(value = "/admin")
public class AdminController {

@Autowired
AdminService as;

	@GetMapping(value = "/admin_login")
	public String admin_login(
			HttpSession session) {
		
		return "admin/admin_login";
	}
	

	@GetMapping(value = "/admin_index")
	public String admin_index(
			HttpSession session) {
		session.removeAttribute("menu_location");
		
		return "admin/admin_index";
	}

	@GetMapping(value = "/trainerRegisterList")
	public String trainerRegisterListNoPage(
			HttpSession session) {
		
		return "redirect:/admin/trainerRegisterList/1";
	}		
	@GetMapping(value = "/trainerRegister/{tnNo}/{mbNo}/{page}")
	public String trainerRegister(
			@PathVariable int tnNo,
			@PathVariable int mbNo,
			@PathVariable int page,
			HttpSession session,
			RedirectAttributes rttr) {
		TrainerInfoDTO tio = new TrainerInfoDTO();
		tio.setTnNo(tnNo);
		tio.setMbNo(mbNo);
		int value = as.trainerRegist(tio);
		String msg = "";
		if(value>=2) {
			msg = tnNo + "번 트레이너 승인 완료.";
		}else {
			msg = tnNo + "번 트레이너 승인 실패";
		}
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/admin/trainerRegisterList/"+page;
	}
	@GetMapping(value = "/trainerRegisterList/{page}")
	public String trainerRegisterList(
			@PathVariable int page,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","0,1");
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(10);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		pm.setTotalCount(as.trainerRegisterTotalCount());
		ArrayList<TrainerInfoDTO> tList = as.trainerRegisterList(scri);

		session.setAttribute("tList", tList);
		session.setAttribute("pm", pm);
		
		return "admin/trainerRegisterList";
	}	

	@GetMapping(value = "/centerRegisterList")
	public String centerRegisterListNoPage(
			HttpSession session) {
		
		return "redirect:/admin/centerRegisterList/1";
	}	
	@GetMapping(value = "/centerRegister/{ctNo}/{page}")
	public String centerRegister(
			@PathVariable int ctNo,
			@PathVariable int page,
			HttpSession session,
			RedirectAttributes rttr) {
		int value = as.centerRegist(ctNo);
		String msg = "";
		if(value>0) {
			msg = ctNo + "번 센터 승인 완료.";
		}else {
			msg = ctNo + "번 센터 승인 실패";
		}
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/admin/centerRegisterList/"+page;
	}

	
	@GetMapping(value = "/centerRegisterList/{page}")
	public String centerRegisterList(
			@PathVariable int page,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","0,2");
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(10);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		pm.setTotalCount(as.centerRegisterTotalCount());
		ArrayList<CenterInfoDTO> cList = as.centerRegisterList(scri);
		
		session.setAttribute("cList", cList);
		session.setAttribute("pm", pm);
		return "admin/centerRegisterList";
	}	
	
	@GetMapping(value = "/reportList")
	public String reportList(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","1,0");
		
		return "admin/reportList";
	}	

	@GetMapping(value = "/registeredProductList")
	public String registeredProductList(
			HttpSession session) {
		
		return "redirect:/admin/registeredProductList/1";
	}
	
	@GetMapping(value = "/registeredProductList/{page}")
	public String registeredProductList(
			@PathVariable int page,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","2,1");
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(10);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		pm.setTotalCount(as.registredProductTotalCount());
		ArrayList<TrainerInfoDTO> tList = as.registredProductList(scri);

		session.setAttribute("tList", tList);
		session.setAttribute("pm", pm);
		return "admin/registeredProductList";
	}	

	@GetMapping(value = "/tradedProductList")
	public String tradedProductListNoPage(
			HttpSession session) {
		
		return "redirect:/admin/tradedProductList/1";
	}	
	@GetMapping(value = "/tradedProductList/{page}")
	public String tradedProductList(
			@PathVariable int page,
			HttpSession session) {
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(10);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		pm.setTotalCount(as.tradedProductTotalCount());
		ArrayList<PaymentDTO> oList = as.tradedProductList(scri);
		
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","2,2");
		session.setAttribute("oList", oList);
		session.setAttribute("pm", pm);
		return "admin/tradedProductList";
	}	

	@GetMapping(value = "/tradedProductViewDetail")
	public String tradedProductViewDetailNoNumber(
			HttpSession session) {
		
		return "redirect:/admin/tradedProductList/1";
	}	
	@GetMapping(value = "/tradedProductViewDetail/{odNo}")
	public String tradedProductViewDetail(
			@PathVariable String odNo,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","2,2");
		PaymentDTO po = as.tradedProductDetail(odNo);
		if(po != null) {
			session.setAttribute("po", po);
		}else {
			return "redirect:/admin/tradedProductList/1";
		}
		return "admin/tradedProductViewDetail";
	}	
	
	@GetMapping(value = "/managerChatList")
	public String managerChatList(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","3,1");
		
		return "admin/managerChatList";
	}	
	
	@GetMapping(value = "/customerChatList")
	public String customerChatList(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","3,2");
		
		return "admin/customerChatList";
	}	
	
	@GetMapping(value = "/userManagement")
	public String userManagement(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","4,0");
		
		return "admin/userManagement";
	}	
	
	@GetMapping(value = "/admin_review")
	public String admin_review(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","5,0");
		
		return "admin/admin_review";
	}	
	
	@GetMapping(value = "/admin_point")
	public String admin_point(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","6,1");
		
		return "admin/admin_point";
	}	
	
	@GetMapping(value = "/admin_point_detail")
	public String admin_point_detail(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","6,2");
		
		return "admin/admin_point_detail";
	}	
	
	@GetMapping(value = "/admin_coupon_list")
	public String admin_coupon_list(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","7,1");
		
		return "admin/admin_coupon_list";
	}	

	@GetMapping(value = "/admin_coupon")
	public String admin_coupon(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","7,2");
		
		
		return "admin/admin_coupon_modify";
	}	
	@GetMapping(value = "/admin_coupon_modify")
	public String admin_coupon_modify(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","7,2");
		
		
		return "admin/admin_coupon_modify";
	}	
	
	@GetMapping(value = "/admin_notice{page}")
	public String admin_notice(@PathVariable int page,
								HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","8,1");
		
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(10);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		pm.setTotalCount(as.noticeTotalCount());
		ArrayList<BoardDTO> ntList = as.noticeSelectAll(scri);
		System.out.println("ntList : " + ntList);
		
		session.setAttribute("ntList", ntList);
		session.setAttribute("pm", pm);
		
		return "admin/admin_notice";
	}	
	
	@GetMapping(value = "/admin_notice_detail")
	public String admin_notice_detail(
			@RequestParam(name = "bdNo", required = true) int bdNo,
			BoardDTO bdo,
			Model model,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","8,1");
		
		bdo = as.boardSelectOne(bdNo);
		
		System.out.println("bdo.getNtTitle() : " + bdo.getNtTitle());
		
		model.addAttribute("bdo", bdo);
		
		return "admin/admin_notice_detail";
	}
	
	@GetMapping(value = "/admin_notice_write")
	public String admin_notice_write(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","8,1");
		return "admin/admin_notice_write";
	}
	
	@RequestMapping(value = "/admin_notice_write_action", method = RequestMethod.POST)
	public String admin_notice_write_action(
			BoardDTO bdo,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","8,1");
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		System.out.println("mbNo : " + mbNo);
		
		bdo.setMbNo(mbNo);
		
		int value = as.boardWrite(bdo);
		System.out.println("value : " + value);
		
		int value2 = as.noticeWrite(bdo);
		System.out.println("value2 : " + value2);
		
		return "redirect:/admin/admin_notice1";
	}
	
	@GetMapping(value = "/admin_notice_modify")
	public String admin_notice_modify(
			@RequestParam(name = "bdNo", required = true) int bdNo,
			BoardDTO bdo,
			Model model,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","8,1");
		
		bdo = as.boardSelectOne(bdNo);
		
		System.out.println("bdo.getNtTitle() : " + bdo.getNtTitle());
		
		model.addAttribute("bdo", bdo);
		
		return "admin/admin_notice_modify";
	}
	
	@RequestMapping(value = "/admin_notice_modify_action", method = RequestMethod.POST)
	public String admin_notice_modify_action(
			BoardDTO bdo,
			HttpSession session) {
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		System.out.println("mbNo : " + mbNo);
		
		bdo.setMbNo(mbNo);
		System.out.println("bdo.getBdNo() : " + bdo.getBdNo());
		
		int value = as.boardModify(bdo);
		System.out.println("value : " + value);
		
		int value2 = as.noticeModify(bdo);
		System.out.println("value2 : " + value2);
		
		return "redirect:/admin/admin_notice1";
	}
	
	@RequestMapping(value = "/admin_notice_delete_action")
	public String admin_notice_delete_action(
			BoardDTO bdo,
			@RequestParam(name = "bdNo", required = true) int bdNo,
			HttpSession session) {
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		System.out.println("mbNo : " + mbNo);
		
		bdo.setMbNo(mbNo);
		
		int value = as.boardDelete(bdo);
		System.out.println("value : " + value);
		
		return "redirect:/admin/admin_notice1";
	}
	
	@GetMapping(value = "/admin_FAQ{page}")
	public String admin_FAQ(
			@PathVariable int page,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","8,2");
		
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(5);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		pm.setTotalCount(as.FAQTotalCount());
		ArrayList<BoardDTO> fList = as.FAQSelectAll(scri);
		System.out.println("fList : " + fList);
		
		session.setAttribute("fList", fList);
		session.setAttribute("pm", pm);
		
		return "admin/admin_FAQ";
	}
	
	@GetMapping(value = "/admin_FAQ_write")
	public String admin_FAQ_write(
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","8,2");
		
		return "admin/admin_FAQ_write";
	}
	
	@RequestMapping(value = "/admin_FAQ_write_action", method = RequestMethod.POST)
	public String admin_FAQ_write(
			BoardDTO bdo,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","8,1");
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		System.out.println("mbNo : " + mbNo);
		
		bdo.setMbNo(mbNo);
		
		int value = as.boardWrite(bdo);
		System.out.println("value : " + value);
		
		int value2 = as.FAQWrite(bdo);
		System.out.println("value2 : " + value2);
		
		return "redirect:/admin/admin_FAQ1";
	}
	
	@GetMapping(value = "/admin_FAQ_modify")
	public String admin_FAQ_modify(
			@RequestParam(name = "bdNo", required = true) int bdNo,
			BoardDTO bdo,
			Model model,
			HttpSession session) {
		session.removeAttribute("menu_location");
		session.setAttribute("menu_location","8,2");
		
		bdo = as.boardSelectOne(bdNo);
		
		System.out.println("bdo.getNtTitle() : " + bdo.getNtTitle());
		
		model.addAttribute("bdo", bdo);
		
		return "admin/admin_FAQ_modify";
	}
	
	@RequestMapping(value = "/admin_FAQ_modify_action", method = RequestMethod.POST)
	public String admin_FAQ_modify_action(
			BoardDTO bdo,
			HttpSession session) {
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		System.out.println("mbNo : " + mbNo);
		
		bdo.setMbNo(mbNo);
		System.out.println("bdo.getBdNo() : " + bdo.getBdNo());
		
		int value = as.boardModify(bdo);
		System.out.println("value : " + value);
		
		int value2 = as.FAQModify(bdo);
		System.out.println("value2 : " + value2);
		
		return "redirect:/admin/admin_FAQ1";
	}	
	
	@RequestMapping(value = "/admin_FAQ_delete_action")
	public String admin_FAQ_delete_action(
			BoardDTO bdo,
			@RequestParam(name = "bdNo", required = true) int bdNo,
			HttpSession session) {
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		System.out.println("mbNo : " + mbNo);
		
		bdo.setMbNo(mbNo);
		
		int value = as.boardDelete(bdo);
		System.out.println("value : " + value);
		
		return "redirect:/admin/admin_FAQ1";
	}

}
