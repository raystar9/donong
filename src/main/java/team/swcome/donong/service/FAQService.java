package team.swcome.donong.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import team.swcome.donong.dto.FAQDTO;
import team.swcome.donong.mapper.FAQMapper;

@Service
public class FAQService {
	
	@Autowired
	FAQMapper faqMapper;
	
	public Map<String, Object> getFaqSrcList(String keyword, HttpServletRequest request) {
		int page = 1;
		int limit = 15;
		int listCount = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		RowBounds row = new RowBounds((page - 1) * limit, limit);
		
		listCount = faqMapper.getSrcListCount("%" + keyword + "%");
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
		map.put("faqList", faqMapper.getSrcList("%" + keyword + "%", row));
		map.put("listCount", listCount);
		map.put("page", page);
		map.put("limit", limit);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}

	public int faqReadCountUpdate(int num) {

		return faqMapper.faqReadCountUpdate(num);
	}

	public List<FAQDTO> getFaqTopTenList(RowBounds row) {

		return faqMapper.getFaqTopTenList(row);
	}

	
}