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
				<span>제목<input type="text" id="title" name="beerTitle" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>상세정보<textarea cols="80" rows="10" name="beerContent" id="content" style="width: 300px; height: 100px"></textarea></span>
				<p/>
				<span>가격<input type="text" id="price" name="beerPrice" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>생산지<input type="text" id="area" name="beerArea" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>광고<input type="text" id="ad" name="beerAd" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>제조회사<input type="text" id="company" name="beerCompany" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
			</div>
			<span style="align:left"><input type="reset" value="취소" onclick="window.close()"/></span> 
			<span style="align:right"><input type="submit" value="등록" onclick="window.close()"/></span>
		</div>
	</form>
</div>
<script type="text/javascript">
// 자동으로 팝업 창이 닫히게 하는 함수
function popupClose(form) {
    // form의 target을 부모 창으로 설정함            
    form.target = opener.name;
    form.submit();
    if (opener != null) {
        opener.insert = null;
        self.close();
    }
}
</script>
</body>
</html>