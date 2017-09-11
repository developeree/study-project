<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
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
				document.form0.action = 'login.do';
				document.form0.submit();
			}
		}
	});
</script>
</head>
<body>
	<form name=form0 method="post">
		<div id="login-form">
			
			<!-- 로그인 영역 -->
			<div id="login_content" align="center">
				
				<div>
					<h2 style="font-size: x-large; font-style: normal; font-weight: bold; margin: 0px 0px; padding-top: 0px; ">
						로그인
					</h2>
				</div>
				
				<div>
					<input type="text" name="id" id="id" style="width: 200px;" tabindex="1">
					<input type="password" name="password" id="password" style="width: 200px;" tabindex="2">
				</div>
				<div>
					<input type="button" id="btnLogin" name="btnLogin" tabindex="3" value="로그인">
					
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>