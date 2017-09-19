<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/util.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	
	//로그인 뷰로 이동
	$("#herderLogin").click(function(e){ 
		document.location.href = 'login.html';
	});
	
	//메인으로 이동
	$("#btnMain").click(function(e){ 
		document.location.href = 'main.html';
	});
	
	//소주 카테고리로 이동
	$("#btnSoju").click(function(e){ 
		document.location.href = 'soju.html';
	});
	
	//맥주 카테고리로 이동
	$("#btnBeer").click(function(e){ 
		document.location.href = 'beer';
	});
});
</script>

<!-- 헤더영역 -->
<div id="header" style="">
	
	<!-- 제목영역 -->
	<div id="header-title" align="center">
		<span>
			대문,타이틀영역
		</span>
	</div>
	
	<div>
		<input type="button" id="herderLogin" name="herderLogin" value="로그인">
	</div>
	
	<!-- 탭매뉴(카테고리)영역 -->
	<div id="tab-menu">
		<div align="center">
			<input type="button" class="tab-button nav" id="btnMain" value="메인">
			<input type="button" class="tab-button nav" id="btnSoju" value="소주">
			<input type="button" class="tab-button nav" id="btnBeer" value="맥주">
			<input type="button" class="tab-button nav" id="" value="카테고리1">
		</div>
	</div>
</div>