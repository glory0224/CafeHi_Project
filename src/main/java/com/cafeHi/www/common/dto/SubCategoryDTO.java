package com.cafeHi.www.common.dto;

import lombok.Data;

@Data
public class SubCategoryDTO {
	
	private int category_sub_code;
	private String category_sub_type;
	private String category_sub_name;
	private CategoryDTO category;
}
