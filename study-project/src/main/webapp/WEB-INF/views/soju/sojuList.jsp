<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/util.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../include/header.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소주에 대한 모든것!</title>
</head>
<body>
	<%-- <jsp:include page="../include/header.jsp" /> --%>
	<div id="wrap">
		<div id="body" style="width: 1560px; height: 1560px;">
			<div style="width: 100%; height: 10%;" align="right">
				<input type="button" class="reg-button" id="btnReg" value="등록" />
				<input type="button" class="search-button" id="btnSearch" value="검색" />
				<input type="text" class="search-input" id="searchVal" value="${searchVal}" />
				<select class="search-select" id="searchCol">
					<option value="">선택/초기화</option>
					<option value="title">제목</option>
					<option value="company">유통회사</option>
				</select>
			</div><br/>
			<!-- 리스트 컨테이너 -->
			<div style="border-top: 1px solid #FF8000;">
				<c:forEach var="sl" items="${sojuList}" varStatus="status">
					<div class="sojuDetail" idx="${sl.idx}" style="border-bottom: 1px solid #F7BE81;" onclick="sojuDetail(${sl.idx})">
						<span><img src="/thumbnail/${sl.thumbnail}" style="width: 50px; height: 50px;"></span>
						<span>${sl.title}</span>
						<span>${sl.price}</span>
						<span>${sl.company}</span>
					</div>
					<input type="hidden" id="idx" name="idx" value="${sl.idx}">
				</c:forEach>
			</div>
			
			<!-- 페이징 -->
			<div class="paging-container">
			<c:set var="isLoof" value="true" />
			<c:if test="${totalRecord != 0}">
				
				<!-- <<부분 -->
					<c:if test="${selectBlock > 0}">
						<span onclick="paging('${selectBlock - 1}','${((selectBlock - 1) * 10)}')" style="cursor:pointer;">
							왼쪽
							<!-- <img src="resources/images/pager/btn_first.gif"/> -->
						</span>
					</c:if>
					
					<!-- 가운데 숫자부분 -->
					<c:forEach begin="0" end="9" step="1" var="i">
						<c:if test="${isLoof}"> 
							<c:choose>
								<c:when test="${selectPage == (selectBlock * 10) + i}">
									<font class="paging-current">${(selectBlock * 10) + i + 1 }</font>
								</c:when>
								<c:otherwise>
									<span onclick="paging('${selectBlock}','${(selectBlock * 10) + i }')" style="cursor:pointer;">
										<font class="paging-clickable"> ${(selectBlock * 10) + i + 1 }</font>
									</span>
								</c:otherwise>
							</c:choose>
							<c:if test="${(selectBlock * 10) + i + 1 == totalPage}">
								<c:set var="isLoof" value="false"/> 
							</c:if>
						</c:if>
					</c:forEach>
					
					<!-- >>부분 -->
					<c:if test="${totalBlock > selectBlock}">
						<span onclick="paging('${selectBlock + 1 }','${((selectBlock + 1) * 10)}')" style="cursor:pointer;">
							오른쪽
							<!-- <img src="resources/images/pager/btn_last.gif"/> -->
						</span>
					</c:if>
				
			</c:if>
			</div>
			
		</div>
	</div>

<script type="text/javascript">

//상세페이지 이동
function sojuDetail (idx) {
	document.location.href = "/web/soju/" + idx;
}

$(function() {
	$('#btnReg').click(function() {//등록
		window.name = "/soju";
		window.open("/web/soju/board/","insert","width=1000px,height=700px");
	});
	
// 	$('.sojuDetail').click(function() {
// // 		var idx = $(this).attr('idx');
// 		var idx = $('#idx').val();
// 		document.location.href = "/web/soju/" + idx;
// 	});
	
	//검색
	$("#searchCol").val("${searchCol}").prop("selected", true);
	$('#btnSearch').click(function() {
		var pageNo = "${selectPage}";
		var blockNo = "${selectBlock}";
		
		var url = "soju.html?pageNo="+pageNo+"&blockNo="+blockNo;
		
		var searchCol = $('#searchCol').val();
		var searchVal = $('#searchVal').val().trim();
		if (searchCol == '' || searchVal == '') {
			$('#searchCol').val('');
			$('#searchVal').val('');
		} else {
			url += "&searchCol="+searchCol+"&searchVal="+searchVal;
		}
		
		document.location.href = url;
	});
	
	//페이징
	paging = function(blockNo, pageNo) {
		var url = "soju.html?pageNo="+pageNo+"&blockNo="+blockNo;
		var searchCol = $('#searchCol').val();
		var searchVal = $('#searchVal').val().trim();
		
		if (searchCol == '' || searchVal == '') {
			$('#searchCol').val('');
			$('#searchVal').val('');
		} else {
			url += "&searchCol="+searchCol+"&searchVal="+searchVal;
		}
		
		document.location.href = url;
	};
	
});
</script>
</body>
</html>