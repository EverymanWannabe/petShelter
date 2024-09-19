package com.kh.petShelter.board.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Board {
	private int boardNo;			//	BOARD_NO	NUMBER
	private int memberNo;			//	MEMBERNO	NUMBER
	private int fileNo;//	FILENO	NUMBER
	private int categoryNo;			//	CATEGORY_NO	NUMBER
	private String boardTitle;//	BOARD_TITLE	VARCHAR2(1000 BYTE)
	private String boardContent;//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private int count;			//	COUNT	NUMBER
	private int recommend;			//	RECOMMEND	NUMBER
	private Date uploadDate;			//	UPLOAD_DATE	DATE
	private Date reviseDate;			//	REVISE_DATE	DATE
	private String status;			//	STATUS	VARCHAR2(1 BYTE)
}
