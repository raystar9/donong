package team.swcome.donong.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import team.swcome.donong.mapper.QNAMapper;

@Service
public class QNAService {
	
	@Autowired
	QNAMapper qnaMapper;
	
	
}