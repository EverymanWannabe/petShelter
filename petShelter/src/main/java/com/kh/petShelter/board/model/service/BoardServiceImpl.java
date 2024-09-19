package com.kh.petShelter.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petShelter.board.model.dao.BoardDao;
import com.kh.petShelter.board.model.vo.Board;
import com.kh.petShelter.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int listCount() {
		return boardDao.listCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		return boardDao.selectList(sqlSession,pi);
	}
	@Override
	public int cListCount(int categoryNo) {
		return boardDao.cListCount(sqlSession,categoryNo);
	}
	@Override
	public
	ArrayList<Board> orderByCategory(int categoryNo, PageInfo pageInfo){
		return boardDao.orderByCategory(sqlSession,categoryNo,pageInfo);
	}

	@Override
	public int insertBoard(Board board) {
		return boardDao.insertBoard(sqlSession,board);
		
	}
	
}
