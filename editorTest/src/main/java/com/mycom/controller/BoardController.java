package com.mycom.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mycom.domain.BoardVO;
import org.mycom.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Inject
	BoardService service;
	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/write",method=RequestMethod.GET)
	public String goWritePage(){
		
		return "board/writePage";
	}
	@RequestMapping(value="/writeProc",method=RequestMethod.POST)
	public void WriteProcess(BoardVO vo, RedirectAttributes rttr) throws Exception{
		service.writeBoard(vo);
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public String readPage(BoardVO vo, 
			Model model, @RequestParam(value="noticeno", required=false) Integer noticeno, @RequestParam(value="usernickname", required=false) String usernickname,
			HttpServletRequest request, HttpServletResponse response){
		/*RequestParam의 noticeno와 usernickname은 신경 쓰지 않으셔도 됩니다.*/

		Map<String, Integer> map = new HashMap<>();
		map.put("bno", vo.getBno());
		
		BoardVO board_vo = service.readBoard(map, request, response, noticeno, usernickname);
		//게시글 조회
		model.addAttribute("boardVO",board_vo);
		model.addAttribute("filesList", service.getFiles(map));
		return "/board/readPage";
	}
}
