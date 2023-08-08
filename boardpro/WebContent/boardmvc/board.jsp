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
body *{
  box-sizing:   border-box;
}
.p12{
  display: flex;
  flex-direction:  row;
}
p{
/*    border  : 1px dotted blue; */
   padding : 4px;
   margin  :2px;
   word-break:keep-all;/* 줄바꿈: 단어단위로  */
}
.p1{
   flex:  70%;
}
.p2{
   flex : 30%;
   text-align:  right;
}

.card-body{
   display:  flex;
   flex-direction:  column;
}
input[name=reply]{
   height : 55px;
   vertical-align: top;
}
textarea {
   width : 70%;
}
#pagelist{
   margin-left : 20%;
}
.reply-body{
   background : yellow;
   padding : 3px;
   margin : 1px;
   border : 1px dotted orange;
}
</style>


<script type="text/javascript">

currentPage = 1;

mypath = '<%= request.getContextPath()%>';

console.log(mypath);

reply = { } ; //동적 으로 속성과 기능을 추가 가능  reply.name = ""  reply.bonum = 31 

$(function(){
	//페이지별로 리스트출력하기  별도로 외부 스크립트로 선언해있음 script src="../js/board.js" /페이지 시작하자마자 시작
     $.listPageServer(1);
     
     //이벤트 
     //다음 클릭
     $(document).on('click', '#next', function(){
       currentPage = parseInt($('.pageno').last().text().trim())+1;
       
       $.listPageServer(currentPage);
     });
    
     
     //이전클릭
     $(document).on('click','#prev',function(){
      currentPage = parseInt($('.pageno').first().text().trim())-1;
      
      $.listPageServer(currentPage);
     });
     
     //페이지번호 클릭
     $(document).on('click', '.pageno', function(){
        currentPage = $(this).text().trim() ;
        
      $.listPageServer(currentPage);
     });
     
     //검색 search클릭 
    $('#search').on('click', function(){
      currentPage = 1;
      $.listPageServer(currentPage);      
    });
     
    
     //글쓰기 모달창에서 send전송 버튼 클릭 
     $('#send').on('click',function(){
      //입력한 모든 값을 가져온다
      fdata = $('#wform').serializeJSON();
      
      //폼데이터를 js에 있는 ajax로 가져가기 -> 
      $.boardWriteServer();
      
      //모달창 닫기
      $('#wform .txt').val("");
      $('#wModal').modal('hide');
      
     });
     
     
     //수정 삭제 등록 댓글수정 댓글삭제 제목클릭  ---이벤트 
     $(document).on('click', '.action', function(){
           
    	//전역변수 생성 ->board.js내부에서 사용하기 위해		  
		  target = this; //target -> 모든 버튼 제목클릭  
          vaction =    $(this).attr('name');
          vidx = $(this).attr('idx');
          
          if(vaction  == "modify"){
             alert(vidx + "번 글을 수정")
             $('#mModal').modal('show');// 모달창 띄울때는 show
             
             //본문의 내용 가져오기
             vparents = $(this).parents('.card');
             
             //작성자
             vwr = $(vparents).find('.wr').text();
             //이메일
             vma = $(vparents).find('.ma').text();
             //내용//내용은 <br>있으니까 html로 가져오기 
             vcont = $(vparents).find('.p3').html();
             //<br> => \n으로 변경
             vcont = vcont.replace(/<br>/g, "\n");//<br>을 \n으로 변경한다 
             
             //제목
             vtit = $(vparents).find('.title').text();
             
             //modal창에 출력하기
             $('#mform #writer').val(vwr);
             
             
          }else if(vaction  == "delete" ){
             alert(vidx +  "번 글을 삭제");
             
             $.boardDeleteServer();
             
          
          }else if(vaction == "list"){   //제목을 클릭
             alert( vidx +  "번 게시판글과 댓글을 모두 보기");
             
          $.replyListServer();//제목클릭시 댓글 창 나오기
             
             
          }else if(vaction  == "reply"){
             alert(vidx +  "번글에 댓글을 씁니다")
             //('textarea').val xx->한개만 가져옴 /누른거 기준으로 가져오기->this/prev->앞에 형제
             //입력한 내용가져오기
             cont = $(this).prev().val();
             
             //replytab에 저장할 데이타 만들기 - bonum, name, cont
             name1 = String.fromCharCode(parseInt(Math.random()*26+65));
             name2 = String.fromCharCode(parseInt(Math.random()*26+97));
             name3 = parseInt(Math.random()*100+1);
             
             reply.name = name1 + name2 + name3;//지금은 랜덤으로../로그인 아이디로 넣어주기
             reply.bonum = vidx;
             reply.cont = cont;
             
             //입력한 textarea내용 지우기(내용 등록후 textarea 지우기)
             $(this).prev().val("");
             
             //댓글 쓰기 저장
             $.replyWriteServer();
             
         	//여기에 댓글리스트 출력x
               
             
             
             
          }else if(vaction == "r_modify"){
             //alert(vidx + "번 댓글 을 수정 ")
             
             
             
                
             //수정할 내용 (원래 내용)을 가져온다 
             
             //원래내용의 <br>태그를 \n으로 변경- modifyform (수정폼)에 출력 
             
             //수정폼을 p3으로 이동 
             
             //수정폼을 보이기 
             
          }else if(vaction == "r_delete"){
             alert(vidx + " 댓글 삭제");
          
             
             //renum기준으로 삭제
             $.deleteReplyServer();
             
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









