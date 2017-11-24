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
<c:if test="${sessionScope.user.idx != null }">
<input type="button" value="글쓰기" onclick="insertPopup();"/>
</c:if>
</div>
<div>
<c:forEach var="beer" items="${list}" varStatus="status">
<fieldset>
<!-- 상대경로 -->
<span><img alt="${beer.thumb}" src="files/${beer.thumb}" style="width:100px; height:100px;"/></span>
<!-- 절대경로 -->
<%-- <span><img alt="${beer.thumb}" src="/study_project_files/${beer.thumb}" style="width:100px; height:100px;"/></span> --%>
<span><a href="/web/beer/${beer.idx}">${beer.title }</a></span>
<span>${beer.price }</span>
<span>${beer.comment_count } 개의 상품평</span>
<span>${beer.company }</span>
</fieldset>
</c:forEach>
</div>
<!-- <form action="beer" method="get"> -->
<div>
<c:forEach var="i" begin="1" end="${totalBeer}" step="1" varStatus="status">
<input type="button" name="pageNo" value="${i}" id="page" onclick="paging(${status.index})"/>
<%-- <a href="/web/beer?pageNo=${i}&keyfield=${keyfield}&search=${search}" >${i}</a> --%>
</c:forEach>
</div>

<div>
<select name="keyfield" id="selectBox">
<option value="">선택</option>
<option value="title" >제목</option>
<option value="company" >제조회사</option>
<%-- <option value="title" <c:if test="keyfield==${beer.keyfield}">selected</c:if>>제목</option> --%>
<%-- <option value="company" <c:if test="keyfield==${beer.keyfield}">selected</c:if>>제조회사</option> --%>
</select>
<input type="text" name="search" value="${beer.search}"/>
<input type="button" value="검색" id="search"/>
<!-- <input type="submit" value="검색" id="search"/> -->
</div>
<!-- </form> -->

</div>
<script type="text/javascript">
function paging(status){
// 	var pageNo=status;
// 	var keyfield="${beer.keyfield}";
// 	var search="${beer.search}";
// 	document.location.href="/web/beer?pageNo="+pageNo+"&keyfield="+keyfield+"&search="+search;
	document.location.href="/web/beer?pageNo="+status+"&keyfield="+"${beer.keyfield}"+"&search="+"${beer.search}";
}
$(document).ready(function() {
	$('#search').click(function search(){
	var pageNo="1";
	var keyfield=$('select[name=keyfield]').val();
	var search=$('input[name=search]').val();
	if(keyfield==''){alert("검색어 안넣자나")};
	 document.location.href="/web/beer?pageNo="+pageNo+"&keyfield="+keyfield+"&search="+search;
});
});
$('#selectBox').val("${beer.keyfield}").prop("selected",true);
function insertPopup() {
    // window.name = "부모창 이름";            
    window.name = "/web/beer";
    // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
    window.open("/web/beer/board", "insert",
            "width = 450, height = 500, resizable = no, scrollbars = no, status = no");
}
</script>
</body>
</html>