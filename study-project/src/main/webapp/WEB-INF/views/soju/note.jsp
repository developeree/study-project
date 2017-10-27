<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/util.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
   .file_input_textbox {float: left}
   .file_input_div {position: relative; width: 300px; height: 300px; overflow: hidden;}
   .file_input_button {width: 500px; height: 500px; position: absolute; top: 0px; background-color: #FFFFFF; color: #FFFFFF; border-style: solid;}
   .file_input_hidden {font-size: 45px; position: absolute; right: 0px; top: 0px; opacity: 0; filter: alpha(opacity=0); -ms-filter: "alpha(opacity=0)"; -khtml-opacity: 0; -moz-opacity: 0;}

</style>
</head>
<body>
<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
  
<div class="file_input_div">
  <input type="button" value="Search files" class="file_input_button" />
  <input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" />
</div>
</body>
</html>