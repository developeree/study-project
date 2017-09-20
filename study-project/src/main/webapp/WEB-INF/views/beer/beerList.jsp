<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/util.jsp" %> 
<%@ include file="../include/header.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/normal.css'/>" type="text/css"> --%>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.0.0.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<title>리스트 페이지</title>
</head>
<body>
<div align="center">
<div>
<input type="button" value="글쓰기" onclick="insertPopup();"/>
<!-- <input type="button" value="글쓰기" onclick="location.href='/web/beer/board'"/> -->
</div>
<div>
<c:forEach var="beer" items="${list}" varStatus="status">
<fieldset>
<span>이미지</span>
<span><a href="../web/beer/${beer.idx}">${beer.title }</a></span>
<span>${beer.price }</span>
<span>${beer.comment_count } 개의 상품평</span>
</fieldset>
</c:forEach>
</div>
</div>
<script type="text/javascript">
function insertPopup() {
    // window.name = "부모창 이름";            
    window.name = "/beer";
    // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
    window.open("beer/board", "insert",
            "width = 450, height = 500, resizable = no, scrollbars = no, status = no");
}
</script>
</body>
</html>