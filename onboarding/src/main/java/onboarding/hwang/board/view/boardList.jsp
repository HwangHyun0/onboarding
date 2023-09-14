<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/res/css/hwang-css/hwang-common.css">

<title>Hwang게시판</title>

<style>
table > thead {
	background-color:2980b9;
	color:white;
	line-height: 35px;
}
table > tbody {
	text-align:center;
	background-color:#e9e9e9;
	font-size: 15px;
    line-height: 30px;
}

</style>

	<%@include file="/WEB-INF/jsp/hwang/hwang-header.jsp"%>

	<div id ="contents" style="width:1500px;margin:150px auto;">
			<div style="width:100%; ">
				<table id="table" style="width:100%">
					<colgroup>
					 	<col width="10%" />
					 	<col width="45%" />
					 	<col width="15%" />
					 	<col width="10%" />
						<col width="*" />
					</colgroup>
					 <thead>
						<tr>
							<th>구분</th>
							<th>제목</th>
							<th>등록일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					
					<c:if test="${!empty boardVo.boardList}">
						<c:forEach items="${boardVo.boardList}" var="list">	
							<tr>
								<td>${list.id}</td>
								<td>${list.title}</td>
								<td>${list.reg_date}</td>
								<td>${list.user_id}</td>
								<td></td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
		    <div class="col-md-12">
              <input type="button" style="border:none;" id="boardWirte" class="send_btn" value="글쓰기">
            </div>
	</div>


	<%@include file="/WEB-INF/jsp/hwang/hwang-footer.jsp"%>


	<script>
	 $(document).ready(function(){
		   // 게시판 등록 화면
		   $("#boardWirte").click(function(){
			   location.href="/hwang/board/boardWrite.dcp";
		   });
	 });
	</script>
	
	
	
	
	
	
	
	
	
	
	
	