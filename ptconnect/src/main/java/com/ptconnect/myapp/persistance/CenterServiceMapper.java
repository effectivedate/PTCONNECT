package com.ptconnect.myapp.persistance;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.FileDetailDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;

public interface CenterServiceMapper {
	
	public TrainerInfoDTO centerInfoView(int tnNo);
	
	public ArrayList<FileDetailDTO> centerInfoView_photos(int flNo);
	
	public int centerModify(CenterInfoDTO cio);

	public CenterInfoDTO centerSelectOne(int mbNo);
	
	public CenterInfoDTO trainerCenterSelectOne(int ctNo);

	public ArrayList<CenterInfoDTO> centerFind(@Param("ctName")String ctName);
	
	public ArrayList<TrainerInfoDTO> cTrainerRegisterList(SearchCriteria scri);
	
	public int cTrainerRegisterTotalCount(int ctNo);
	
	public int cTrainerRegist(@Param("tnNo")int tnNo);
	
	public int otherTrainerSelect(@Param("mbNo")int mbNo);
	public int otherTrainerUnregist(TrainerInfoDTO tio);
	
	public ArrayList<TrainerInfoDTO> centerTrainerInfo(SearchCriteria scri);
	
	public int centerTrainerTotalCount(int ctNo);
	
}
