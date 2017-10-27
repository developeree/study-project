<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/util.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<style type="text/css">
#mediaFiles{height: 100px; width: 450px}
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

				<fieldset><div id="drop" class="drop" contentEditable="true">
				<img id="dropped"/>
				<input type="hidden" name="content" value="${beer.content }"/>
				</div></fieldset>

				

<table width="485" border="1" cellspacing=0 cellpadding=5>
<tr bgcolor="#F2F2F2">
<td class="tableheader" align="left">
<p>Thumbnail palette</p>
</td>
</tr>
<tr>
<td align="left" height="105" ondragenter="return false" ondragover="return false" ondrop="dropIt(event)">    
<span id="thumbs" ></span> 
</td>
</tr>
<tr>
<td align="center">
<p class="files">Drag & drop or choose images from your local file system: 
<input  id="input" type="file" name="media" size="10" multiple="true" onchange="imagesSelected(this.files)"/>
</p>
</td>
</tr>
</table>

<!-- 				<fieldset><div id="drop" class="drop" contentEditable="true"> -->
<!-- 				<span>텍스트에리어에는 이미지를 못넣고 이렇게 컨텐트에디터블을 div에 사용하면 이미지+텍스트 사용가능 -->
<!-- 				# 숨겨진 textarea 태그를 사용하기 -->
<!-- 				이를 해결하려면 숨겨진 textarea 태그를 하나 더 만들어서 div 태그에 담긴 내용을 서버 전송시에 전달 후 submit 하는 방법입니다. -->
<!-- 				</span> -->
<!-- 				<img id="dropped"/> -->
<%-- 				<input type="hidden" name="content" value="${beer.content }"/> --%>
<!-- 				</div></fieldset> -->

			</div>
			<span style="align:left"><input type="reset" value="취소" onclick="window.close()"/></span> 
			<c:if test="${beer.idx ==null}">
			<span style="align:right"><input id="new" type="button" value="등록"/></span>
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

function imagesSelected(myFiles) {
	  for (var i = 0, f; f = myFiles[i]; i++) {
	    var imageReader = new FileReader();
	    imageReader.onload = (function(aFile) {
	      return function(e) {
	        var span = document.createElement('span');
	        var files=aFile.name;
	        span.innerHTML = ['<img id="images" src="', e.target.result,'"alt="', aFile.name, '"/>'].join('');
	        document.getElementById('thumbs').insertBefore(span, null);
// 	        $('#input').attr('name',files);
//	        내가 추가한부분
	        $("img").click(function(){
	  		  alert("삭제염");
	  		document.getElementById("images").remove();
	  		 });
//	        여기까지
	      };
	    })(f);
	    imageReader.readAsDataURL(f);
	  }
	}

	function dropIt(e) {  
	   imagesSelected(e.dataTransfer.files); 
	   addFileFromLastInput(e.dataTransfer.files);
	   var data = e.dataTransfer;
	   $('#input').attr('name',data.files[0].name);
	   for (var i = 0; i < data.files.length; i++) {
		      alert(data.files[i].name);
		    }
	   e.stopPropagation();  
	   e.preventDefault();   
	}
	function addFileFromLastInput(file){

	    var a = $('input#input');
	    alert(a.length-1);
	    a[a.length-1].files = file;

	    try{
	        let new_input = '<input  id="input" type="file" name="media" size="10" multiple="true" onchange="imagesSelected(this.files)"/>';
	        $('.files').append(new_input);
//	         $('.filess').hide();
	    }catch(err){

	    }

// 	    return 0;
	}
// $(function(){
// 	$('#drop').on({
// 		'drop':function(e){
// 			var f=e.originalEvent.dataTransfer.files[0];
// 			var reader=new FileReader();
// 			$(reader).on('load',function(){
// 				$('#dropped').attr('src',reader.result);
// 			});
// 			reader.readAsDataURL(f);
// 			e.preventDefault();
// 		},
// 		'dragover':function(e){
// 			e.preventDefault();
// 		}
// 	})
// });
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