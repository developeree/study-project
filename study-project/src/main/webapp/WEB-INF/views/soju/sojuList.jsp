<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../include/header.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소주에 대한 모든것!</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="wrap">
		<div id="body" style="width: 1560px; height: 1560px;">
			<div style="width: 100%; height: 10%;" align="right">
				<input type="button" class="reg-button" id="btnReg" value="등록" />
				<input type="button" class="search-button" id="btnSearch" value="검색" />
				<input type="text" class="search-input" id="searchVal" value="" />
				<select class="search-select" id="searchCol">
					<option value="">선택/초기화</option>
					<option value="title">제목</option>
				</select>
			</div><br/>
			
			<!-- 리스트 컨테이너 -->
			<div>
				<div>
					<span>
					
					</span>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">

</script>
</body>
</html>