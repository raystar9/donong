package team.swcome.donong.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import team.swcome.donong.dto.NoticeDTO;

@Repository
public class QNADAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSessionTemplate session;
	
	public List<NoticeDTO> getNoticeAll(){
		return session.selectList("notice.selectAll");
	}
	
	public NoticeDTO getNotice(int num) {
		return session.selectOne("notice.select");
	}
	
}
