<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link rel="stylesheet" type="text/css" href="/res/css/hwang-css/hwang-common.css">
 	
 
	<title>HWANG아이디찾기</title>
	
	<%@include file="/WEB-INF/jsp/hwang/hwang-header.jsp"%>
	
	<div id="contents">
				
      <div class="contact"  style="margin:0 auto !important; max-width:690px;">
         <div class="container" style="max-">
            <div class="row">
               <div class=" col-md-12 ">
                  <form id="loginForm" class="main_form">
                     <div class="row">
                        <div class="col-md-12">
                           <h1>임시 비밀번호 발급받기</h1>
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="ID" type="text" name="user_id"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="email@example.com" type="password" name="password">                          
                        </div>
                        <div class="col-sm-9">
			           		 <ul>
				               <li class="d_none" style="padding-left:0px !important; margin:1px;">
				                 <input type="button" id="findID" value="아이디 찾기">
				                </li>
		                	</ul>
	       		   	    </div>
                        <div class="col-md-12">
                           <input type="button" id="login" style="border:none;" class="send_btn" value="비밀번호 찾기">
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
			   
		   //아이디 찾기
		   $("#findID").click(function(){
			   location.href="/hwang/user/findView.dcp?findkey=ID";
		   });
			   
		});
		
	</script>





