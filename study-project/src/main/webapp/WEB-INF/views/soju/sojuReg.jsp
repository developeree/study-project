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
						<fieldset>
							<p>다중업로드폼</p>
							<fieldset>
							<p>
							<input id="input" name="media" type="file" multiple="true" onchange="imagesSelected(this.files)"/>
							</p>
							</fieldset>
							<fieldset id="dropzone" class="dropzone" ondragstart="return false" ondragenter="return false" ondragover="return false" ondrop="dropIt(event)">
							<p>파일을 끌거나 선택해 주세요.</p>
							<p>최종 파일만 업로드되니 한번에 업로드 해주세요.</p>
							<span id="thumbs" style="display: none;">
								<img id="images" alt="" src="" style="width: 100px; height: 100px;">
								<input type="button" value="삭제(미구현)" onclick="remove_item(this)">
							</span> 
							<div id="field"></div>
						</fieldset>
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
	           $("#images").attr('src',e.target.result);
	           $("#images").attr('alt',aFile.name);
// 	           span.innerHTML = ['<img id="images" name="', aFile.name,'" style="width:100px; height:100px;" src="', e.target.result,'"alt="', aFile.name, '"/><p/><span id="filen">파일명: ', aFile.name,'<input type="button" value="삭제" onclick="remove_item(this)"></span>'].join('');
				span.innerHTML = document.getElementById('thumbs').innerHTML;
	           // 	           document.getElementById('thumbs').insertBefore(span, null);
	           document.getElementById('field').appendChild(span);

//	            내가 추가한부분
// 	           $("img").click(function(){
// 		           alert("삭제염");
// 		           document.getElementById("images").remove();
// 			       document.getElementById("filen").remove();
// 		           $('#input').val('');
// 	            });

//	            여기까지
	         };
	       })(f);
	       imageReader.readAsDataURL(f);

	     };
	   };
   function remove_item(obj){
        // obj.parentNode 를 이용하여 삭제
        var input = document.getElementById('input');
        var alt = document.getElementById("images").alt
        alert(document.getElementById("images").alt);
        
        document.getElementById("field").removeChild(obj.parentNode);
        alert(obj.parentNode);
    }

	function dropIt(e) {
	      var files=e.dataTransfer.files;
	      var input=document.getElementById('input');
	      input.files=files;

	      e.stopPropagation();  
	      e.preventDefault();
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