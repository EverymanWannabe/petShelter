package com.kh.petShelter.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petShelter.board.model.service.BoardService;
import com.kh.petShelter.board.model.vo.Board;
import com.kh.petShelter.common.template.Pagination;

import jakarta.servlet.http.HttpSession;

import com.kh.petShelter.common.model.vo.PageInfo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list.bo")
	public String boardList(@RequestParam(value="currentPage",defaultValue="1")int currentPage,
							@RequestParam(value = "categoryNo", defaultValue = "0") int categoryNo,
							Model model) {
		int listCount;
		ArrayList<Board> list;
		int pageLimit = 10;
		int boardLimit = 5;
	if (categoryNo == 0) {
		listCount = boardService.listCount();
		list = boardService.selectList(Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit));
	} else {
		listCount = boardService.cListCount(categoryNo);
		list = boardService.orderByCategory(categoryNo,
				Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit));
	}
	
	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	model.addAttribute("pi",pi);
	model.addAttribute("list",list);
	model.addAttribute("categoryNo", categoryNo);

	
	return "board/boardList";
	}
	
	@GetMapping("/insert.bo")
	public String boardEnrollForm() {
		
		return "board/insertBoard";
	}
	
	//게시글 등록 메소드
	@PostMapping("/insert.bo")
	public String insertBoard(Board b
							 ,MultipartFile upfile
							 ,HttpSession session) {
//		if(!upfile.getOriginalFilename().equals("")) {
//			
//			
//			//만들어놓은 파일업로드 메소드 사용하기 
//			String changeName = saveFile(upfile,session);
//			
//			//Board에 변경된 파일명과 원본 파일명 담아주기
//			b.setOriginName(upfile.getOriginalFilename());
//			b.setChangeName("resources/uploadFiles/"+changeName);
//			
//		}
		
		int result = boardService.insertBoard(b);
		
		if(result>0) {//게시글 작성 성공
			session.setAttribute("alertMsg", "게시글 작성 성공!");
		}else { //게시글 작성 실패
			session.setAttribute("alertMsg", "게시글 작성 실패!");
		}
		
		
		return "redirect:/board/list.bo";
		
	}

	private String saveFile(MultipartFile upfile, HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
