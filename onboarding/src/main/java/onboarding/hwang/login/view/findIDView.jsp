<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link rel="stylesheet" type="text/css" href="/res/css/hwang-css/hwang-common.css">
 	
 
	<title>HWANG아이디찾기</title>
	
	<%@include file="/WEB-INF/jsp/hwang/hwang-header.jsp"%>
	
	<div id="contents">
      <div class="contact" style="margin:0 auto !important; max-width:690px;">
         <div class="container">
            <div class="row">
               <div class=" col-md-12 ">
                  <form id="FindForm" class="main_form">
                     <div class="row">
                        <div class="col-md-12">
                           <h1>등록정보로 찾기</h1>
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="name" type="text" name="user_name"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="phone" type="text" name="phone">                          
                        </div>
                        <div class="col-sm-9">
			           		 <ul>
				               <li class="d_none" style="padding-left:0px !important; margin:1px;">
				                 <input type="button" id="findPassword" value="비밀번호 찾기">
				                </li>
		                	</ul>
	       		   	    </div>
                        <div class="col-md-12">
                           <input type="button" style="border:none;" id="findAction" class="send_btn" value="아이디 찾기">
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
       </div>
	</div>
	
	<%@include file="/WEB-INF/jsp/hwang/hwang-footer.jsp"%>
	 
	<script type="text/javascript">
		$(document).ready(function(){
			
		  //비밀번호 찾기 화면
		   $("#findPassword").click(function(){
			   location.href="/hwang/user/findView.dcp?findkey=password";
		   });
		  
		  //아이디 찾기 액션
		   $("#findAction").click(function(){
			   var formData = $("#FindForm").serialize(); 
			   
			   $.ajax({
		    		type:"POST",
		    		url : "/hwang/user/idFindkAction.dcp",
		    		data:formData,
		    		dataType:"json",
		    		success : function(res){
		    			var response = JSON.parse(res);  //json 문자열을 javaScript 객체로 변환 
		    			var msg = response.msg;
		    			
		    			if(msg == "noFind"){
		    				swal( "", "일치하는 정보가 없습니다. 다시 시도해주세요." , "warning");
							return;
		    			}else if(msg == "Find"){
		    				swal( "", "회원님의 아이디는 " + response.ID + " 입니다." , "success");
							return;
		    			}else{
			    			alert("실패");
		    			}
		    		},
		    		error: function(request, status, error){
		    			alert("실패 ");
		    		}
		    	})
		   });
		});
		
	</script>





