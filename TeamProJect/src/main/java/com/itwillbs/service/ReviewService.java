package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReviewDAO;
import com.itwillbs.domain.ReviewDTO;


@Service
public class ReviewService {

	@Inject
	private ReviewDAO reviewDAO;
	
	public void insertimage(String filename) {
		reviewDAO.insertimage(filename);
	}
	
	public int reviewcount() {
		return reviewDAO.reviewcount();
	}
	
	public void insertreview(ReviewDTO rT) {
		reviewDAO.insertreview(rT);
	}
	
	public Map<String, Object> staravg(String pen_id){
		return reviewDAO.staravg(pen_id);
	}
	
	public List<ReviewDTO> selectreviewlist(String pen_id){
		return reviewDAO.selectreviewlist(pen_id);
	}
}
