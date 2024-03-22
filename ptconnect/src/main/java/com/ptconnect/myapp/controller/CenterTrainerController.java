package com.ptconnect.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.PageMaker;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.service.AdminService;
import com.ptconnect.myapp.service.CenterService;
import com.ptconnect.myapp.service.TrainerService;



@Controller
public class CenterTrainerController {
	@Autowired
	CenterService cs;
	@Autowired
	TrainerService ts;
	@Autowired
	AdminService as;
	
	@RequestMapping(value = "/centerTrainer{page}")
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
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		CenterInfoDTO cio = cs.centerSelectOne(mbNo);
		scri.setCtNo(cio.getCtNo());
		pm.setTotalCount(cs.cTrainerRegisterTotalCount(cio.getCtNo()));
		
		ArrayList<TrainerInfoDTO> tList = cs.cTrainerRegisterList(scri);

		session.setAttribute("tList", tList);
		session.setAttribute("pm", pm);
		
		return "centerMypage/centerTrainer";
	}
	
	@RequestMapping(value = "/centerTrainer/{tnNo}/{mbNo}/{page}")
	public String centerTrainer(@PathVariable int tnNo,
			@PathVariable int mbNo,
			@PathVariable int page,
			HttpSession session,
			RedirectAttributes rttr) {
		
		System.out.println("mbNo : " + mbNo);
		
		TrainerInfoDTO tio = new TrainerInfoDTO();
		tio.setTnNo(tnNo);
		tio.setMbNo(mbNo);
		int value = cs.cTrainerRegist(tio);
		String msg = "";
		if(value>=2) {
			msg = tnNo + "번 트레이너 승인 완료.";
		}else {
			msg = tnNo + "번 트레이너 승인 실패";
		}
		
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/centerTrainer"+page;
	}
	
	@ResponseBody
	@RequestMapping(value="centerFind.ajax", method = RequestMethod.GET)
	public JSONArray centerFind(
			@RequestParam String ctName,
			HttpSession session) {
		JSONObject jo = new JSONObject();
		JSONArray ja = new JSONArray();
		if(ctName.equals("")) {
			jo.put("value", "none");
			ja.add(jo);
			return ja;
		}
		ArrayList<CenterInfoDTO>cList = cs.centerFind(ctName);
		jo.put("value", cList.size());
		ja.add(jo);
		
		for(CenterInfoDTO ci:cList) {
			JSONObject centerInfoJo = new JSONObject();
			centerInfoJo.put("ctNo", ci.getCtNo());
			centerInfoJo.put("ctName", ci.getCtName());
			centerInfoJo.put("ctAddr", ci.getMbAddr());
			ja.add(centerInfoJo);
		}
		return ja;
	}
	
	@ResponseBody
	@RequestMapping(value="centerTrainerConnect.ajax", method = RequestMethod.POST)
	public JSONObject centerTrainerConnect(
			@RequestParam String ctNo,
			HttpSession session) {
		JSONObject jo = new JSONObject();
		if(ctNo.equals("")) {
			jo.put("value", 0);
			return jo;
		}else {
			if(session.getAttribute("tnNo")==null) {
				jo.put("value", 2);
				return jo;
			}
			System.out.println("ctNo : " + ctNo);
			System.out.println("tnNo : " + session.getAttribute("tnNo"));
			int centerNo = Integer.parseInt(ctNo);
			int trainerNo = (int)session.getAttribute("tnNo");
			int value = ts.trainerCenterConnect(centerNo, trainerNo);
			System.out.println("value : " + value);
			
			jo.put("value", value);
			
			return jo;
		}
	}
}
