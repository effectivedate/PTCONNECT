package com.ptconnect.myapp.service;

import java.util.ArrayList;
import java.util.Map;

import com.ptconnect.myapp.domain.FileDetailDTO;
import com.ptconnect.myapp.domain.MemberDTO;
import com.ptconnect.myapp.domain.PriceInfo;
import com.ptconnect.myapp.domain.ProgramDTO;
import com.ptconnect.myapp.domain.QualifyInfo;
import com.ptconnect.myapp.domain.ReviewDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;

public interface TrainerService {
	
	public ArrayList<TrainerInfoDTO> findTrainer(SearchCriteria scri);	//트레이너 찾기 페이지 트레이너 리스트
	
	public ArrayList<FileDetailDTO> TrainerInfoView_photo_two(int tlno);
	
	public FileDetailDTO center_photo_one(int flNo);
	
	public String loginUserAddr(int mbNo);	//로그인 한 유저의 주소
	
	public int trainerTotalCount(SearchCriteria scri);	//검색된 트레이너 사람 수
	
	public TrainerInfoDTO TrainerInfoView(int tnNo);	//트레이너 리스트에서 선택한 트레이너의 정보
	
	public ArrayList<FileDetailDTO> TrainerInfoView_photos(int tlno); //선택한 트레이너의 사진들 가져옴
	
	public ArrayList<TrainerInfoDTO> trainerInfoView_Programs(int tnNo);
	
	public ArrayList<ReviewDTO> TrainerInfoView_reviews(int tnNo); //선택한 트레이너의 리뷰들 정보
	
	public ArrayList<FileDetailDTO> TrainerInfoView_reviews_files(int flNo); //선택한 트레이너의 리뷰들 각각에 첨부된 파일들 정보
	
	public int trainerInsert(TrainerInfoDTO tio);
	
	public int fileInsert(FileDetailDTO fdo);
	
	public int fileDetailInsert(FileDetailDTO fdo);
	
	public int trainerInfoUpdate(TrainerInfoDTO tio);
	
	public int trainerModify(TrainerInfoDTO tio);
	
	public int file_Modify(FileDetailDTO fdo);
	
	public int fileDetailModify(FileDetailDTO fdo);
	
	public MemberDTO memberSelectOne(int mbNo);

	public TrainerInfoDTO trainerSelectOne(int mbNo);
	
	public QualifyInfo qualifySelectOne(int tnNo);
	
	public PriceInfo lessonPriceSelectOne(int tnNo);
	
	public ProgramDTO programSelectOne(int tnNo);
	
	public ArrayList<TrainerInfoDTO> trainerSelectAll();
	
	public int countMember();
	
	public int countTrainer();
	
	public int countOrder();
	
	public int trainerCenterConnect(int centerNo, int trainerNo);
	
	public int reviewInsert(ReviewDTO rvo);
	
	public int reviewUpdate(FileDetailDTO fdo);
	
	public int checkOrder (TrainerInfoDTO tio);
	
}
