<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/util.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>
<div align="center" style="height:auto; width:400px; border:1px solid black; padding:10px">
	<form name="form0" method="post">
		<div>
       		<div>
<!--        		<span>썸네일<input type="file" id="fileUpload" name="mediaFile" style="width: 300px; height: 20px" maxlength="200" multiple/></span> -->
<!--        		<p/> -->
				<span>제목<input type="text" name="title" value="${beer.title }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
<%-- 				<span>상세정보<textarea cols="80" rows="10" name="content" style="width: 300px; height: 100px">${beer.content }</textarea></span> --%>
<!-- 				<p/> -->
				<span>가격<input type="text" name="price" value="${beer.price }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>생산지<input type="text" name="area" value="${beer.area }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>광고<input type="text" name="ad" value="${beer.ad }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>제조회사<input type="text" name="company" value="${beer.company }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<fieldset><div id="drop" class="drop" contentEditable="true">
				<img id="dropped"/>
				<input type="hidden" name="content" value="${beer.content }"/>
				</div></fieldset>

			</div>
			<span style="align:left"><input type="reset" value="취소" onclick="window.close()"/></span> 
			<c:if test="${beer.idx ==null}">
			<span style="align:right"><input id="new" type="button" value="등록"/></span>
			</c:if>
			<c:if test="${beer.idx !=null}">
				<input type="hidden" name="_method" value="patch" id="method">
			<span style="align:right"><input id="edit" type="button" value="수정" /></span>
			</c:if>
		</div>
	</form>
	
<!-- 	<form name="form0" action="board" method="post"> -->
<!-- 	<span>제목<input type="text" name="title" style="width: 300px; height: 20px" maxlength="200"/></span> -->
<!-- 	<p/> -->
<!-- 	<span style="align:left"><input type="reset" value="취소" onclick="window.close()"/></span> -->
<!-- 	<span style="align:right"><input id="new" type="button" value="등록" /></span> -->
<!-- 	</form> -->
</div>
<script type="text/javascript">
$(function(){
	$('#drop').on({
		'drop':function(e){
			var f=e.originalEvent.dataTransfer.files[0];
			var reader=new FileReader();
			$(reader).on('load',function(){
				$('#dropped').attr('src',reader.result);
			});
			reader.readAsDataURL(f);
			e.preventDefault();
		},
		'dragover':function(e){
			e.preventDefault();
		}
	})
});
 $('#new').click(function() {
	form0.target = opener.name;
 	document.form0.action = '/web/beer/board';
 	document.form0.submit();
 	window.close();
 });
 $('#edit').click(function() {
	 alert("${beer.idx}");
	form0.target = opener.name;
 	document.form0.action = '/web/beer/board/${beer.idx}';
 	document.form0.submit();
 	window.close();
  });
</script>
</body>
</html>