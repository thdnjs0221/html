/**
 * 
 */
$.hitUpdateServer = function(target){
	
	$.ajax({
		url :   `${mypath}/HitUpdate.do`,
		data : {},
		type : 'get',
		success : function(res){
			
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
		
	})
}
$.boardUpdate = function(){
	
	$.ajax({
		url :   `${mypath}/BoardUpdate.do`,
		type : 'post',
		
		success : function(res){
			alert(res.flag);
			 vparents =  $(vmodify).parents('.card');
	    	 $(vparents).find('a').text(vms)
	    	
	    	 $(vparents).find('#em').text(vmm);
	    	 $(vparents).find('.wp3').html(vmc);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
		
	})
}

$.boardDeleteServer = function(){
	$.ajax({
		
		url  :  `${mypath}/BoardDelete.do`,
		type : 'get',
		data : {},
		success : function(res){
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
}


$.replyUpdateServer = function(){
	
	$.ajax({
		url  :  `${mypath}/ReplyUpdate.do`,
		type : 'post',
		   //reply객체 - cont, renum
		success : function(res){
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
}

$.deleteReplyServer = function(){ //target :클릭한 댓글삭제버튼 
	
	$.ajax({
		url  :  `${mypath}/ReplyDelete.do`,
		type : 'get',
		data : { },
		success : function(res){
			
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	})
}


$.replyListServer = function(){  //target :클릭한 등록버튼 , 클릭한 제목
	
	$.ajax({
		url :  `${mypath}/ReplyList.do`,
		type : 'get',
		data : {  },  // { "bonum" : reply.bonum },
		success : function(res){
			
		
		}, //success
		error : function(xhr){
			alert( "상태 : " + xhr.status);
		},
		dataType : 'json'
		
	}) //$.ajax
} //$.replyKistServer

$.replyWriteServer = function(){
	$.ajax({
		url : `${mypath}/ReplyWrite.do`,
		type : 'post',
		   //cont, bonum, name
		success : function(res){
			
		},
		error : function(xhr){
			
		},
		dataType : 'json'
	})
}
$.boardWriteServer = function(){
	$.ajax({
		url : `${mypath}/BoardWrite.do`,
		  type : 'post',
		  
		  success : function(res){
			 
		  },
		  error : function(xhr){
			  alert("상태 : " + xhr.status);
		  },
		  dataType : 'json'
	})
}

$.listPageServer = function(cpage){
	
	//맨처음 페이지 실행시는 검색값이 없다.
	 vtype = $('#stype option:selected').val();
	 vword = $('#sword').val();
	  
	  $.ajax({
		  url : `${mypath}/BoardList.do`,
		  type : 'post',
		  data :  {
			"page": cpage,
			"stype" : vtype,
			"sword" : vword
			    
		  },
		  success : function(res){
			  code =   `<div class="container mt-3">
			            <div id="accordion">`;
			  $.each(res.datas, function(i, v){
				  
				  
				  
			  })//$.each
			  code += `</div>
			          </div>`
			  
			    //리스트 출력
			  $('#result').html(code);
			  
			  //페이지 출력
			//  pager = pageList(res.sp,res.ep,res.tp);
			//  $('#pagelist').html(pager);
			    
			   
				          
		  },//success
		  error : function(xhr){
			  alert("상태 : " + xhr.status)
		  },
		  dataType : 'json'
		  
	  })
	
}

pageList =function(sp,ep,tp){
	//페이지 처리
	   //이전
	   
	   //페이지번호 
	  
	   //다음 
	   
	   
	   return pager;
	   
	 
}