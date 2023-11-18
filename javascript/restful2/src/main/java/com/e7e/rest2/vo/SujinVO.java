package com.e7e.rest2.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


//시작은 테이블 1개당 VO개지만, 필요에 의해, 수가 확정은 자유의지로
@Setter
@Getter
@ToString  //디버깅 편리하게
public class SujinVO {
	
	private int sujinNum;
	private String sujinName;
	private String sujinCont;
	private String sujinFile;

}
