<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	
	<div>
		<span> msg : ${ msg } </span>
	</div>
	
	<script>
		setTimeout(function() {
			location.href =  "<c:url value="${ afterUrl }"/>";				
		}, 1000);
	</script>
 	
