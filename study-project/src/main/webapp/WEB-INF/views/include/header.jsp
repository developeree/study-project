<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/util.jsp" %> 
<script type="text/javascript">
$(document).ready(function(){
	
	//로그인 뷰로 이동
	$("#herderLogin").click(function(e){ 
		document.location.href = '/web/user/login.html';
	});
	
	//메인으로 이동
	$("#btnMain").click(function(e){ 
		document.location.href = '/web/user/main.html';
	});
	
	//소주 카테고리로 이동
	$("#btnSoju").click(function(e){ 
		document.location.href = '/web/soju/soju.html';
	});
	
	//소주 카테고리로 이동
	$("#btnTest").click(function(e){ 
		document.location.href = '/web/soju/dragAndDrop.html';
	});
	
	$("#btnTest1").click(function(e){ 
		document.location.href = '/web/soju/test.html';
	});
	//로그아웃
	$("#herderLogout").click(function(e){ 
		document.location.href = '/web/user/logout';
	});
	
	//test
	$("#note2").click(function(e) {
		document.location.href = '/web/soju/notetest.html';
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
		<c:if test="${sessionScope.user.idx==null }">
		<input type="button" id="herderLogin" name="herderLogin" value="로그인">
		</c:if>
		<c:if test="${sessionScope.user.idx!=null }">
		<input type="button" id="herderLogout" name="herderLogout" value="로그아웃">
		</c:if>
	</div>
	
	<!-- 탭매뉴(카테고리)영역 -->
	<div id="tab-menu">
		<div align="center">
			<input type="button" class="tab-button nav" id="btnMain" value="메인">
			<input type="button" class="tab-button nav" id="btnSoju" value="소주">
			<input type="button" class="tab-button nav" id="btnBeer" value="맥주" onclick="location.href='/web/beer'" >
			<input type="button" class="tab-button nav" id="btnTest" value="테스트">
			<input type="button" class="tab-button nav" id="btnTest1" value="테스트1">
			<input type="button" class="tab-button nav" id="note2" value="테스트2">
		</div>
	</div>
</div>