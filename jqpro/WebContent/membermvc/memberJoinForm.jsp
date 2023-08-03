<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="../js/jquery-3.7.0.min.js"></script>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 
 <script src="../js/jquery.serializejson.min.js"></script>

<script >

function proc1() {
	
	//입력한 동을 가져오기
	dongvalue= $('#dong').val().trim();
	
	//입력확인 
	if(dongvalue.length <1){
		alert("동이름 입력");
		return false;
	}
	
	$.ajax({   
		url : "/jqpro/SelectByDong.do",  //==> 로컬호스트에서부터 찾는것     jqpro/==>자신의 위치에서 찾는것
		type: 'post',
		data:{'dong':dongvalue },
		dataType:'json',
		success: function(res){
			//dongList
			
			code=`<table border="1"><tr><th>우편번호</th>
			<th>주소</th>
			<th>번지</th></tr>`;
			
			$.each(res,function(i,v){
				
				bunji = v.bunji;
				if(typeof bunji == "undefined")bunji="";
				
				
				code+=`<tr class="ziptr"><td>${v.zipcode}</td>
					<td>${v.sido}${v.gugun}${v.dong}</td>
					<td>${bunji}</td></tr>`
				
				
			})
			code+=`</table>`
			$('#result1').html(code);
		},
		error: function(xhr){
			alert("상태: "+xhr.status)
		}
	})//ajax
}//function







$(function() {
	//-----------------------------------------------
	//전송버튼 클릭
	$('#send').on('click',function(){
		//입력한 모든 값을 가져오기- id name pass bir hp mail zip add1 dd2  라이브러리이용해서..(외부스크립트 추가해주기)
		//jquery.serializejson.min.js 스크립트에서 쓰기
		//폼 아이디 이용해서 데이터 가져오기 
		fdata1=$('#join').serialize();
		fdata2=$('#join').serializeArray();
		fdata3=$('#join').serializeJSON();
		
		console.log(fdata1);
		console.log(fdata2);
		console.log(fdata3);
		
		$.ajax({
			
			url: "<%=request.getContextPath()%>/InsertMember.do",
			type: 'post',
			data: fdata3,
		    	success:function(res){
		    		
		    	},
		    	error:function(xhr){
		    		alert("상태: "+xhr.status)
		    	},
			dataType:'json'
		})//ajax
		
		
		
		
<%-- 		//입력한 모든 값을 가져오기 - id name pass bir hp mail zip add1 dd2 (id이용해서 가져오기) input은 .val()로 가져오기 
		
		vid= $('#id').val();
		vname=  $('#name').val();
		vpass= $('#pass').val();
		vbir= $('#bir').val();
		vhp=  $('#hp').val();
		vmail= $('#email').val();
		vzip= $('#zip').val();
		vadd1= $('#add1').val();
		vadd2= $('#add2').val();
		
		
		$.ajax({
			
			url: "<%=request.getContextPath()%>/InsertMember.do",
			type: 'post',
			data: {
				"id":vid,
				"pass":vpass,
				"name":vname,
				"bir":vbir,
				"hp": vhp,
				"email":vmail,
				"zip":vzip,
				"add1":vadd1,
				"add2":vadd2
		    	},
		    	success:function(res){
		    		
		    	},
		    	error:function(xhr){
		    		alert("상태: "+xhr.status)
		    	},
			dataType:'json'
		})//ajax
	 --%>
	
	})//onclick
	
	
	
	
	
	//주소 결과창에서 하나를 선택하면 
	
		$(document).on('click','.ziptr',function(){
		//alert("hello")
		zipvalue= $('td',this).eq(0).text()
		addrvalue= $('td',this).eq(1).text()
		
		
		$('#zip').val(zipvalue);
		$('#add1').val(addrvalue);
		
		//모달창 닫기
		$('#myModal1').modal('hide');
		
		
	})
	
	
	
	//아이디 중복검사 이벤트
	$('#checkid').on('click',function(){
		//입력한 아이디 값을 가져온다 .val
		var inputId= $('#id').val().trim();
		
		//입력 했는지 안했는지 비교 
		if(inputId.length < 1){
			alert("id를 입력하세요");
			return false;  //더이상 밑으로 안내려오고 함수끝냄 

			
		}
		//규칙문자 만들기 
		//idreg=/^[a-zA-Z]+/  ==> 영문한글자이상  
		idreg=/^[a-zA-Z][a-zA-Z0-9]{3,9}$/      //4~10자리
		
		if(!(idreg.test(inputId))) {
			//규칙과 입력문자가 맞지 않았다.
			alert("id형식 오류입니다");
			return false;  //더이상 밑으로 안내려오고 함수끝냄 
		}
		
		
		$.ajax({
			url: "<%=request.getContextPath()%>/SelectById.do",
			data: {"id": inputId} , /*SelectById서블릿  */		
			type: 'get',
			dataType: 'json',
			success: function(res){
				$('#spanid').html(res.sw).css('color','red');
			},
			error: function(xhr){
				alert("상태: "+xhr.status)
			}
		})//ajax
		
		
	})//click function  //클릭 이벤트가 끝나고 줘야함
	
	$('#zipbtn').on('click',function(){
		window.open("zipsearch.html","우편번호찾기","width=500 height=400");
		
		
	})
})


</script>
<style type="text/css">
.form-control{
	line-height:1.0;
	width: 200px;
	height: 30px;
}
#add1,#add2{
	width: 400px;

}

input[type=button]{

	margin-bottom: 2px;
}
.ziptr:hover{
	background: CRIMSON;
	

}


</style>


</head>
<body>
<!-- name="" ==> VO랑 똑같이 쓰기  -->
<div class="container mt-3">
  <h2>회원가입</h2>
  <form id="join">
   <div class="mb-3 mt-3">
   
      <label for="id">아이디:</label>
      <input type="button" id="checkid" value="중복검사" class="btn btn-outline-info btn-sm">
      <span id="spanid"></span>
      <input type="text" class="form-control" id="id" name="mem_id">
    </div>

    <div class="mb-3">
      <label for="pwd">비밀번호:</label>
      <input type="password" class="form-control" id="pass"  name="mem_pass">
    </div>
    
     <div class="mb-3 mt-3">
    <label for="name">이름:</label>
      <input type="text" class="form-control" id="name" name="mem_name">
    </div>
    
      <div class="mb-3">
      <label for="bir">생일:</label>
      <input type="date" class="form-control" id="bir"  name="mem_bir">
    </div>
    
     <div class="mb-3">
      <label for="zip">우편번호:</label>
      <input type="button" value="번호검색" id="zipbtn" class="btn btn-outline-info btn-sm">
  		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
    		우편번호검색
 		 </button>
      <input type="text" class="form-control" id="zip"  name="mem_zip" >
    </div>
    
    
    
    <div class="mb-3 mt-3">
      <label for="email">이메일:</label>
      <input type="text" class="form-control" id="email" name="mem_mail">
    </div>
    
    
    <div class="mb-3 mt-3">
      <label for="hp">전화번호:</label>
      <input type="text" class="form-control" id="hp" name="mem_hp">
    </div>
  
    
   
    <div class="mb-3">
      <label for="add1">주소:</label>
      <input type="text" class="form-control" id="add1"  name="mem_add1">
    </div>
    
    <div class="mb-3">
      <label for="add2">상세주소:</label>
      <input type="text" class="form-control" id="add2"  name="mem_add2">
    </div>
    
    <button type="button" id="send" class="btn btn-outline-secondary">Submit</button>
    <span id="joinspan"></span>
    <!--가입성공실패  -->
  </form>
</div>

<!-- modal  -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-sm" >
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">우편번호찾기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      		<p> 찾는동을 입력하세요</p>
			<input type="text" id="dong">
			<input type="button" value="확인" onclick="proc1()">
			<br>
			<div class="ddres" id="result1"> </div>
			<br>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>





</body>
</html>