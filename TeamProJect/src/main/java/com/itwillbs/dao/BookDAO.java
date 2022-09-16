package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ReservationDTO;
@Repository
public class BookDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.BusinessMapper";
	
	
	public List<ReservationDTO> listReservation(ReservationDTO reservationDTO) {
		return sqlSession.selectList(namespace+".listReservation",reservationDTO);
	}
	
	public List<ReservationDTO> getListCheckReservation(String string) {
		return sqlSession.selectList(namespace+".getListCheckReservation",string);
	}

	public ReservationDTO getMember(String user_id) {
		return sqlSession.selectOne(namespace+".getMember", user_id);
	}

	public List<ReservationDTO> reservationAtMonth(String pen_id) {
		return sqlSession.selectList(namespace+".reservationAtMonth", pen_id);
		
	}


	public ReservationDTO listReservation2(ReservationDTO reservationDTO) {
		return sqlSession.selectOne(namespace+".listReservation2",reservationDTO);
	}

	public int cancelReservation(String res_num) {
		return sqlSession.selectOne(namespace+".cancelReservation",res_num);
	}

//	public void cancelReservation(String res_number) {
//		 sqlSession.delete(namespace+".cancelReservation",res_number);
//	}


	









//	public List<BookDTO> listReservation(MemberDTO memberDTO, MemberDTO memberDTO2, PensionDTO pensionDTO,
//			PensionRmDTO pensionRmDTO,BookDTO bookDTO) {
//		return sqlSession.selectList(namespace+".listReservation",memberDTO ,memberDTO2,pensionDTO,pensionRmDTO,bookDTO);
//	}
	
	
	

//
//	public List<BookDTO> listReservation(String num) {
//		return sqlSession.selectList(namespace+".listReservation",num);
//	}




}
