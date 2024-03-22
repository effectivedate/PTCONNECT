package com.ptconnect.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.FileDetailDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;

public interface CenterService {
	
	public TrainerInfoDTO centerInfoView(int tnNo);
	
	public ArrayList<FileDetailDTO> centerInfoView_photos(int flNo); //센터 사진
	
	public int centerModify(CenterInfoDTO cio);
	
	public CenterInfoDTO centerSelectOne(int mbNo);

	public CenterInfoDTO trainerCenterSelectOne(int ctNo);
	
	public ArrayList<CenterInfoDTO> centerFind(String ctName);
	
	public ArrayList<TrainerInfoDTO> cTrainerRegisterList(SearchCriteria scri);	
	
	public int cTrainerRegisterTotalCount(int ctNo);
	
	public int cTrainerRegist(TrainerInfoDTO tio);
	
	public ArrayList<TrainerInfoDTO> centerTrainerInfo(SearchCriteria scri);
	
	public int centerTrainerTotalCount(int ctNo);
}
