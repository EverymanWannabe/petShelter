package com.kh.petShelter.board.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Category {

	private int categoryNo;//	CATEGORY_NO	NUMBER
	private String categoryName;//	CATEGORY_NAME	VARCHAR2(100 BYTE)
	
}
