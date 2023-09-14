<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
		<title>DC-ONBOARDING</title>
		
		<link rel="stylesheet" type="text/css" href="/res/js/ui/1.11.4/jquery-ui.css"  />
		<script type="text/javascript" src="/res/js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="/res/js/sweetalert/11.1.2/dist/sweetalert2.min.js"></script>
		<script type="text/javascript" src="/res/js/dc/1.0.0/dc.js"></script>
		<script type="text/javascript" src="/res/js/dc/1.0.0/dc_regex.js"></script>
		<script type="text/javascript" src="/res/js/dc_alert.js"></script>
		<script type="text/javascript" src="/res/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="/res/js/form/3.51.0/form.js"></script> 
		<script type="text/javascript" src="/res/js/slick/1.5.7/slick.js"></script>
		<script type="text/javascript" src="/res/js/ui/1.11.4/jquery-ui.js"></script>
		<script type="text/javascript" src="/res/js/datepicker_kr.js"></script>
		
	</head>
	<body>
		<!-- login status start -->
		<div id="login_area"></div>
		<!-- //login status end -->
		<!-- wrap start -->
		<div id="wrap">
		    <!-- header start -->
		    <div id="header"><tiles:insertAttribute name="header"/></div>
		    
		    <!-- //header end -->
		    <!--  //타이틀 이미지 끝 -->
		    <div id="bodywrap">
		        <div id="leftmenu_div"><tiles:insertAttribute name="leftmenu"/></div>
		        <div id="middle_content">
		            <tiles:insertAttribute name="content"/>
		        </div>
		    </div>
		    <!-- footer 시작 -->
		    <div id="footer"><tiles:insertAttribute name="footer"/></div>
		    <!-- //footer 끝 -->
		</div>
		<!-- //wrap end -->
		
	</body>
</html>