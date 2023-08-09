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
      data : mdata,
      success : function(res){
         if(res.sw=="성공"){
            // 성공이면 화면의 본문의 내용을 modal창의 수정내용으로 변경
            vparents =  $(target).parents('.card');
             $(vparents).find('a').text(vtit);
          
             $(vparents).find('.ma').text(vmail);
              $(vparents).find('.p3').html(vcont);
         }
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
      data : {"num" : vidx},
      success : function(res){
         if(res.sw =="성공"){
            currentPage = 1;
            $.listPageServer(currentPage);
         }
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
      data : {"cont" : bmcont,
            "renum" : vidx},
      success : function(res){
         if(res.sw=="성공"){
            // 화면 댓글의 본문을 변경
            
         }
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
      data : { "renum" : vidx },
      success : function(res){
         if(res.sw=="성공"){
            //화면에서 해당 댓글 삭제하기
            $(target).parents('.reply-body').remove();
         }
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
      data : { "bonum" : vidx },  // { "bonum" : reply.bonum },
      success : function(res){
         rcode = "";
         $.each(res, function(i,v){
            
            cont = v.cont;
            cont = cont.replace(/\n/g, "<br>");
            
            rcode += `<div class="reply-body">
                     <div class="p12">
                        <p class="p1">
                                      작성자:<span>${v.name}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      날짜 :<span>${v.redate}</span>
                        </p>
                        <p class ="p2">
                        
                        <input idx="${v.renum}" type="button"  value="댓글수정" name="r_modify"  class="action">
                        <input idx="${v.renum}" type="button"  value="댓글삭제" name="r_delete"  class="action">
                        </p>
                     </div>
                     <p class="rp3">
                        ${cont}
                     </p>
                 </div>`
         })// $.each 끝
         
         $(target).parents('.card').find('.reply-body').remove();
         
         $(target).parents('.card').find('.card-body').append(rcode);
         
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
      data : reply, //name, cont, bonum 들어있음
      
      success : function(res){
         if(res.sw=="성공"){
            //댓글 리스트 출력
            $.replyListServer();
         }
      },
      error : function(xhr){
         alert("상태 : " + xhr.status)
      },
      dataType : 'json'
   })
}
$.boardWriteServer = function(){
   $.ajax({
      url : `${mypath}/BoardWrite.do`,
        type : 'post',
        data : fdata,
        success : function(res){
          if(res.sw=="성공"){
            
         }
        },
        error : function(xhr){
           alert("상태 : " + xhr.status);
        },
        dataType : 'json'
   })
}

$.listPageServer = function(cpage){
   
   //맨 처음 실행시 값이 없다
    vtype = $('#stype option:selected').val();
    vword = $('#sword').val();
     
     $.ajax({
        url : `${mypath}/BoardList.do`,
        type : 'post',
        data :  {
            "page" : cpage,
            "stype" : vtype,
            "sword" : vword
        },
        success : function(res){
         code = `<div class="container mt-3">
                    <div id="accordion">`
         $.each(res.datas, function(i,v){
            
            content = v.content;   //엔터가 포함
            content = content.replace(/\n/g,"<br>")
            
            code += `<div class="card">
               <div class="card-header">
                 <a class="btn action title" name="list" idx="${v.num}" data-bs-toggle="collapse" href="#collapse${v.num}">
                    ${v.subject}
                 </a>
               </div>
               <div id="collapse${v.num}" class="collapse" data-bs-parent="#accordion">
                 <div class="card-body">
                     <div class="p12">

                        <p class="p1">
                                      작성자:<span class="wr">${v.writer}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   이메일:<span class="ma">${v.mail}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   조회수:<span class="hi">${v.hit}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   날짜 :<span class="wd">${v.wdate}</span>         
                        </p>
                        <p class ="p2">
                        
                        <input idx="${v.num}" type="button"  value="수정" name="modify"  class="action">
                        <input idx="${v.num}" type="button"  value="삭제" name="delete"  class="action">
                        </p>
                     </div>
                     <p class="p3">
                        ${content}
                     </p>
                     <p class="p4">
                     <textarea rows="" cols="60"></textarea>
                     <input idx="${v.num}" type="button"  value="등록" name="reply"  class="action">
                     </p>
                     
                 </div>
               </div>
             </div>`
         }); //$.each반복문 끝
         
         code += `</div>
               </div>`;
         //게시판 리스트 출력
         $('#result').html(code);
         //페이지 정보 출력
         pager = pageList(res.sp, res.ep, res.tp);
         $('#pagelist').html(pager);
         
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
   pager = "";
   pager += `<ul class="pagination">`;
   if(sp > 1){
      pager += `<li class="page-item"><a id="prev" class="page-link" href="#">Previous</a></li>`;
      
   }
   //페이지번호 
   for(i=sp; i<=ep; i++){
      if(i==currentPage){
         pager += `<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`;
      }else{
         pager += `<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`;
      }
   }
   
   
   //다음 
   if(ep <tp){
      pager +=`<li class="page-item"><a id="next" class="page-link" href="#">Next</a></li>`;
   }
   
   pager += `</ul>`;
   
   return pager;
   
}