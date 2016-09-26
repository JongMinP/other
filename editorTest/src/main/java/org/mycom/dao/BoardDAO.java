package org.mycom.dao;

import java.util.List;
import java.util.Map;

import org.mycom.domain.BoardVO;

public interface BoardDAO {
	public void writeBoard(BoardVO vo);
	//파일등록
	public void addFiles(BoardVO vo);
	//파일가져오기
	public List<String> getFiles(Map<String, Integer> map);
	public BoardVO readBoard(Map<String, Integer> map);
}
