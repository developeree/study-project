<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../include/util.jsp"/>
<title>회원가입</title>
</head>
<body>
	<div id="singupContainer">
		<form name="form0">
		<div>
			<span>아이디</span>
			<input type="text" name="id" id="id">
		</div>
		<div>
			<span>비밀번호</span>
			<input type="password" name="password" id="password">
		</div>
		<div>
			<span>이름</span>
			<input type="text" name="name" id="name">
		</div>
		<div>
			<span>성별</span>
			<select name="gender" id="gender">
				<option>man</option>
				<option>woman</option>
			</select>
		</div>
		<div>
			<span>생년월일</span>
			<input type="text" name="birth" id="birth">
		</div>
		<div>
			<span>전화번호</span>
			<input type="text" name="phone" id="phone">
		</div>
		<div>
			<span>이메일 인증</span>
			<div>
				<input type="text" name="mail" id="mail"> @
				<select name="secondMail">
					<option>gmail.com</option>
				</select>
				<input type="button" id="btnSendMail" value="인증메일발송">
			</div>
		</div>
		</form>
		<div>
			<span>인증코드입력</span>
			<input type="text" name="mailCode" id="mailCode">
			<input type="button" value="인증코드검사">
		</div>
		<div>
			<input type="button" id="btnSignup" value="가입">
			<input type="button" id="btnCancel" value="취소">
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('#btnCancel').click(function(e) {
			history.back();
			e.preventDefault;
		});
		
		$('#btnSignup').click(function(e) {
			signup();
			e.preventDefault;
		});
	});
	function signup() {
		var userId = $("input[name=id]").val();
		var password = $("input[name=password]").val();
		var userName = $("input[name=name]").val();
		var userGender = $("select[name=gender]").val();
		var userBirth = $("input[name=birth]").val();
		var userPhone = $("input[name=phone]").val();
		var userMail = $("input[name=mail]").val();
		
		if (userId == null || userId.trim().length == 0) {
			alert("아이디를 입력하세요.");
			$("input[name=id]").focus();
			return;
		} else if (password == null || password.trim().length == 0) {
			alert("패스워드를 입력하세요.");
			$("input[name=password]").focus();
			return;
		} else if(userName == null || userName.trim().length == 0){
			alert("이름를 입력하세요.");
			$("input[name=name]").focus();
		} else if (userGender == null || userGender.trim().length == 0) {
			alert("성별을 선택하세요.");
			$("select[name=gender]").focus();
		} else if (userBirth == null || userBirth.trim().length == 0) {
			alert("생일을 입력하세요.");
			$("input[name=birth]").focus();
		} else if (userPhone == null || userPhone.trim().length == 0) {
			alert("연락처를 입력하세요.");
			$("input[name=phone]").focus();
		} else if (userMail == null || userMail.trim().length == 0) {
			alert("메일를 입력하세요.");
			$("input[name=mail]").focus();
		} else {
			document.form0.method = 'POST';
			document.form0.action = '/web/user/signup.do';
			document.form0.submit();
		}
	};
	</script>
</body>
</html>