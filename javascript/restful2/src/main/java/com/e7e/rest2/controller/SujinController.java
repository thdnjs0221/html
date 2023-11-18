package com.e7e.rest2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.e7e.rest2.service.SujinService;
import com.e7e.rest2.vo.SujinVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api")
public class SujinController {
	
	//컨트롤러는 서비스를 부름
	@Autowired
	private SujinService sujinService;
	
	
	@GetMapping("/sujins")
	public List<SujinVO> getSujins(){
		
		return sujinService.getSujins();
	}
	
	
	@GetMapping("/sujin/{num}")
	public SujinVO getSujin(@PathVariable int num){
		SujinVO sujinVO = new SujinVO();
		sujinVO.setSujinNum(num);
		return sujinService.getSujin(sujinVO);
	}
	
	
	//json으로 넘겨받을거라 @RequestBody
	@PostMapping("/sujins")
	public int insSujin(@RequestBody SujinVO sujinVO) {  
		log.info("체크{}",sujinVO);
		return sujinService.insSujin(sujinVO);
	}
	
	@PutMapping("/sujins")
	public int updateSujin(@RequestBody SujinVO sujinVO) {  
		
		return sujinService.updateSujin(sujinVO);
	}
	
	@DeleteMapping("/sujin/{num}")
	public int updateSujin(@PathVariable int num) {
		SujinVO sujinVO = new SujinVO();
		sujinVO.setSujinNum(num);
		return sujinService.delSujin(sujinVO);
		
	}

}
