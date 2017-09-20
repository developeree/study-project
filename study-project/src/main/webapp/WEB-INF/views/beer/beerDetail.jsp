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

<input type="button" value="목록" onclick="location.href='/web/beer'"/>
<input type="button" value="수정" />
<%-- <form:form method="DELETE" action="board/${beer.idx}"> --%>
<form name="form0" method="post">
<!-- <input id="dele" type="hidden" name="_method" value="DELETE"/> -->
<input id="dele" type="submit"value="삭제"/>
<input type="hidden" name="h_idx" id="h_idx" value="${beer.idx}">
<input type="hidden" name="_method" value="DELETE">
<input type="button" id="btnDelete" value="삭제추가한거" onclick="del()">
<%-- <input type="button" value="삭제" onclick="del(${beer.idx })"/> --%>
</form>
<%-- </form:form> --%>
</div>
<script type="text/javascript">
// function del(idx){
// 	window.alert("글번호는: "+idx);
// 	var answer=confirm("삭제하시겠습니까?");
//     if(answer){
//     	document.form.method = 'DELETE'
//         var url = 'board/'+idx;
//             window.open(url, "_self",  '');
// 	}
// }

function del(){
	var idx = $("input[name=h_idx]").val();
	var answer=confirm("삭제하시겠습니까?");
	if (answer == true) {
		document.form0.action = '/web/beer/board/' + idx;
		document.form0.submit();
	} else {
		return;
	}
}


</script>
</body>
</html>