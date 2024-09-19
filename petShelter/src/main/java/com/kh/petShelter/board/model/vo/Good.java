package com.kh.petShelter.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Good {

	private int boardNo;	//	BOARD_NO	NUMBER
	private int MemberNo;	//	MEMBERNO	NUMBER
	private int likeCount;	//	LIKE_COUNT	NUMBER	
}
