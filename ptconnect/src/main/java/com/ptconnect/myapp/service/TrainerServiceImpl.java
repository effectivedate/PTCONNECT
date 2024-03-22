package com.ptconnect.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptconnect.myapp.domain.FileDetailDTO;
import com.ptconnect.myapp.domain.MemberDTO;
import com.ptconnect.myapp.domain.PriceInfo;
import com.ptconnect.myapp.domain.ProgramDTO;
import com.ptconnect.myapp.domain.QualifyInfo;
import com.ptconnect.myapp.domain.ReviewDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.persistance.TrainerServiceMapper;

@Service
public class TrainerServiceImpl implements TrainerService {

	private TrainerServiceMapper tsm;

	@Autowired
	public TrainerServiceImpl(SqlSession sqlSession) {
		this.tsm = sqlSession.getMapper(TrainerServiceMapper.class);
	}

	@Override
	public ArrayList<TrainerInfoDTO> findTrainer(SearchCriteria scri) {

		int value = (scri.getPage() - 1) * 15;
		scri.setPage(value);

//		System.out.println("TrainerServiceImpl");
//		System.out.println("scri.getMbNo() : " + scri.getMbNo());
//		System.out.println("scri.getMbMapY() : " + scri.getMbMapY());
//		System.out.println("scri.getMbMapX() : " + scri.getMbMapX());
//		System.out.println("scri.getPage() : " + scri.getPage());
//		System.out.println("scri.getKeyword() : " + scri.getKeyword());
//		System.out.println("scri.getDistance() : " + scri.getDistance());
//		System.out.println("scri.getOrderBy() : " + scri.getOrderBy());

		ArrayList<TrainerInfoDTO> alist = tsm.findTrainer(scri);

		return alist;
	}

	@Override
	public String loginUserAddr(int mbNo) {

		String uAddr = "";
		uAddr = tsm.loginUserAddr(mbNo);
		return uAddr;
	}

	@Override
	public int trainerTotalCount(SearchCriteria scri) {

		int value = 0;
		value = tsm.trainerTotalCount(scri);

		return value;
	}

	@Override
	public TrainerInfoDTO TrainerInfoView(int tnNo) {

		TrainerInfoDTO tio = new TrainerInfoDTO();

		tio = tsm.TrainerInfoView(tnNo);

		return tio;
	}

	@Override
	public ArrayList<FileDetailDTO> TrainerInfoView_photos(int tlno) {

		ArrayList<FileDetailDTO> fdo_alist = new ArrayList<FileDetailDTO>();

		fdo_alist = tsm.TrainerInfoView_photos(tlno);

		return fdo_alist;
	}

	@Override
	public ArrayList<TrainerInfoDTO> trainerInfoView_Programs(int tnNo) {

		ArrayList<TrainerInfoDTO> tio_alist = new ArrayList<TrainerInfoDTO>();
		tio_alist = tsm.trainerInfoView_Programs(tnNo);

		return tio_alist;
	}

	@Override
	public ArrayList<ReviewDTO> TrainerInfoView_reviews(int tnNo) {

		ArrayList<ReviewDTO> rvo_alist = new ArrayList<ReviewDTO>();

		rvo_alist = tsm.TrainerInfoView_reviews(tnNo);

		return rvo_alist;
	}

	@Override
	public ArrayList<FileDetailDTO> TrainerInfoView_reviews_files(int flNo) {

		ArrayList<FileDetailDTO> fdo_alist = new ArrayList<FileDetailDTO>();

		fdo_alist = tsm.TrainerInfoView_reviews_files(flNo);

		return fdo_alist;
	}

	@Override
	public int trainerInsert(TrainerInfoDTO tio) {
		int value = 0;
		int value1 = tsm.trainerInsert(tio);

		if (value1 > 0) {

			int value2 = tsm.qualifyInsert(tio);

			if (value2 > 0) {

				int value3 = tsm.lessonPriceInsert(tio);

				if (value3 > 0) {

					int value4 = tsm.programInsert(tio);

					value = value1 + value2 + value3 + value4;
				}
			}
		}

		return value;
	}

	@Override
	public int fileInsert(FileDetailDTO fdo) {

		int value = tsm.fileInsert(fdo);

		return value;
	}

	@Override
	public int fileDetailInsert(FileDetailDTO fdo) {

		int value = tsm.fileDetailInsert(fdo);

		return value;
	}

	@Override
	public int trainerInfoUpdate(TrainerInfoDTO tio) {

		int value = tsm.trainerInfoUpdate(tio);

		return value;
	}

	@Override
	public int trainerModify(TrainerInfoDTO tio) {

		int value = 0;
		int value1 = tsm.trainerModify(tio);

		if (value1 > 0) {

			int value2 = tsm.qualifyModify(tio);

			if (value2 > 0) {

				int value3 = tsm.lessonPriceModify(tio);

				if (value3 > 0) {

					int value4 = tsm.programModify(tio);

					value = value1 + value2 + value3 + value4;
				}

			}
		}

		return value;
	}

	@Override
	public int file_Modify(FileDetailDTO fdo) {

		int value = tsm.file_Modify(fdo);

		return value;
	}

	@Override
	public int fileDetailModify(FileDetailDTO fdo) {

		int value = tsm.fileDetailModify(fdo);

		return value;
	}

	@Override
	public MemberDTO memberSelectOne(int mbNo) {

		MemberDTO mo = new MemberDTO();

		mo = tsm.memberSelectOne(mbNo);

		return mo;
	}

	@Override
	public TrainerInfoDTO trainerSelectOne(int mbNo) {

		TrainerInfoDTO tio = new TrainerInfoDTO();

		tio = tsm.trainerSelectOne(mbNo);

		return tio;
	}

	@Override
	public QualifyInfo qualifySelectOne(int tnNo) {

		QualifyInfo qo = new QualifyInfo();

		qo = tsm.qualifySelectOne(tnNo);

		return qo;
	}

	@Override
	public PriceInfo lessonPriceSelectOne(int tnNo) {

		PriceInfo pro = new PriceInfo();

		pro = tsm.lessonPriceSelectOne(tnNo);

		return pro;
	}

	@Override
	public ProgramDTO programSelectOne(int tnNo) {

		ProgramDTO pgo = new ProgramDTO();

		pgo = tsm.programSelectOne(tnNo);

		return pgo;
	}

	@Override
	public ArrayList<TrainerInfoDTO> trainerSelectAll() {

		ArrayList<TrainerInfoDTO> tio = new ArrayList<TrainerInfoDTO>();

		tio = tsm.trainerSelectAll();

		return tio;
	}

	@Override
	public FileDetailDTO center_photo_one(int flNo) {

		FileDetailDTO fDTO = tsm.center_photo_one(flNo);

		return fDTO;
	}

	@Override
	public ArrayList<FileDetailDTO> TrainerInfoView_photo_two(int flNo) {

		ArrayList<FileDetailDTO> tio_alist = new ArrayList<FileDetailDTO>();
		tio_alist = tsm.TrainerInfoView_photo_two(flNo);

		return tio_alist;
	}

	@Override
	public int countMember() {
		int countMember = tsm.countMember();

		return countMember;
	}

	@Override
	public int countTrainer() {
		int countTrainer = tsm.countTrainer();

		return countTrainer;
	}
	
	@Override
	public int countOrder() {
		int countOrder = tsm.countOrder();
		
		return countOrder;
	}
	
	@Override
	public int trainerCenterConnect(int centerNo, int trainerNo) {
		String ctNo = centerNo+"";
		String tnNo = trainerNo+"";
		Map<String,String> hm = new HashMap<String,String>();
		hm.put("ctNo", ctNo);
		hm.put("tnNo", tnNo);
		
		int value = tsm.trainerCenterConnect(hm);
		
		return value;
	}
	
	@Override
	public int reviewInsert(ReviewDTO rvo) {
		int value = tsm.reviewInsert(rvo);
		
		return value;
	}
	
	@Override
	public int reviewUpdate(FileDetailDTO fdo) {
		int value = tsm.reviewUpdate(fdo);
		
		return value;
	}
	
	@Override
	public int checkOrder (TrainerInfoDTO tio) {
		int value = tsm.checkOrder(tio);
		
		return value;
	}

}