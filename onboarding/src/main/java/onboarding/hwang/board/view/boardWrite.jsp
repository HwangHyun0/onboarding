<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/res/css/hwang-css/hwang-common.css">
<meta charset="utf-8">
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/ckeditor.js"></script>
<title>Hwang게시판</title>

 <%@include file="/WEB-INF/jsp/hwang/hwang-header.jsp"%>
 
 <style>
 	    #container {
            width: 1000px;
            margin: 20px auto;
        }
        .ck-editor__editable[role="textbox"] {
            /* editing area */
            min-height: 400px;
        }
        .ck-content .image {
            /* block images */
            max-width: 80%;
            margin: 20px auto;
         }
 
 </style>
 
  <div id="contents">
        <div class="container" style="max-width:1000px;">
            <div class="row">
               <div class=" col-md-12 ">
                  <form id="boardForm" class="main_form">
                     <div class="row">
                        <div class="col-md-12">
                           <h1>제목</h1>
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="제목" type="text" name="title"> 
                        </div>
                         <div class="col-md-12">
                           <h1>내용</h1>
                        </div>
                        <div class="col-md-12">
						     <textarea name="content" id="editor"></textarea>
                        </div>
                        <div class="col-md-12">
                           <input type="button" style="border:none;" id="boardSave" class="send_btn" value="등록 ">
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
	</div>



<%@include file="/WEB-INF/jsp/hwang/hwang-footer.jsp"%>

   <script>
   		//	애디터 불러오기 
        ClassicEditor
            .create( document.querySelector( '#editor' ) )
            .catch( error => {
                console.error( error );
        } );
   		
        $("#boardSave").click(function(){
        	var formData = $("#boardForm").serialize(); 
        	
			   if(confirm("등록 하시겠습니까?")){
				   $.ajax({
						url:"/hwang/board/boardSave.dcp",
						type:"post",
						data:formData,
						success: function(result){
							if(result == '1'){
								 swal( "", "저장되었습니다." , "success").then(function(){
									  location.href = "/hwang/board/boardList.dcp";
								  });
							} else {
								alert("실패");
							}
						},
						error: function(){
							alert("실패 ");
						}
					});
					
			   } else {
					return false;
			   }
			   
        });
   </script>