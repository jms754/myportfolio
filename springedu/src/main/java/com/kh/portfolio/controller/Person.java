package com.kh.portfolio.controller;

import javax.persistence.Entity;
import javax.validation.constraints.Max;

import lombok.Data;

@Data
@Entity
public class Person{
	String name;
	@Max(value=30, message = "30살 미만으로만 입력가능합니다.")
	int age;
	
}
