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
					<p>대표이미지</p>
					<span><img src="/thumbnail/${soju.thumbnail}"></span>
				</div>
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
				<input type="button" class="control-button" id="btnModify" value="수정">
				<input type="button" class="control-button" id="btnCancel" value="취소">
			</div>
			
			<!-- 히든 영역 -->
			<div>
				<input type="hidden" id="h_idx" name="h_idx" value="${soju.idx}">
				<input type="hidden" id="method" name="_method" value="DELETE">
			</div>
		</form>
	</div>
	
<script type="text/javascript">
$(document).ready(function() {
	$('#btnCancel').click(function() {			//취소버튼
		history.back();
	});
	
	$('#btnDelete').click(function() { 			//삭제버튼
		var answer = confirm("정말 삭제하시겠습니까??");
		if (answer == true){    //확인
				document.form0.action = '/web/soju/board/' + ${soju.idx};
			    document.form0.submit();
		}else{   //취소
		    return;
		}
	});
	
	$('#btnModify').click(function() { 			//수정버튼
		$('#method').val('get');
		var idx = $('#h_idx').val();
		window.name = "/soju/board/" + ${soju.idx};
		window.open("/web/soju/board/"+idx,"modify","width=1000px,height=700px");
		/* document.form0.action = '/web/soju/board/' + ${soju.idx};
		document.form0.submit(); */
	});
});
</script>
</body>
</html>