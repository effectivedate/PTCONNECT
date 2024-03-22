package com.ptconnect.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.FileDetailDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.persistance.AdminServiceMapper;
import com.ptconnect.myapp.persistance.CenterServiceMapper;

@Service
public class CenterServiceImpl implements CenterService{

	private CenterServiceMapper csm;
	private AdminServiceMapper asm;
	
	@Autowired
	public CenterServiceImpl(SqlSession sqlSession) {
		this.csm = sqlSession.getMapper(CenterServiceMapper.class);
	}

	@Override
	public TrainerInfoDTO centerInfoView(int tnNo) {
		
		TrainerInfoDTO tio = csm.centerInfoView(tnNo);
		
		return tio;
	}
	
	@Override
	public ArrayList<FileDetailDTO> centerInfoView_photos(int flNo) {
		
		ArrayList<FileDetailDTO> fdo_alist = new ArrayList<FileDetailDTO>();
		fdo_alist = csm.centerInfoView_photos(flNo);
		
		return fdo_alist;
	}	
	
	@Override
	public int centerModify(CenterInfoDTO cio) {
	
		int value = csm.centerModify(cio);
		
		return value;
	}

	@Override
	public CenterInfoDTO centerSelectOne(int mbNo) {
		
		CenterInfoDTO cio = csm.centerSelectOne(mbNo);
		
		return cio;
	}

	@Override
	public CenterInfoDTO trainerCenterSelectOne(int ctNo) {
		CenterInfoDTO cio = csm.trainerCenterSelectOne(ctNo);
		
		return cio;
	}

	@Override
	public ArrayList<CenterInfoDTO> centerFind(String ctName) {
		ArrayList<CenterInfoDTO> cList = csm.centerFind(ctName);
		
		return cList;
	}
	
	@Override
	public ArrayList<TrainerInfoDTO> cTrainerRegisterList(SearchCriteria scri) {
		
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		ArrayList<TrainerInfoDTO> tList = csm.cTrainerRegisterList(scri);
		
		
		return tList;
		
	}
	
	@Override
	public int cTrainerRegisterTotalCount(int ctNo) {
		
		int value = csm.cTrainerRegisterTotalCount(ctNo);
		
		return value;
	}
	
	@Override
	public int cTrainerRegist(TrainerInfoDTO tio) {
		
		int value = csm.cTrainerRegist(tio.getTnNo());
		
		System.out.println("tio.getMbNo() : " + tio.getMbNo());
		System.out.println("tio.getTnNo() : " + tio.getTnNo());
		
		int value2 = csm.otherTrainerSelect(tio.getMbNo());
		
		System.out.println("value 2 : " + value2);
		
		if(csm.otherTrainerSelect(tio.getMbNo()) > 1) {
			value2 = csm.otherTrainerUnregist(tio);
		}else {
			value = value + 1;			
		}
		
		
		return value+value2;
		
	}
	
	@Override
	public ArrayList<TrainerInfoDTO> centerTrainerInfo(SearchCriteria scri) {
		
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		
		ArrayList<TrainerInfoDTO> centerTrainerList = csm.centerTrainerInfo(scri);
		
		return centerTrainerList;
	}
	
	@Override
	public int centerTrainerTotalCount(int ctNo) {
		
		int value = csm.centerTrainerTotalCount(ctNo);
		
		return value;
	}
	
}