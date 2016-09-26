package org.mycom.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mycom.domain.BoardVO;
import org.springframework.stereotype.Service;

@Service
public interface BoardService {
	public void writeBoard(BoardVO vo);
	public void addFiles(BoardVO vo);

	public BoardVO readBoard(Map<String, Integer> map, HttpServletRequest request, HttpServletResponse response, Integer noticeno, String usernickname);
	public List<Map<String, String>> getFiles(Map<String, Integer> map);

}
