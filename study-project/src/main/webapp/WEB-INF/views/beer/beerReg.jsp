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
	<form action="board" method="post" target="/beer">
		<div>
       		<div>
<!--        		<span>썸네일<input type="file" id="fileUpload" name="mediaFile" style="width: 300px; height: 20px" maxlength="200" multiple/></span> -->
<!--        		<p/> -->
				<span>제목<input type="text" name="title" value="${beer.title }"style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
<!-- 				<span>상세정보<textarea cols="80" rows="10" name="content" style="width: 300px; height: 100px"></textarea></span> -->
<!-- 				<p/> -->
<!-- 				<span>가격<input type="text" name="price" style="width: 300px; height: 20px" maxlength="200"/></span> -->
<!-- 				<p/> -->
<!-- 				<span>생산지<input type="text" name="area" style="width: 300px; height: 20px" maxlength="200"/></span> -->
<!-- 				<p/> -->
<!-- 				<span>광고<input type="text" name="ad" style="width: 300px; height: 20px" maxlength="200"/></span> -->
<!-- 				<p/> -->
<!-- 				<span>제조회사<input type="text" name="company" style="width: 300px; height: 20px" maxlength="200"/></span> -->
<!-- 				<p/> -->
			</div>
			<span style="align:left"><input type="reset" value="취소" onclick="window.close()"/></span> 
			<span style="align:right"><input type="submit" value="등록" onclick="window.close()"/></span>
		</div>
	</form>
</div>
<script type="text/javascript">

</script>
</body>
</html>