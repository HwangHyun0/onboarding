<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link rel="stylesheet" type="text/css" href="/res/css/hwang-css/hwang-common.css">
 
	<title>HWANG회원가입</title>
	
	<%@include file="/WEB-INF/jsp/hwang/hwang-header.jsp"%>
	
	<div id="contents">
		<form id="joinform" class="main_form"  method="POST" >
	         <div class="container" style="max-">
	            <div class="row">
	               <div class=" col-md-12 ">
	                     <div class="row">
                           <div class="col-md-3 no_mo">
	                           <div>
	                              <h1>아이디</h1>
	                           </div>
	                        </div>
	                        <div class="col-md-9">
	                           <span id="IDText" style="color:red;"></span>  
	                           <input class="contactus" placeholder="첫 글자 영문 및 글자수(4 ~ 10)" type="text" name="user_id" id="user_id" onkeyup="chkChar(this);" maxlength="10"> 
	                        </div>
	                        <div class="col-md-3 no_mo">
	                           <div>
	                              <h1>성 명</h1>
	                           </div>
	                        </div>
	                        <div class="col-md-9">
	                           <span id="nameText" style="color:red;"></span>  
	                           <input class="contactus" placeholder="한글 및 영문" type="text"  name="user_name" id="user_name"   onkeyup="chkKorean(this);">     
	                        </div>
	                        <div class="col-md-3 no_mo">
	                           <div>
	                              <h1>비밀번호</h1>
	                           </div>
	                        </div>
	                        <div class="col-md-9">
	                           <span id="passwordText" style="color:red;"> </span>  
	                           <input class="contactus" placeholder="4자이상 및 영문,숫자,특수문자 2가지 이상 혼합" type="password" name="password" id="password">          
	                        </div>
	                        <div class="col-md-3 no_mo">
	                           <div>
	                              <h1>비밀번호 확인</h1>
	                           </div>
	                        </div>
	                        <div class="col-md-9">
	                           <span id="pwCheckText" style="color:red;"> </span>  
	                           <input class="contactus" placeholder="순서 상관없이 일치" type="password" name="password_check" id="password_check"  > 
	                        </div>
	                        <div class="col-md-3 no_mo">
	                           <div>
	                              <h1>연락처</h1>
	                           </div>
	                        </div>
	                        <div class="col-md-9">
	                           <span id="phoneText" style="color:red;"> </span>  
	                           <input class="contactus" placeholder="10자 이상" type="text" name="phone" id="phone" onkeyup ="chkNum(this);"> 
	                        </div>
	                        <div class="col-md-12">
	                           <input type="button"  style="border:none;" id="joinAction" class="send_btn" value="JOIN">
	                        </div>
	                     </div>
	               </div>
	            </div>
	         </div>
		</form>
	</div>
	<%@include file="/WEB-INF/jsp/hwang/hwang-footer.jsp"%>

	<script type="text/javascript">
	$(document).ready(function(){
			
		   $("#cencel").click( function(){
			   location.href = "/hwang/main.dcp";
		   });
		   
		   $("#joinAction").click( function(){
				
			   var id = $("#user_id").val();
			   var name = $("#user_name").val();
			   var pw = $("#password").val();
			   var pwChk = $("#password_check").val();
			   var phone = $("#phone").val();
			   
			   
				  if( id == null || id == "" || id.length < 4){
					  $("#IDText").text("4자리 이상 입력해주세요");
					  return false;
				  }else{
					  $("#IDText").text("");
				  }
				  
				  if( name == null || name == "" ){
					  $("#nameText").text("이름을 입력해주세요");
					  return false;
				  }else{
					  $("#nameText").text("");
				  }
				  
				  if( pw == null || pw == "" ){
					  $("#passwordText").text("비밀번호를 입력해주세요");
					  return false;
				  }else {
					  
					     var num = pw.search(/[0-9]/g);
			  			 var eng = pw.search(/[a-z]/ig);
			  			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
						
			  			if (pw.length < 4 ){
			  				 $("#passwordText").text("비밀번호를 4글자 이상 입력해주세요");
			  			     return false;
			  			  
			  			 } else if(pw.search(/\s/) != -1){
			  				 $("#passwordText").text("비밀번호를 영문포함하여 입력해주세요");
				  			 return false;
			  			  
			  			 } else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			  				 $("#passwordText").text("비밀번호를 두가지 이상 혼합해주세요.");
				  			 return false;
				  			 
			  			 } else if( pw != pwChk ){
			  				 $("#pwCheckText").text("비밀번호를 일치해주세요.");
				  			 return false;
			  			 } else{
			  				 $("#passwordText").text("");
			  				 $("#pwCheckText").text("");
			  			 }
				  }
				  
				  if( phone == null || phone == "" || phone.length < 10){
					  $("#phoneText").text("연락처를 입력해주세요");
					  return false;
				  }else{
					  $("#phoneText").text("");
				  }
			
		    	saveAction(); 
		   });
		   
	});
		   
		   function saveAction(){
			   
			   if(confirm("가입 하시겠습니까?")){
				   
				   var formData = $("#joinform").serialize(); 
				   
				   $.ajax({
						url:"/hwang/user/joinAction.dcp",
						type:"post",
						data:formData,
						success: function(result){
							if(result == 'fail'){
								  swal( "", "아이디가 중복되었습니다. 다시 시도해주세요." , "warning");
								  return;
							} else {
								 swal( "", "가입되었습니다. 로그인페이지로 이동합니다." , "success").then(function(){
									  location.href = "/hwang/user/loginView.dcp";
								  });
							}
						},
						error: function(){
							alert("실패 ");
						}
					});
					
			   } else {
					return false;
			   }
			   
			   /* swal( "", "정상가입되었습니다." , "success"); */
			  /*  $("#joinform").submit(); */
		   }
		
		
		/* 비밀번호 유효성  */
		$("#password").change(function(){
			var pw = $("#password").val();
			
  			 var num = pw.search(/[0-9]/g);
  			 var eng = pw.search(/[a-z]/ig);
  			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
  			if (pw.length < 4 ){
  			  $("#passwordText").text("4자리 이상 입력해주세요.");
  			  return false;
  			  
  			 } else if(pw.search(/\s/) != -1){
  			  $("#passwordText").text("비밀번호는 공백 없이 입력해주세요.");
  			  return false;
  			  
  			 } else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
  			  $("#passwordText").text("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
  			  return false;
  			  
  			 } else {
  				$("#passwordText").text("");
  			 }
		});
		
		
		$("#password_check").change(function(){
			var pw = $("#password").val();
			var pw_chk = $("#password_check").val();
			
			if( pw == pw_chk ){
			  $("#pwCheckText").text("");
			}else {
			  $("#pwCheckText").text("비밀번호가 일지하지 않습니다.");
			}
			
		});

	     function chkChar(obj){
	    	 var RegExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
	    	    if (RegExp.test(obj.value)) {
	    	      obj.value = obj.value.replace(RegExp , '');
    	     }
	    	this.value = odj.value;
    	 }
	     
	     function chkKorean(obj){   
	    	 var RegExp = /[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;   
	    	    if (RegExp.test(obj.value)) {
	    	      obj.value = obj.value.replace(RegExp , '');
    	     }
	    	this.value = odj.value;
    	 }
	     
	     function chkNum(obj){
	    	 var RegExp = /[^0-9]/gi;
	    	    if (RegExp.test(obj.value)) {
	    	      obj.value = obj.value.replace(RegExp , '');
    	     }
	    	this.value = odj.value;
    	 }
	     
	     //아이디 중복 체크   
     	$("#user_id").change(function(){
	    	 
	    	var id = $("#user_id").val();
	    	
	    	if (id === undefined || id.trim() === "" || id.length < 4) {
	    		$("#IDText").css("color" , "red");
	    		$("#IDText").text("");
    	        return false;
    	    }
	    	 
	    	$.ajax({
	    		type:"POST",
	    		url : "/hwang/user/idcheckAction.dcp",
	    		async : true,
	    		dataType :"json",
	    		data: {	
	    			id : id 
    			},
	    		success : function(result){
	    			if( result > 0 ){
	    				$("#IDText").css("color" , "red");
						$("#IDText").text("중복된 아이디입니다.");
	    				$("#user_id").val("");
	    			}else{
	    				$("#IDText").css("color" , "green");
	    				$("#IDText").text("사용가능한 아이디입니다.");
	    			}
	    		},
	    		error: function(request, status, error){
	    			alert("실패 ");
	    		}
	    	})
	    	 
	     });
		
		
	</script>

	