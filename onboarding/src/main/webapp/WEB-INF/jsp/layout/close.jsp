<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
		<title>DC-ONBOARDING</title>
	</head>
	<body>
		<script> 
		var message = '<c:out value="${msg}"/>'; 
		var url = '<c:out value="${url}"/>'; 
		
		if (message != null && message != "") {
			alert(message);	
		}
		
		if (opener != null) {
			if (url != '') {
				opener.location.href = url;
			} else {
				opener.location.reload();
			}
			self.close();
		} 
		</script>
	</body>
</html>
