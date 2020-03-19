package com.kh.portfolio.board.vo;

import javax.persistence.Entity;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
@Data
public class BoardCategoryVO {
	@NotNull(message = "카테고리를 선택하지 않으셨습니다.")
//	@Pattern(regexp = "^[^0]+$", message = "카테고리를 선택바랍니다.")
//	@Size(min =1, message="카데고리를 선택해주세요")
	@Min(value = 1, message = "카데고리를 선택해주세요.")
	private long cid;			//CID   NOT NULL NUMBER(10)
	private String cname;	//CNAME NOT NULL VARCHAR2(60)
}
