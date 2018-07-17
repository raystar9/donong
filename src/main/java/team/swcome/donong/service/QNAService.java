package team.swcome.donong.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import team.swcome.donong.dao.NoticeDAO;
import team.swcome.donong.dao.QNADAO;
import team.swcome.donong.mapper.NoticeMapper;
import team.swcome.donong.mapper.QNAMapper;

@Service
public class QNAService implements QNAMapper {
	
	@Autowired
	QNADAO qnaDAO;
	
	
}