package team.swcome.donong.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import team.swcome.donong.dto.QNADTO;
import team.swcome.donong.mapper.QNAMapper;

@Service
public class QNAService {
	
	@Autowired
	QNAMapper qnaMapper;

	public QNADTO getQna(int num) {

		return qnaMapper.getQna(num);
	}

	public void insertQna(QNADTO qna) {
		
		qnaMapper.insertQna(qna);
	}

	public Map<String, Object> getQnaListAll(HttpServletRequest request) {
		int page = 1;
		int limit = 10;
		int listCount = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		RowBounds row = new RowBounds((page - 1) * limit, limit);
		
		listCount = qnaMapper.getQnaListCountAll();
		maxPage = (listCount + limit - 1) / limit;
		startPage = ((page - 1) / 10) * 10 + 1;
		endPage = startPage + 10 - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		if (endPage < page) {
			page = endPage;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaList", qnaMapper.getQnaListAll(row));
		map.put("listCount", listCount);
		map.put("page", page);
		map.put("limit", limit);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}

	public Map<String, Object> getQnaList(int memberNum, HttpServletRequest request) {
		int page = 1;
		int limit = 10;
		int listCount = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		RowBounds row = new RowBounds((page - 1) * limit, limit);
		
		listCount = qnaMapper.getQnaListCount(memberNum);
		maxPage = (listCount + limit - 1) / limit;
		startPage = ((page - 1) / 10) * 10 + 1;
		endPage = startPage + 10 - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		if (endPage < page) {
			page = endPage;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaList", qnaMapper.getQnaList(memberNum, row));
		map.put("listCount", listCount);
		map.put("page", page);
		map.put("limit", limit);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}

	public void updateQna(QNADTO qna) {

		qnaMapper.updateQna(qna);
	}

	public void updateAnswer(QNADTO qna) {
		
		qnaMapper.updateAnswer(qna);
	}

	public void deleteQna(int num) {
		
		qnaMapper.deleteQna(num);
	}
	
	
}