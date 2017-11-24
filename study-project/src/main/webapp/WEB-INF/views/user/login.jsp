<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<jsp:include page="../include/util.jsp"/>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css"/>
<script type="text/javascript">
//로그인메서드
	function login() {
		var userName = $("input[name=id]").val();
		var password = $("input[name=password]").val();
		
		if (userName == null || userName.trim().length == 0) {
			alert("아이디를 입력하세요.");
			$("input[name=id]").focus();
			return;
		} else if (password == null || password.trim().length == 0) {
			alert("패스워드를 입력하세요.");
			$("input[name=password]").focus();
			return;
		} else {
			document.form0.action = '/web/user/login.do';
			document.form0.submit();
		}
	};
	$(document).ready(function(){
		$('#id, #password, #btnLogin').keydown(function (key) {
			if (key.keyCode == 13) {
				login();
			}
 		});
		
		$("#btnLogin").click(function(e){ 
			login();
			e.preventDefault();
		});
		
		
	});
</script>
</head>
<body>
	<form name=form0 method="post">
		<div id="login_background">
			<div style="margin-top: 0px;" align="center">
				<span style="font-size: large; background-color: red; color: white;">${loginAdvice}</span>
			</div>
			<!-- 로그인 영역 -->
			<div id="login_content" align="center">
				<div style="margin-top: 50px;">
					<h2 style="width:200px; height:120px; font-size:xx-large; font-style: normal; font-weight: bold; margin: 0px 0px; padding-top: 0px; ">
						<span style="color:#FE9A2E;">L O G I N</span>
					</h2>
				</div>
				
				<div id="loginInput">
					<input type="text" name="id" id="id" style="font-size:x-large; width: 300px; height: 30px;" tabindex="1">
					<br style="height: 5px;"/>
					<input type="password" name="password" id="password" style="font-size:x-large; width: 300px; height: 30px;" tabindex="2">
				</div>
			</div>
			

			<img src="../resources/css/heart1.jpg">
			<button style="background-image: url('../resources/css/heart1.jpg');"></button>
			<div style="margin-top: 600px; font-size: xx-small;">
				<jsp:include page="../include/footer.jsp"/>
			</div>
			
		</div>
	</form>
</body>
</html>