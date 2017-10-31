<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/util.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<body>
<script type="text/javascript">

    function add_item(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set').innerHTML;
        document.getElementById('field').appendChild(div);
    }
 
    function remove_item(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('field').removeChild(obj.parentNode);
    }

</script>
 
<div id="pre_set" >
<!--     <input type="text" name="" value="" style="width:200px">  -->
	<input type="file" multiple>
    <input type="button" value="삭제" onclick="remove_item(this)" onchange="add_item()">
</div>
 
<div id="field"></div>
 
<input type="button" value=" 추가 " onclick="add_item()"><br>
추가 버튼을 눌러보세요.
</body>
</html>