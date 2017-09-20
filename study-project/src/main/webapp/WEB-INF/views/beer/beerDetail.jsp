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
<%-- <form:form method="PATCH" action="board/${beer.idx}"> --%>
<!-- <input type="submit" value="수정" onclick="updatePopup();"/> -->
<%-- </form:form> --%>
<form:form name="form1" method="DELETE" action="board/${beer.idx}">
<input  type="button" value="삭제" onclick="del();"/>
</form:form>

</div>
<script type="text/javascript">
function del(){
	var answer=confirm("삭제하시겠습니까?");
    if(answer){
    	document.form1.method = 'DELETE';
//         var url = 'board/${beer.idx}';
//             window.open(url, "_self",  '');
            document.form1.submit();
	}else{
		return;
	}
}
function updatePopup() {
    window.open("${beer.idx}", "update",
            "width = 450, height = 500, resizable = no, scrollbars = no, status = no");
}
</script>
</body>
</html>