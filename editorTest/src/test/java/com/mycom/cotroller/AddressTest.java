package com.mycom.cotroller;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mycom.dao.BoardDAO;
import org.mycom.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AddressTest {
	
	@Inject BoardService service;
	@Inject BoardDAO board_dao;
	private Logger logger = LoggerFactory.getLogger(AddressTest.class);
	/*
	@Test
	public void AddressTest(){
		//넘어온 파일이름에 대해서 "/" -> "\"로 변경
		String fileName = "http://localhost:8080/displayEditorFile?fileName=/2016/09/19/acce479f-4dcb-4d47-accb-21094d195308_test.png";
		fileName.replace('/', File.separatorChar);
		logger.info(fileName);
		//http://localhost:8080/displayEditorFile?fileName=[/2016/09/19/64d41412-d3ca-43b0-84cb-49fa25b2c603_test.png]
		String originalFileName = fileName.substring(fileName.indexOf("=")+1);
		logger.info("filename : " + originalFileName);
	}*/
	@Test
	public void resultMapTest(){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cateidx", 10000);
		map.put("bno", 641);
		map.put("parentidx", null);
		
		List<Map<String, String>> resultList = new ArrayList<>();

		for(String temp_originalValue : board_dao.getFiles(map)){
			//원본 파일url
			String originalValue = temp_originalValue;
			
			//키값 가공을 위함.
			String keyValue = temp_originalValue.substring(temp_originalValue.indexOf("_") + 1);
			
			//만약에 데이터가 4개라면 총4개의 map이 선언되어야 한다.
			Map<String, String> reusltMap = new HashMap<>();
			reusltMap.put(keyValue, originalValue);
			
			resultList.add(reusltMap);
		}
		//		service.getFiles(map);
	}
}
