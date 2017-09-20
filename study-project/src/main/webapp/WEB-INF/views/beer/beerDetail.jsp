<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/util.jsp" %> 
<%@ include file="../include/header.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지</title>
</head>
<body>
<div>
<fieldset>
<span>이미지</span>
<span>${beer.title }</span>
<span>${beer.content}</span>
<span>${beer.price }</span>
</fieldset>
</div>
<div>
<form name="form0" method="post">
<input type="hidden" name="_method" value="get" id="method"/>
<input type="button" value="목록" onclick="location.href='/web/beer'"/>
<input id="edit" type="button" value="수정" onclick="updatePopup();"/>
<input id="del" type="button" value="삭제"/>
</form>
</div>
<script type="text/javascript">
function updatePopup() {
	window.name = "/web/beer/${beer.idx}";
    window.open("/web/beer/board/${beer.idx}", "update",
            "width = 450, height = 500, resizable = no, scrollbars = no, status = no");
}
$('#del').click(function() {
	var answer=confirm("삭제하시겠습니까?");
	if (answer == true) {
		$('#method').val('delete');
		document.form0.action = '${beer.idx}';
		document.form0.submit();
	} else {
		return;
	 }
 });
</script>
</body>
</html>