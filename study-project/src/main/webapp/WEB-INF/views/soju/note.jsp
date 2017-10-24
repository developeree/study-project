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
<script type="text/javascript">
	var dropBox = document.getElementById("dropbox");
	var dropImage = document.createElement("img");

	function onDragEnter(event) {
		if (event.dataTransfer.dropEffect == "move")
			event.preventDefault();
	}
	function onDragOver(event) {
		if (event.dataTransfer.dropEffect == "move") {
			event.preventDefault();
		}
	}
	function onDrop(event) {
		var file = event.dataTransfer.files[0];

		var imageType = /image.*/;
		var textType = /text.*/;
		var isImage;

		if (file.type.match(imageType)) {
			isImage = true;
		} else if (file.type.match(textType)) {
			isImage = false;
		}

		var reader = new FileReader();

		reader.onload = (function(aFile) {
			return function(e) {
				var result = e.target.result;
				if (isImage) {
					dropImage.src = result;
					dropBox.appendChild(dropImage)
				} else {
					dropBox.innerHTML = result;
				}
			};
		})(file);

		if (isImage) {
			reader.readAsDataURL(file);
		} else {
			reader.readAsText(file, "EUC-KR");
		}

		event.stopPropagation();
		event.preventDefault();
	}

	dropImage.addEventListener("load", function(e) {
		//이미지 로딩 시 추가 처리할 로직 기입(사이즈 조절 등)           
	}, true);
</script>
<div id="dropbox" ondragenter="onDragEnter(event)" ondragover="onDragOver(event)" ondrop="onDrop(event)">여기에 드랍</div>
</body>
</html>