<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/util.jsp"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>약관</title>
</head>
<body>
동의합니다<input type="checkbox" id="check"/>
<input type="button" value="다음" id="next" disabled/>
<script type="text/javascript">
$("#check").click(function() {
	if($("#check").is(":checked")==true){
	$("#next").prop("disabled", false);
	$("#next").click(function(){ 
		window.location.href="/web/user/signup.html";
	});
	}
	else{
		$("#next").prop("disabled", true);
	}
});


</script>
</body>
</html>