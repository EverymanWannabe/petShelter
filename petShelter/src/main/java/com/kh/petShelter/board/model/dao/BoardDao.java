package com.kh.petShelter.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petShelter.board.model.vo.Board;
import com.kh.petShelter.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int listCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.listCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList",null,rowBounds);
	}

	public int cListCount(SqlSessionTemplate sqlSession, int categoryNo) {
		
		 return sqlSession.selectOne("boardMapper.cListCount", categoryNo);
	}

	public ArrayList<Board> orderByCategory(SqlSessionTemplate sqlSession, int categoryNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		
	 return (ArrayList)sqlSession.selectList("boardMapper.orderByCategory", categoryNo, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertBoard",b);
	}
	

}
