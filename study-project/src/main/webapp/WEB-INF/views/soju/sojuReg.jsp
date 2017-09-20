<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/util.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <jsp:include page="../include/header.jsp" /> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소주에 대한 모든것!</title>
</head>
<body>
	<div>
		<form action="form0" name="form0" method="post">
			<div>
				<div style="margin: 0px auto;">
					
					<!-- 타이틀 영역 -->
					<div>
						<h2 class="title-main" align="center">
							소주 등록
						</h2>
					</div>
					
					<!-- 입력 양식 영역 -->
					<div>
						<div>
							<p>상품이름 및 소제목</p>
							<input type="text" name="title">
						</div>
						<div>
							<p>상품 소개</p>
							<textarea name="content" rows="" cols=""></textarea>
						</div>
						<div>
							<p>상품 가격</p>
							<input type="text" name="price">
						</div>
						<div>
							<p>생산지</p>
							<input type="text" name="area">
						</div>
						<div>
							<p>유튜브광고 URL</p>
							<input type="text" name="ad">
						</div>
						<div>
							<p>유통회사</p>
							<input type="text" name="company">
						</div>
					</div>
					
					<!-- 입력 버튼영역 -->
					<div>
						<div class="control-container">
							<input type="button" class="control-button" id="btnInsert" value="등록">
							<input type="button" class="control-button" id="btnCancel" value="취소">
						</div>
					</div>
					
					
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#btnCancel').click(function() { //취소버튼
			window.close();
		});
		
		$('#btnInsert').click(function() { //입력버튼
			insertCheck();
		});
		
		function insertCheck() {
			var title = $("input[name=title]").val(); //필수
			var content = $("textarea[name=content]").val(); //필수
			
			var price = $("input[name=price]").val(); //필수
			var area = $("input[name=area]").val(); //필수
			var ad = $("input[name=ad]").val();
			var company = $("input[name=company]").val(); //필수
			
			if (title == null || title.trim().length == 0) {
				alert("상품이름 및 소제목을 입력해주세요.");
				$("input[name=title]"),focus();
				return;
			} else if (content == null || content.trim().length == 0) {
				alert("상품 소개를 입력해 주세요.");
				$("textarea[name=content]"),focus();
				return;
			} else if (price == null || price.trim().length == 0) {
				alert("상품 가격을 입력해 주세요.");
				$("input[name=price]"),focus();
				return;
			} else if (area == null || area.trim().length == 0) {
				alert("생산지를 입력해 주세요.");
				$("input[name=area]"),focus();
				return;
			} else if (company == null || company.trim().length == 0) {
				alert("유통회사명을 입력해 주세요.");
				$("input[name=company]"),focus();
				return;
			} else {
				form0.target = opener.name;
				document.form0.action = '/web/soju/board';
				document.form0.submit();
				alert("등록이 완료 되었습니다");
				window.close();
			}
			
		};
	});
	</script>
</body>
</html>