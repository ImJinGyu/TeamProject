package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BookDAO;
import com.itwillbs.dao.BusinessDAO;
import com.itwillbs.domain.BookDTO;
import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PensionDTO;
import com.itwillbs.domain.PensionRmDTO;
@Service
public class BookService {
	
	
	@Inject
	private BookDAO bookDAO;
	
	public List<BookDTO> listReservation(BookDTO bookDTO) {
		return bookDAO.listReservation(bookDTO);
	}

//	public List<BookDTO> listReservation(MemberDTO memberDTO, MemberDTO memberDTO2, PensionDTO pensionDTO,
//			PensionRmDTO pensionRmDTO, BookDTO bookDTO) {
//		return bookDAO.listReservation(memberDTO ,memberDTO2,pensionDTO,pensionRmDTO,bookDTO);
//	}
	
	
}
