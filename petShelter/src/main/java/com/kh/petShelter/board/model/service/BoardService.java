package com.kh.petShelter.board.model.service;

import java.util.ArrayList;

import com.kh.petShelter.board.model.vo.Board;
import com.kh.petShelter.common.model.vo.PageInfo;

public interface BoardService {

	int listCount();

	ArrayList<Board> selectList(PageInfo pageInfo);

	int cListCount(int categoryNo);

	ArrayList<Board> orderByCategory(int categoryNo, PageInfo pageInfo);

	int insertBoard(Board board);


	
}
