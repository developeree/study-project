<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/util.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../include/header.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
</head>
<body>
	<div>
		<div>
			<!-- 타이틀 영역 -->
			<h2 align="center">상세보기</h2>

			<!-- 컨테이너 영역 -->
			
				<div>
					<div>
						<p>대표이미지</p>
						<span>
							<img src="/thumbnail/${soju.thumbnail}" style="width: 350px; height: 350px;">
						</span>
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
					<div>
						<p>이미지</p>
						<c:forEach var="file" items="${sojuFile}" varStatus="status">
							<p>
								<img alt="${file.original_name}" src="/productImage/${file.trans_name}" style="width: 200px; height: 200px;">
							</p>
						</c:forEach>
					</div>
				</div>
			
			
			<!-- 상품평 영역 -->
			
			<div>
				<span>상품평 ${sojuCommentCount} 개</span>
				<span class="like" style="cursor:pointer;"><img style="width: 20px; height: 20px;" src="<c:url value='/resources/images/heart.jpg'/>"></img> 좋아요 </span>
				<span class="noLike" style="cursor:pointer; display: none;"><img style="width: 20px; height: 20px;" src="<c:url value='/resources/images/heart2.jpg'/>"></img> 좋아요 </span>
				<!-- 상품평 목록 -->
				<c:forEach var="comment" items="${sojuCommentList}" varStatus="status">
					<div class="more" style="display:none;border: solid 1px #777777;" idx="${comment.idx}">

						<div align="left" id="contents${comment.idx}">
							<span>${comment.id}</span> 
							<span style="font-size: small; color: #aaaaaa;">${comment.created_date}</span>

							<!-- 상품평 버튼영역 -->
							<div align="right" id="commentBtn">
								<c:if test="${loginUserCheck == comment.id}">
									<input type="button" id="btnCommentDelete" name="btnCommentDelete" value="삭제" onclick="deleteComment(${comment.idx})">
									<input type="button" id="btnCommentModify" name="btnCommentModify" value="수정" onclick="modifyComment(${comment.idx})">
								</c:if>
							</div>
							<span>${comment.contents}</span>
						</div>
						<br />
						
						
						<div style="display: none" id="contentArea${comment.idx}">
							<!-- 수정 텍스트에리어 영역 -->
							<div id="area"></div>
							<div id="modify_button" align="right">
								
								<!-- 수정을 눌렀을때 나오는 버튼 -->
								<input type="button" id="btnCommentModifyCancel" name="btnCommentModifyCancel" value="취소" onclick="modifyCancel(${comment.idx},this)"> 
								<input type="button" id="btnCommentModifyGo" name="btnCommentModifyGo" value="수정" onclick="modifyGo(${comment.idx})">
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<!-- 더보기 -->
			<div align="center" class="moreDiv">
				<input type="button" id="btnMore" name="btnMore" value="더보기" style="width: 1350px;">
			</div>
			
			<!-- 상품평 작성 -->
			<form id="form0" name="form0" action="form0" method="post">
			<div>
				<textarea id="contents" name="contents" style="margin-top: 10px; border: solid 1px #777777; resize: none; line-height: 30px; width: 90%; overflow-y: hidden; height: 30px; border: 1px solid #ccc;"rows="" cols=""></textarea>
				<input type="button" id="btnComment" name="btnComment" value="작성하기">
			</div>
			<input type="hidden" id="method" name="_method">
			</form>
			
			<!-- 상품평 수정TEXT AREA -->
			<form name="form2" method="post">
				<div id="edit_add" style="display: none;">
					<textarea id="edit_contents${comment.idx}" name="edit_contents" style="width: 293px; height: 71px;">${comment.contents}</textarea>
					<input type="hidden" id="edit" name="edit" value="">
				</div>
			</form>
			

			<!-- 버튼 영역 -->
			<div class="control-container">
				<input type="button" class="control-button" id="btnDelete" value="삭제"> 
				<input type="button" class="control-button" id="btnModify" value="수정"> 
				<input type="button" class="control-button" id="btnCancel" value="취소">
			</div>
		</div>

		<!-- 히든 영역 -->
		<div>
			<input type="hidden" id="h_idx" name="h_idx" value="${soju.idx}">
		</div>
	</div>


<script type="text/javascript">
var clickCheck = 0;
var maxMore = 3;
var status = $(".more").length;
var i = 0;
for (i=0;i<maxMore;i++){
	$(".more").eq(i).show();
}


//상품평 수정 진행
function modifyGo (commentidx) {
	var answer = confirm("수정하시겠습니까??");
	if (answer == true) {	//확인
		var h_edit = $('#edit_contents').val();
		$("input[name=edit]").val(h_edit);
		document.form2.action = '/web/soju/board/' + ${soju.idx} + '/comment/' + commentidx + '/modify/';
		document.form2.submit();
	} else {
		return;
	}
}

//상품평 수정을 취소
function modifyCancel (commentidx, obj) {
	var commentModify = "#contents"+commentidx;
	var commentModifyArea = "#contentArea"+commentidx;
	var edit_remove = 'contentArea'+commentidx;
	var test = "contentArea"+commentidx;
	
	history.go(0);
// 	document.getElementById(test).removeChild(obj.parentNode);
// 	$(commentModifyArea).hide();
// 	$(edit_remove).hide();
// 	$(commentModify).show();
}

//상품평 수정창 영역 동적 할당
function modifyComment (commentidx,e) {
	var commentModify = "#contents"+commentidx;
	var commentModifyArea = "#contentArea"+commentidx;
	var edit_add = 'contentArea'+commentidx;
	var div = document.createElement('div');
	
	if (clickCheck < 1){
		div.innerHTML = document.getElementById('edit_add').innerHTML;
	    document.getElementById(edit_add).appendChild(div);
	    
		$(commentModifyArea).show();
		$(commentModify).hide();
		clickCheck = 1;
	}
};

//상품평 삭제
function deleteComment (commentidx) {
	var answer = confirm("정말 삭제하시겠습니까??");
	if (answer == true) {	//확인
		document.form2.action = '/web/soju/board/' + ${soju.idx} + '/comment/' + commentidx;
		document.form2.submit();
	} else {
		return;
	}
};

$(document).ready(function() {
	
	//좋아요를 눌렀을 때
	$('.like').click(function() {
		$('.like').hide();
		$('.noLike').show();
		
		var url="/web/soju/like.ajax";
		var likeStatus = 1;
		var idx = ${soju.idx};
	    var data="likeStatus="+likeStatus; 
		
		$.ajax({
		     type: "POST",
		     url: url,
		     data:  {"idx":idx, "likeStatus":likeStatus},
		});
	});
	
	//좋아요를 해제했을 때
	$('.noLike').click(function() {
		$('.noLike').hide();
		$('.like').show();
		
		var url="/web/soju/like.ajax";
		var idx = ${soju.idx};
	    var data="likeStatus="+likeStatus; 
		
		$.ajax({
		     type: "POST",
		     url: url,
		     data:  {"idx":idx},
		});
	});
	
	//더보기 버튼
	$('#btnMore').click(function() {
		maxMore = maxMore * 2;
		for (;i<maxMore;i++){
			$(".more").eq(i).show();
			if (i >= status) {
				$(".moreDiv").hide();
			}
		}
	});
	
	//상품평 작성
	$('#btnComment').click(function() {
		document.form0.action = '/web/soju/board/' + ${soju.idx} + '/comment/';
		document.form0.submit();
	});
	
	//취소버튼
	$('#btnCancel').click(function() {
		history.back();
	});
	
	//삭제버튼
	$('#btnDelete').click(function() {
		var answer = confirm("정말 삭제하시겠습니까??");
		if (answer == true){    //확인
			var hiddenDelete = "DELETE";
// 			document.getElementById('#method').value = hiddenDelete;
			$('#method').val(hiddenDelete);
			document.form0.action = '/web/soju/board/' + ${soju.idx};
		    document.form0.submit();
		}else{   //취소
		    return;
		}
	});
	
	//수정버튼
	$('#btnModify').click(function() {
		$('#method').val('get');
		var idx = $('#h_idx').val();
		window.name = "/soju/board/" + ${soju.idx};
		window.open("/web/soju/board/"+idx,"modify","width=1000px,height=700px");
	});

});
</script>
</body>
</html>