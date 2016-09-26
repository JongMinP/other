package org.mycom.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.mapping.ResultMap;
import org.mycom.dao.BoardDAO;
import org.mycom.domain.BoardVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO board_dao;
	//게시글쓰기
	@Transactional
	@Override
	public void writeBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		board_dao.writeBoard(vo);
		//files의 등록을 해줘야한다.
		String[] files = vo.getFile_url();
		if(files != null){
			for(String fileName : files){
				vo.setFileName(fileName);
				board_dao.addFiles(vo);
			}
		}
	}
	//상세보기
	@Override
	public BoardVO readBoard(Map<String, Integer> map, HttpServletRequest request, HttpServletResponse response, Integer noticeno, String usernickname) {
		// TODO Auto-generated method stub
		//request, reponse, notice, usernickname은 신경 쓰지 않으셔도 됩니다.
		return board_dao.readBoard(map);
	}
	
	@Override
	public void addFiles(BoardVO vo) {
		// TODO Auto-generated method stub
		board_dao.addFiles(vo);
	}
	@Override
	public List<Map<String, String>> getFiles(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		List<Map<String, String>> resultList = new ArrayList<>();

		for(String originalValue : board_dao.getFiles(map)){
			
			//키값 가공을 위함.
			String keyValue = originalValue.substring(originalValue.indexOf("_") + 1);
			
			//만약에 데이터가 4개라면 총4개의 map이 선언되어야 한다.
			Map<String, String> reusltMap = new HashMap<>();
			//("해당파일.확장자","원본URL") 
			reusltMap.put(keyValue, originalValue);
			
			resultList.add(reusltMap);
		}
		 return resultList;
	}
}
