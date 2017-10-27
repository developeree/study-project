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
		<form action="form0" name="form0" method="post" enctype="multipart/form-data">
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
							<input type="text" name="title" value="${soju.title}">
						</div>
						<div>
							<p>상품 소개</p>
							<textarea name="content" rows="" cols="">${soju.content}</textarea>
						</div>
						<div>
							<p>상품 가격</p>
							<input type="text" name="price" value="${soju.price}">
						</div>
						<div>
							<p>생산지</p>
							<input type="text" name="area" value="${soju.area}">
						</div>
						<div>
							<p>유튜브광고 URL</p>
							<input type="text" name="ad" value="${soju.ad}">
						</div>
						<div>
							<p>유통회사</p>
							<input type="text" name="company" value="${soju.company}">
						</div>
						<div>
							<p>썸네일(목록이미지)</p>
							<input type="file" name="file">
						</div>
						<div style="width: 500px; height: 500px;">
							<p style="font-size: small;">상품소개이미지(다중)</p>
							<p style="font-size: x-small;">아래 영역을 클릭 하시거나</p>
							<p style="font-size: x-small;">드래그 해서 파일을 넣으세요.</p>
							<!-- <input class="file" type="file" id="file1" name="file1" multiple style="width: 300px; height: 300px; display: none;" value="dropZone" accept="jpg,jpeg,png,bmf">
							<div class="filediv" style="border: 1px solid #111111; width: 300px; height: 300px;" onclick="check()">클릭해서 파일을 추가해주세요(여러개 선택가능)</div>
							<br/><br/> -->
							<div style="border: 1px solid #888888; width: 250px; height: 150px; margin-left: -7px;">
								<input type="file" id="file" name="file" onchange="imagesSelected(this.files)" style="width: 250px; height: 150px; margin-left: -80px;" multiple accept="jpg,jpeg,png,bmf">
							</div>
							<div style="border: 1px solid #888888; margin-left: -7px;">
								<p style="border-bottom: 1px solid #888888;">파일미리보기</p>
								<span id="thumbs" ></span> 
							</div>
							
						</div>
					</div>
					

					<!-- 입력 버튼영역 -->
					<div>
						<div class="control-container">
							<c:if test="${soju.idx == null}">
							<input type="button" class="control-button" id="btnInsert" value="등록">
							</c:if>
							<c:if test="${soju.idx != null}">
							<input type="button" class="control-button" id="btnModify" value="수정">
							</c:if>
							<input type="button" class="control-button" id="btnCancel" value="취소">
						</div>
					</div>
					
					<!-- 히든 영역 -->
					<div>
						<c:if test="${soju.idx != null }">
						<input type="hidden" id="method" name="_method" value="PATCH">
						</c:if>
						<input type="hidden" id="h_idx" name="h_idx" value="${soju.idx}">
					</div>
					
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	function imagesSelected(myFiles) {
		  for (var i = 0, f; f = myFiles[i]; i++) {
		    var imageReader = new FileReader();
		    imageReader.onload = (function(aFile) {
		      return function(e) {
		        var span = document.createElement('span');
		        var files=aFile.name;
		        span.innerHTML = ['<img id="images" style="width: 100px; height: 100px;" src="', e.target.result,'"alt="', aFile.name, '"/>'].join('');
		        document.getElementById('thumbs').insertBefore(span, null);
//	 	        $('#input').attr('name',files);
//		        내가 추가한부분
		        $("img").click(function(){
		  		  alert("삭제염");
		  		document.getElementById("images").remove();
		  		 });
//		        여기까지
		      };
		    })(f);
		    imageReader.readAsDataURL(f);
		  }
		}
	
	function eventOccur(evEle,evType,e) {
		if (evEle.fireEvent) {
			evEle.fireEvent('on' + evType);
		} else {
			var mouseEvent = document.createEvent("MouseEvents");
			mouseEvent.initEvent(evType,true,false);
			var transCheck = evEle.dispatchEvent(mouseEvent);
			if (!transCheck) {
				//이벤트 실패시
				console.log("클릭이 실패");
			}
		}
		e.preventDefault();
	}
	
	function check(e) {
		eventOccur(document.getElementById('file1'),'click',e);
	}
	
	function setDnDhandler(obj) {
        obj.addEventListener("dragover", function(event) {
            event.preventDefault();
        }, true);
        obj.addEventListener("drop", function(event) {
            event.preventDefault();
            var allTheFiles = event.dataTransfer.files;
            for (var i=0; i<allTheFiles.length; i++) {
                var element = document.createElement('div');
                element.id = 'f' + i;
                document.body.appendChild(element);
                sendFile(allTheFiles[i], element.id);
            }
        }, true);
    }
	
	$(document).ready(function() {
		$('#btnCancel').click(function() { //취소버튼
			window.close();
		});
		$('#btnInsert').click(function() { //입력버튼
			insertCheck();
		});
		$('#btnModify').click(function() { //수정버튼
			updateCheck();
		});
		
		
		function insertCheck(obj) {
			var title = $("input[name=title]").val(); //필수
			var content = $("textarea[name=content]").val(); //필수
			var price = $("input[name=price]").val(); //필수
			var area = $("input[name=area]").val(); //필수
			var ad = $("input[name=ad]").val();
			var company = $("input[name=company]").val(); //필수
// 			var dropzone = document.getElementById('file1');
			
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
// 				dropzone.addEventListener("dragover", function(event) {
// 		            event.preventDefault();
// 		        }, true);
// 		        dropzone.addEventListener("drop", function(event) {
// 		            event.preventDefault();
// 		            var allTheFiles = event.dataTransfer.files;
// 		            for (var i=0; i<allTheFiles.length; i++) {
// 		                var element = document.createElement('div');
// 		                element.id = 'f' + i;
// 		                document.body.appendChild(element);
// 		                sendFile(allTheFiles[i], element.id);
// 		            }
// 		        }, true);
				form0.target = opener.name;
				document.form0.action = '/web/soju/board';
				document.form0.submit();
				alert("등록이 완료 되었습니다");
				window.close();
				
			}
		};
		function updateCheck() {
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
				$('#method').val('patch');
				var idx = $('#h_idx').val();
				document.form0.target = opener.name;
				document.form0.action = '/web/soju/board/'+idx;
				document.form0.submit();
				alert("수정이 완료 되었습니다");
				window.close();
			}
		};
	});
	</script>
</body>
</html>