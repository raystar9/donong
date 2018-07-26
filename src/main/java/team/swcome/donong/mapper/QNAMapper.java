package team.swcome.donong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import team.swcome.donong.dto.QNADTO;


@Mapper
public interface QNAMapper {

	public void insertQna(QNADTO qna);

	public int getQnaListCountAll();

	public List<QNADTO> getQnaListAll(RowBounds row);

	public int getQnaListCount(int memberNum);

	public List<QNADTO> getQnaList(int memberNum, RowBounds row);

	public void updateQna(QNADTO qna);

	public void updateAnswer(QNADTO qna);

	public QNADTO getQna(int num);

	public void deleteQna(int num);

	
}
