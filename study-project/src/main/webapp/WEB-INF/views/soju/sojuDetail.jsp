<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/util.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../include/header.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
</head>
<body>
	<div>
		<form action="form0" name="form0" method="post">
			<!-- 타이틀 영역 -->
			<h2 align="center">
				상세보기
			</h2>
			
			<!-- 컨테이너 영역 -->
			<div>
				<div>
					<p>상품명</p>
					<span>${soju.title}</span>
				</div>
				<div>
					<p>가격</p>
					<span>${soju.price}</span>
				</div>
				<div>
					<p>생산지</p>
					<span>${soju.area}</span>
				</div>
				<div>
					<p>상품평갯수</p>
					<span>${soju.comment_count}</span>
				</div>
				<div>
					<p>유통회사</p>
					<span>${soju.company}</span>
				</div>
			</div>
			
			<!-- 버튼 영역 -->
			<div class="control-container">
				<input type="button" class="control-button" id="btnDelete" value="삭제">
			</div>
			
			<!-- 히든 영역 -->
			<div>
				<input type="hidden" name="_method" value="DELETE">
				<input type="hidden" name="h_idx" id="h_idx" value="${soju.idx}">
			</div>
		</form>
	</div>
	
<script type="text/javascript">
$(document).ready(function() {
	$('#btnDelete').click(function() { //삭제버튼
		var idx = $("input[name=h_idx]").val();
		var answer = confirm("정말 삭제하시겠습니까??");
		if (answer == true){    //확인
				document.form0.action = '/web/soju/board/' + idx;
			    document.form0.submit();
			}else{   //취소
			    return;
			}
	});
});
</script>
</body>
</html>