<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link rel="stylesheet" type="text/css" href="/res/css/hwang-css/hwang-common.css">
 	
 
	<title>HWANG로그인</title>
	
	<%@include file="/WEB-INF/jsp/hwang/hwang-header.jsp"%>
	
	<div id="contents">
         <div class="container" style="max-">
            <div class="row">
               <div class=" col-md-12 ">
                  <form id="loginForm" class="main_form">
                     <div class="row">
                        <div class="col-md-12">
                           <input class="contactus" placeholder="ID" type="text" name="user_id"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="PASSWORD" type="password" name="password">                          
                        </div>
                        <div class="col-sm-9">
			           		 <ul>
				               <li class="d_none" style="padding-left:0px !important; margin:1px;">
				                 <input type="button" id="findID" value="아이디 찾기">
				                 <input type="button" id="findPassword" value="비밀번호 찾기">
				                </li>
		                	</ul>
	       		   	    </div>
                        <div class="col-md-12">
                           <input type="button" id="login"  style="border:none;" class="send_btn" value="LOGIN">
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
	</div>
	
	<%@include file="/WEB-INF/jsp/hwang/hwang-footer.jsp"%>
	 
	<script type="text/javascript">
		$(document).ready(function(){
			
		   //로그인 하기 
		   $("#login").click(function(){
			   var formData = $("#loginForm").serialize(); 
			   
			   $.ajax({
					url:"/hwang/user/loginAction.dcp",
					data:formData,
					dataType:"json",
					success : function(res){
		    			var response = JSON.parse(res);  //json 문자열을 javaScript 객체로 변환 
		    			var msg = response.msg;
		    			
		    			if(msg == "success"){
		    				swal( "", "로그인 성공! 게시판으로 이동합니다." , "success");
		    				setTimeout(function() {
		    					location.href= "" + response.url + "";				
		    				}, 1000);
							return;
		    			}else if(msg == "fail"){
		    				swal( "", "일치하는 정보가 없습니다. 다시 시도해주세요." , "warning");
							return;
		    			}else{
			    			alert("실패");
		    			}
		    		},
					error: function(){
						alert("실패 ");
					}
				});
			   
			   //$("#loginForm").attr("action","/hwang/user/loginAction.dcp").submit();
		   });
		   
		   //아이디 찾기
		   $("#findID").click(function(){
			   location.href="/hwang/user/findView.dcp?findkey=ID";
		   });
		   
		   //비밀번호 찾기
		   $("#findPassword").click(function(){
			   location.href="/hwang/user/findView.dcp?findkey=password";
		   });
		});
		
	</script>





