<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<jsp:include page="../include/util.jsp" />

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
		<div id="login_background">
			
			<!-- 로그인 영역 -->
			<div id="login_content" align="center">
				<div style="margin-top: 50px;">
					<h2 style="width:200px; height:120px; font-size:xx-large; font-style: normal; font-weight: bold; margin: 0px 0px; padding-top: 0px; ">
						<span style="color:#FE9A2E;">L O G I N</span>
					</h2>
				</div>
				
				<div id="loginInput" align="left" style="width: 420px; height: 50px;">
					<input type="text" name="id" id="id" style="font-size:x-large; width: 300px; height: 30px;" tabindex="1">
					<br style="height: 5px;"/>
					<input type="password" name="password" id="password" style="font-size:x-large; width: 300px; height: 30px;" tabindex="2">
				</div>
			</div>
			
			<div id="loginButtonWrapper">
					<a id="btnLogin" tabindex="3"></a>
			</div>
			<div style="margin-top: 600px; font-size: xx-small;">
				<jsp:include page="../include/footer.jsp"/>
			</div>
			
		</div>
	</form>
</body>
</html>