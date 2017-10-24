<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/util.jsp" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<STYLE TYPE="text/css">

TD{font-family: Arial, Helvetica, sans-serif; font-size: 8pt;}

</STYLE>

<style type="text/css">



.tableheader {
 background-color: #FFFFFF;
 background-image: url(http://www.ibm.com/i/v16/t/sprites-t1.gif);
 background-repeat: repeat-x;
 background-position: 0px -545px;
 padding-left: 10px;
 font-weight: bold;
 border-top-width: 0px;
 border-right-width: 0px;
 border-bottom-width: 1px;
 border-left-width: 0px;
 border-top-style: none;
 border-right-style: none;
 border-bottom-style: solid;
 border-left-style: none;
 border-top-color: #FFFFFF;
 border-bottom-color: #cccccc;
 font-size: 12px;
}
.tablepadding {
 margin: 0px;
 padding-top: 0px;
 padding-right: 10px;
 padding-bottom: 0px;
 padding-left: 10px;
 border-top-width: 0px;
 border-right-width: 0px;
 border-bottom-width: 0px;
 border-left-width: 0px;
 border-top-style: none;
 border-right-style: none;
 border-bottom-style: none;
 border-left-style: none;
 font-family: Arial, Helvetica, sans-serif;
 font-size: 12px;
}

.tableborder {
 border: 1px solid #cccccc;
}


#images { 
        height:75px;
        width:75px; 
        border:0px; 
        margin:15px 15px 0 0; 
}

</style>

<style type="text/css">

table, td
{
    border-color: #e6e6e6;
    border-style: solid;
}
</style>

</head>
<body>

<center>
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
<input  id="input" type="file" size="10" multiple="true" onchange="imagesSelected(this.files)"/>
</p>
</td>
</tr>
</table>
</center>


<script>
function imagesSelected(myFiles) {
	  for (var i = 0, f; f = myFiles[i]; i++) {
	    var imageReader = new FileReader();
	    imageReader.onload = (function(aFile) {
	      return function(e) {
	        var span = document.createElement('span');
	        alert("파일들어오니:"+aFile.name);
	        span.innerHTML = ['<img id="images" src="', e.target.result,'" title="', aFile.name, '"/>'].join('');
// 	        span.innerHTML = ['<img id="images" src="', e.dataTransfer.files,'" title="', aFile.name, '"/>'].join('');
	        document.getElementById('thumbs').insertBefore(span, null);

// 	        내가 추가한부분
	        $("img").click(function(){
	  		  alert("삭제염");
	  		document.getElementById("images").remove();
	  		 });
// 	        여기까지
	      };
	    })(f);
	    imageReader.readAsDataURL(f);
	  }
	}

	function dropIt(e) {  
		//폼데이터일때
// 		e.dataTransfer.files
		//드래그드랍일때
// 		e.target.files
	   imagesSelected(e.dataTransfer.files); 
// 	   imagesSelected(e.dataTransfer); 
	   var data = e.dataTransfer;
// 	   addFileFromLastInput(e.dataTransfer.files);
// 	   handleFileUpload(e.dataTransfer.files);
	   for (var i = 0; i < data.files.length; i++) {
		      alert(data.files[i].name);
		    }
	   e.stopPropagation();  
	   e.preventDefault();
	   
	} 

	function addFileFromLastInput(file){

	    var a = $('input#input');
	    a[a.length-1].files = file;
// 	    try{
// 	        let new_input = '<input  id="input" type="file" size="10" multiple="true" onchange="imagesSelected(this.files)"/>';
	        $('.files').append(new_input);
// 	    }catch(err){

// 	    }

// 	    return 0;

	}
	
// 	function handleFileUpload(files,obj)
//     {
//        for (var i = 0; i < files.length; i++) 
//        {
//             var fd = new FormData();
//             fd.append('file', files[i]);
//       		alert("머여"+files[0]);
//        }
//     }
</script>
</body>
</html>