package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BookDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PensionDTO;
import com.itwillbs.domain.PensionRmDTO;
@Repository
public class BookDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.BookMapper";
	
	
	public List<BookDTO> listReservation(BookDTO bookDTO) {
		return sqlSession.selectList(namespace+".listReservation",bookDTO);
	}


//	public List<BookDTO> listReservation(MemberDTO memberDTO, MemberDTO memberDTO2, PensionDTO pensionDTO,
//			PensionRmDTO pensionRmDTO,BookDTO bookDTO) {
//		return sqlSession.selectList(namespace+".listReservation",memberDTO ,memberDTO2,pensionDTO,pensionRmDTO,bookDTO);
//	}
	
	
	

//
//	public List<BookDTO> listReservation(String num) {
//		return sqlSession.selectList(namespace+".listReservation",num);
//	}




}
