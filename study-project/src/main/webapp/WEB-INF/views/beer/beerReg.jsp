<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/util.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<style type="text/css">
	#images{width: 100px; height: 100px;};
</style>
</head>
<body>
<div align="center" style="height:auto; width:400px; border:1px solid black; padding:10px">
<!-- 	<form name="form0" method="post" > -->
	<form name="form0" method="post" enctype="multipart/form-data">
		<div>
       		<div>
				<span>제목<input type="text" name="title" value="${beer.title }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>상세정보<textarea cols="80" rows="10" name="content" style="width: 300px; height: 100px">${beer.content }</textarea></span>
				<p/>
				<span>가격<input type="text" name="price" value="${beer.price }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>생산지<input type="text" name="area" value="${beer.area }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>썸네일<input type="file" name="thumbnail" style="width: 300px; height: 20px" maxlength="200"/></span>
       			<p/>
				<span>광고<input type="text" name="ad" value="${beer.ad }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>
				<span>제조회사<input type="text" name="company" value="${beer.company }" style="width: 300px; height: 20px" maxlength="200"/></span>
				<p/>

<!-- 				<div contentEditable="true" id="thumbs">글+이미지</div> -->

<!-- <fieldset> -->
<!-- 	<legend>drag and drop</legend> -->
<!-- 	<input type="file" id="file_dnd" name="media" multiple> -->
<!-- 	<div id="div_fns"></div> -->
<!-- 	<div id="div_dnd" style="height: 300px; margin: 20px; border:3px dotted red;text-align: center;line-height: 300px;font-size: 50px; background-color: #def;" >HERE</div> -->
<!-- </fieldset> -->

<!-- <table width="485" border="1" cellspacing=0 cellpadding=5> -->
<!-- <tr bgcolor="#F2F2F2"> -->
<!-- <td class="tableheader" align="left"> -->
<!-- <p>Thumbnail palette</p> -->
<!-- </td> -->
<!-- </tr> -->
<!-- <tr> -->
<!-- <td align="left" height="105" ondragenter="return false" ondragover="return false" ondrop="dropIt(event)">     -->
<!-- <span id="thumbs" ></span>  -->
<!-- </td> -->
<!-- </tr> -->
<!-- <tr> -->
<!-- <td align="center"> -->
<!-- <p class="files">Drag & drop or choose images from your local file system:  -->
<!-- <input id="input" name="media" type="file" multiple="true" onchange="imagesSelected(this.files)"/> -->
<!-- </p> -->
<!-- </td> -->
<!-- </tr> -->
<!-- </table> -->

<fieldset>

<p>다중업로드폼</p>
<fieldset>
<p>
<input id="input" name="media" type="file" multiple="true" onchange="imagesSelected(this.files)"/>
</p>
</fieldset>
<fieldset ondragenter="return false" ondragover="return false" ondrop="dropIt(event)">
<p>파일을 끌거나 선택해 주세요.</p>
<span id="thumbs"></span> 
</fieldset>

</fieldset>

			</div>
			<span style="align:left"><input type="reset" value="취소" onclick="window.close()"/></span> 
			<c:if test="${beer.idx ==null}">
			<span style="align:right"><input class="new" id="new" type="button" value="등록"/></span>
			</c:if>
			<c:if test="${beer.idx !=null}">
				<input type="hidden" name="_method" value="patch" id="method">
			<span style="align:right"><input id="edit" type="button" value="수정" /></span>
			</c:if>
		</div>
	</form>
	
<!-- 	<form name="form0" action="board" method="post"> -->
<!-- 	<span>제목<input type="text" name="title" style="width: 300px; height: 20px" maxlength="200"/></span> -->
<!-- 	<p/> -->
<!-- 	<span style="align:left"><input type="reset" value="취소" onclick="window.close()"/></span> -->
<!-- 	<span style="align:right"><input id="new" type="button" value="등록" /></span> -->
<!-- 	</form> -->
</div>

<script type="text/javascript">

// var div_dnd = document.getElementById('div_dnd');
// var file_dnd = document.getElementById('file_dnd');
// var div_fns = document.getElementById('div_fns');

// //-- 이벤트를 중지 시킨다
// var stopevent = function(evt){
// 	console.log(evt.type);
// 	evt.preventDefault(); 
// 	evt.stopPropagation();
// }
// //-- 선택된 파일명 표시
// var showfns = function(files){
// 	var fns = [];
// 	for(var i=0,m=files.length;i<m;i++){
// 		fns.push(files[i].name+'('+files[i].size+' Byte)');
// 	}
// 	div_fns.innerHTML = fns.join('<br>');
// }
// //-- 드래그 관련 이벤트에 기본적으로 이벤트를 중지 시키도록 한다.
// div_dnd.ondragstart = stopevent
// div_dnd.ondragend = stopevent
// div_dnd.ondragover = stopevent
// div_dnd.ondragenter = stopevent
// div_dnd.ondragleave = stopevent
// div_dnd.ondrag = stopevent
// // div_dnd.ondrag = stopevent //이 이벤트는 따로 동작시킨다.

// // ondrop 에서 선택된 파일 제어 구문을 넣는다.
// div_dnd.ondrop= function(evt){
// 	stopevent(evt);//이벤트는 중지 시킨다.
// 	var files = evt.dataTransfer.files; //드롭된 파일리스트(FileList)
// 	console.log(files);
// 	file_dnd.files = files; //input type=file 에 파일을 넣어준다.
// 	file_dnd.onchange(); 
// }
// file_dnd.onchange = function(evt){
// 	showfns(this.files); //선택된 파일 목록 표시
// }
function imagesSelected(myFiles) {

	  for (var i = 0, f; f = myFiles[i]; i++) {
	    var imageReader = new FileReader();
	    imageReader.onload = (function(aFile) {
	      return function(e) {
	        var span = document.createElement('span');
	        span.innerHTML = ['<img id="images" src="', e.target.result,'"alt="', aFile.name, '"/><p/><span id="filen">파일명: ', aFile.name,'</span>'].join('');
	        document.getElementById('thumbs').insertBefore(span, null);
// 	        내가 추가한부분
	        $("img").click(function(){
	  		alert("삭제염");
	  		document.getElementById("images").remove();
	  		document.getElementById("filen").remove();
	  		 });
// 	        여기까지
	      };
	    })(f);
	    imageReader.readAsDataURL(f);

	  }
	}

	function dropIt(e) {  
		var files=e.dataTransfer.files;
		var input=document.getElementById('input');
		 input.files=files;
//문제가 탐색창 파일이랑 드래그 파일이랑 안합쳐진다.. 탐색+드래그로 올릴경우 마지막 이벤트파일에만 반응..이게 원래 탐색창이 초기화대버려서..
// 	   imagesSelected(files); 
	   var data = e.dataTransfer;
	   for (var i = 0; i < data.files.length; i++) {
		      alert(data.files[i].name);
		    } 
	   e.stopPropagation();  
	   e.preventDefault();   
	}
    
 $('#new').click(function() {
	form0.target = opener.name;
 	document.form0.action = '/web/beer/board';
 	document.form0.submit();
 	window.close();
 });
 $('#edit').click(function() {
	form0.target = opener.name;
 	document.form0.action = '/web/beer/board/${beer.idx}';
 	document.form0.submit();
 	window.close();
  });
</script>
</body>
</html>