package com.e7e.rest.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Data2VO {

	private String name;
	private String alias;
	private List<MultipartFile> file;  //웬만하면 배열 말고 list로 쓰기
	
	
}
