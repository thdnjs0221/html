<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
  
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="../js/board.js"  type="text/javascript"></script>
<script src="../js/jquery.serializejson.min.js"  type="text/javascript"></script>

<style>
*{
   box-sizing: border-box;
}
#result p{
 
 margin : 1px;
 padding : 3px;
 height : auto;
}
.p1{
  float : left;
  width : 70%;
}
.p2{
  float : right;
  width : 28%;
}
.p3{
  clear: both;
}
input[name=reply]{
  height : 50px;
  vertical-align: top; 
}
#pagelist{
  margin-left : 20%;
}
label{
  display : inline-block;
  width : 80px;
  height : 30px;
}

.reply-body{
 background : #f1fadd;
 border : 1px solid gold;
 margin : 1px;
 padding : 5px;
}
</style>


<script type="text/javascript">

currentPage = 1;

mypath = '<%= request.getContextPath()%>';  
//board.js에 쓰기 위해 선언한
console.log(mypath);

reply = { } ; //동적 으로 속성과 기능을 추가 가능  reply.name = ""  reply.bonum = 31 

$(function(){
	//페이지별로 리스트출력하기   외부 스크립트로 선언해있음 script src="../js/board.js" /페이지 시작하자마자 시작
	  $.listPageServer(1);
	  
	  //이벤트 
	  //다음 클릭 
	 
	  //이전클릭
	
	  
	  //페이지번호 클릭 
	  
	  
	  //검색 search클릭 
	 
	  
	 
	  //글쓰기 모달창에서 send전송 버튼 클릭 
	  
	  
	  //수정 삭제 등록 댓글수정 댓글삭제 제목클릭  ---이벤트 
	  $(document).on('click', '.action', function(){
		  
		   
		    vaction =    $(this).attr('name');
		    vidx = $(this).attr('idx');
		    
		    if(vaction  == "modify"){
		    	alert(vidx + "번 글을 수정")
		    	
		    	
		    	
		    	
		    }else if(vaction  == "delete" ){
		    	alert(vidx +  "번 글을 삭제");
		    	
		    	
	    	
		    }else if(vaction == "list"){
		    	//alert( vidx +  "번 게시판글과 댓글을 모두 보기");
		    	
		    	
		    	
		    }else if(vaction  == "reply"){
		    	//alert(vidx +  "번글에 댓글을 씁니다")
		    	
		    	
		    	 
		    	
		    }else if(vaction == "r_modify"){
		    	//alert(vidx + "번 댓글 을 수정 ")
		    	
		    	
		    	
		    		
		    	//수정할 내용 (원래 내용)을 가져온다 
		       
		    	//원래내용의 <br>태그를 \n으로 변경- modifyform (수정폼)에 출력 
		    	
		    	//수정폼을 p3으로 이동 
		    	
		    	//수정폼을 보이기 
		    	
		    }else if(vaction == "r_delete"){
		    	
		    }
	  })//이벤트
	
	  replyReset = function(){
		  
		  //p3을 찾는다 
		  vp3 = $('#modifyform').parent();
		  
		  //수정폼을 body로 이동 - 안보이게 설정 
		  $('body').append($('#modifyform'));
		  $('#modifyform').hide();
		  
		  //원래내용을 p3으로 다시 출력 
		  $(vp3).html(modifycont);
	  }
	  
	  
	  
	
	  
	  //댓글 수정창에서 확인버튼 
	  $('#btnok').on('click', function(){
		  
		  //입력한 내용을 가져온다 - 엔터기호가 포함 
		
		  //엔터기호를 <br>태그로 변경 
		 
		  //p3을 찾는다
  		  
		  //modifyform을 body로 이동  -안보이도록 설정 
		  
		  //p3에  입력한 내용(<br>태그로 변경한) 을 출력 - DB 수정 후 에 실행 
		  //$(vp3).html(modiout);
		  
	  })
	  
	  //댓글 수정창에서 취소버튼
	  $('#btnreset').on('click', function(){
		  
	  })
	  
	  
	  //글 수정 modal창에서 전송버튼 클릭
	  $('#msend').on('click', function(){
		  //입력한 내용 가져오기
		  
		  //서버로 보내기 
		
		  
		  //- db에서 수정성공 후 수정한 내용으로 화면(본문의 내용)바꾸기- 
		    //modal창에 수정한 내용을 가져온다 
	    	//엔터기호가 포함
	    	
			//엔터기호변경
	    	
	    	
	    	 /* //화면(본문의 내용)바꾸기 성공시 할일-
	    	 vparents =  $(vmodify).parents('.card');
	    	 $(vparents).find('a').text(vms)
	    	
	    	 $(vparents).find('#em').text(vmm);
	    	 $(vparents).find('.wp3').html(vmc);
		   */
		  
	  })
	  
 })//$function
</script>

<style>
nav , #write{
  margin : 10px 5% ;
}
nav a{
   visibility:  hidden;
}
#stype {
  width : 100px;
}
#sword {
  width : 150px;
}
#modifyform{
  display: none;
}
</style>
</head>
<body>

<div id="modifyform">
<textarea rows="5" cols="50"></textarea>
<input type="button" value="확인" id="btnok">
<input type="button" value="취소" id="btnreset">
</div>

 <input type="button" value="글쓰기" id="write" data-bs-toggle="modal" data-bs-target="#wModal">
 <br><br>
 
   <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
  <!-- <a class="navbar-brand" href="javascript:void(0)">Logo</a>  --> 
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
      </ul>
      <form class="d-flex">
        <select class="form-select" id="stype">
		  <option value="">전체</option>
		  <option value="writer" >이름</option>
		  <option value="subject" >제목</option>
		  <option value="content">내용</option>
		</select>
      
        <input class="form-control me-2" type="text" id="sword" placeholder="Search">
        <button class="btn btn-primary" id="search" type="button">Search</button>
      </form>
    </div>
  </div>
</nav>
 
<br><br>
<!--리스트 페이지출력부분  -->
  <div id="result"></div>
  <br><br>
  <div id="pagelist"></div>
  
  
  <!-- 글쓰기 The Modal -->
<div class="modal" id="wModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="wfrom" id="wform">
            <label>이름</label>
            <input type="text" class="txt" name="writer"> <br> 
            
            <label>제목</label>
            <input type="text" class="txt" name="subject"> <br> 
            
            <label>메일</label>
            <input type="text"  class="txt" name="mail"> <br> 
            
            <label>비밀번호</label>
            <input type="password"  class="txt" name="password"> <br> 
            
            <label>내용</label>
            <br>
            <textarea rows="5" cols="40"  class="txt" name="content"></textarea>
            <br>
            <br>
            <input type="button" value="전송" id="send">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
  
  
    <!-- 글 수정 The Modal -->
<div class="modal" id="mModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="mfrom" id="mform">
        
           <input type="hidden" id="num" name="num" >
        
            <label>이름</label>
            <input type="text" class="txt" id="writer" name="writer"> <br> 
            
            <label>제목</label>
            <input type="text" class="txt" id="subject" name="subject"> <br> 
            
            <label>메일</label>
            <input type="text"  class="txt" id="mail" name="mail"> <br> 
            
            <label>비밀번호</label>
            <input type="password"  class="txt" id="password" name="password"> <br> 
            
            <label>내용</label>
            <br>
            <textarea rows="5" cols="40"  class="txt" id="content" name="content"></textarea>
            <br>
            <br>
            <input type="button" value="전송" id="msend">
        </form>
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










