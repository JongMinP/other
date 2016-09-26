package org.mycom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mycom.domain.BoardVO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	SqlSession session;
	
	private String mapper="org.mycom.mepper.BoardMapper";
	//게시글 쓰기
	@Override
	public void writeBoard(BoardVO vo) {
		session.insert(mapper + ".writeBoard", vo);
	}
	//파일 추가하기
	@Override
	public void addFiles(BoardVO vo) {
		// TODO Auto-generated method stub
		session.insert(mapper+".addFiles", vo);
	}
	//상세보기
	@Override
	public BoardVO readBoard(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return session.selectOne(mapper+".readBoard",map);
	}
	//파일가져오기
	@Override
	public List<String> getFiles(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return session.selectList(mapper+".getFiles", map);
	}
}
