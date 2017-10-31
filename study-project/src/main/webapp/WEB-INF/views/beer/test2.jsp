<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../include/util.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.file_input_div {position: relative; width: 100px; height: 23px; overflow: hidden;}
	.file_input_button {width: 100px; position: absolute; top: 0px; background-color: #33BB00; color: #FFFFFF; border-style: solid;}
	.file_input_hidden {font-size: 45px; position: absolute; right: 0px; top: 0px; opacity: 0; filter: alpha(opacity=0); -ms-filter: "alpha(opacity=0)"; -khtml-opacity: 0; -moz-opacity: 0;}

	.file_input_textbox {float: left}
	.file_input_div2 {position: relative; width: 300px; height: 300px; overflow: hidden;}
	.file_input_button2 {width: 300px; height: 300px; position: absolute; top: 0px; background-color: #FFFFFF; color: black; }
	.file_input_hidden2 {width: 300px; height: 300px; font-size: 45px; position: absolute; right: 0px; top: 0px; opacity: 0; filter: alpha(opacity=0); -ms-filter: "alpha(opacity=0)"; -khtml-opacity: 0; -moz-opacity: 0;}


body{padding:0;margin:0;font-size:13px;font-family:'나눔고딕',NanumGothic,'맑은 고딕','Malgun Gothic','돋움',Dotum,'굴림',Gulim,Helvetica,AppleGothic,sans-serif;}
div.fileUploadSection{float:left;width:100%;}
div.fileUploadSection div.fileUpWrapper{text-align:center;margin:6px 0 0 4px;}
div.fileUploadSection div.fileUpWrapper div.uploadPathDiv{float:left;line-height:23px;height:25px;width:70%;border:1px solid #ccc;}

/*파일 추가 삭제*/
div.addAttachFileSection{float:left;width:100%;margin:5px 0 0 0;}
div.addAttachFileSection ul.attachFileList{float:left;list-style-type:none;padding:0;margin:0;width:100%;word-break:break-all;word-wrap:break-word;whilte-space:pre-wrap;}
div.addAttachFileSection ul.attachFileList li{float:left;width:100%;border:1px solid #ccc;margin:0 0 2px 0;text-align:left;}
div.addAttachFileSection ul.attachFileList li span.removeAttach{border:1px solid #ccc;line-height:25px;padding:0 7px 0 7px;margin:0 4px 0 4px;}
div.addAttachFileSection ul.attachFileList li span.attachFileName{vertical-align:middle;line-height:25px;}
span.fileUp{font-size:13px;line-height:25px;}

div#viewLoading {text-align:center;padding-top:120px;filter:alpha(opacity=60);opacity: alpha*0.6;background-color:#222222;color:#bcbfc4;}
div#viewLoading div.progressTitle{text-align:left;border:2px solid #111111;border-bottom:1px solid #111111;padding:15px 0 15px 0;width:99.2%;}
div#viewLoading div.progressTitle span{padding-left:3px;padding-bottom:5px;}
div#viewLoading div.progressWrapper{border:1px solid #111111;width:99.2%;text-align:center;}
div#viewLoading div.progressWrapper div.progresspercent{background-color:#1a1a1a;height:40px;border:1px solid #000000;}
div#viewLoading div.progressWrapper div.progresspercent span.percentwrapper{line-height:38px;}
div#viewLoading div.progressWrapper div.progresspercent span.percentwrapper span.pgbar{display:block;float:left;background-color:#fecf23;width:90%;}
div#viewLoading div.progressWrapper div.progresspercent span.percentwrapper span.pgpercent{position:absolute;left:30%;right:30%;color:#c0c0c0;}
div#viewLoading div.progressWrapper div.progresspercent span.percentwrapper span.pgpercent strong{font-weight:bold;}
div#viewLoading div.progressfilereadsize{margin:0 0 5px 0;height:40px;border:1px solid #111111;}
div#viewLoading div.progressfilereadsize span{line-height:40px;}
div#viewLoading div.progressfilereadsize span.divider strong{font-weight:400;}
div#viewLoading div.progressSpeed{margin:0 0 5px 0;height:40px;border:1px solid #111111;text-align:center;}
div#viewLoading div.progressSpeed span.kbps{line-height:40px;}
div#viewLoading div.progressSpeed span.kbps strong{font-weight:400;}

.pgbarbgcolor{background-color:#fecf23;}
</style>
</head>
<body>
<fieldset>
<div class="file_input_div">
  <input type="button" value="내PC" class="file_input_button" />
  <input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" />
</div>
<p></p>
<p></p>
<input type="text" id="fileName" class="file_input_textbox" readonly="readonly" value="zz">
<div class="file_input_div2" style="width: 300px; height: 300px">

  <div class="file_input_button2" style="width: 300px; height: 00px">여따 끌어 주세염</div>
  <input type="file" style="width: 300px; height: 300px" class="file_input_hidden2" onchange="javascript: document.getElementById('fileName').value = this.value" />

</div>
</fieldset>

<h1>drag and drop file control</h1>
<fieldset>
	<legend>drag and drop</legend>
	<input type="file" id="file_dnd" name="file_upload" mutiple>
	<div id="div_fns"></div>
	<div id="div_dnd" style="height: 300px; margin: 20px; border:3px dotted red;text-align: center;line-height: 300px;font-size: 50px; background-color: #def;" >HERE</div>
</fieldset>

<fieldset>
	<legend>지원브라우저</legend>
	
	<ul>
		<li>크롬 : 4.0</li>
		<li>IE : 9.0</li>
		<li>FF : 3.5</li>
		<li>사파리 : 6.0</li>
		<li>오페라 : 12.0</li>
	</ul>
</fieldset>
<fieldset>
	<legend>간단설명</legend>
	
	<div>
		다 필요 없고 file의 드래그앤드롭에서는 최종으로 ondrop 이 발생되며, 이 때만 파일리스트를 제어하면 된다.
	</div>
</fieldset>


<div class="fileUploadSectionWrapper">
	<form id="fileform" enctype="multipart/form-data" method="post">
		<!-- 첨부파일 -->
		<div class="fileUploadSection">			
			<div class="fileUpWrapper">				
				<div id="fileUpBtnWrapper" class="fileUpBtnWrapper" style="position:relative; left: 2px; width:40px;height:25px; overflow:hidden;border:1px solid #ccc;text-align:center;">				 								
					<%-- input의 id명 뒤의 숫자를 변경하지 말것(인덱스 번호로 사용됨) --%>				
					<input id="file0" onchange="makeUploadElem(this)" class='file' type="file" name="upFile[]" style="position: absolute;right:0px;top:0px; opacity:0; filter: alpha(opacity=0);cursor: pointer;outline:none;"/>					 				
					<span class="fileUp">파일</span>
				 </div>
			</div>
		</div>		
		<!-- 첨부추가/제거 -->
		<div class="addAttachFileSection">
			<ul class="attachFileList">
			</ul>
		</div>				
	</form>			
</div>

<div style="float:left;width:100%;height:40px;margin-top:30px;border:1px solid #ccc;text-align:center;">
	<span class="sendData" style="border:1px solid #ccc;line-height:40px;vertical-align:middle;padding:4px 15px 4px 15px;">전송</span>
</div>
<!-- Ajax Progress Status -->
<div id="viewLoading">
	<!-- 
	<div class='progressTitle'>
		<span><strong>업로드 진행상태</strong></span>		
	</div>
	<div class='progressWrapper'>
		<div class='progresspercent'>
			<span class='percentwrapper'>
				<span class='pgbar'>&nbsp;</span>
				<span class='pgpercent'><strong> 40% </strong></span>				
			</span>
		</div>
		<div class='progressfilereadsize'>
			<span class='readsize'> 20000000000 <strong> bytes</strong></span>
			<span class='divider'><strong>/</strong></span>
			<span class='filelength'> 3000000000000  <strong> bytes</strong></span>
		</div>
		<div class='progressSpeed'>
			<span class='kbps'> 2000 <strong> kbps</strong></span>
		</div>		
	</div>
 	-->
</div>
<div id="debug" style="float:left;width:100%;border:1px solid red;margin-top:30px;">
</div>

<script type="text/javascript">

$('.file_input_hidden2').click(function(e){
	e.preventDefault();
});

var div_dnd = document.getElementById('div_dnd');
var file_dnd = document.getElementById('file_dnd');
var div_fns = document.getElementById('div_fns');

//-- 이벤트를 중지 시킨다
var stopevent = function(evt){
	console.log(evt.type);
	evt.preventDefault(); 
	evt.stopPropagation();
}
//-- 선택된 파일명 표시
var showfns = function(files){
	var fns = [];
	for(var i=0,m=files.length;i<m;i++){
		fns.push(files[i].name+'('+files[i].size+' Byte)');
	}
	div_fns.innerHTML = fns.join('<br>');
}
//-- 드래그 관련 이벤트에 기본적으로 이벤트를 중지 시키도록 한다.
div_dnd.ondragstart = stopevent
div_dnd.ondragend = stopevent
div_dnd.ondragover = stopevent
div_dnd.ondragenter = stopevent
div_dnd.ondragleave = stopevent
div_dnd.ondrag = stopevent
// div_dnd.ondrag = stopevent //이 이벤트는 따로 동작시킨다.

// ondrop 에서 선택된 파일 제어 구문을 넣는다.
div_dnd.ondrop= function(evt){
	stopevent(evt);//이벤트는 중지 시킨다.
	var files = evt.dataTransfer.files; //드롭된 파일리스트(FileList)
	console.log(files);
	file_dnd.files = files; //input type=file 에 파일을 넣어준다.
	file_dnd.onchange(); 
}
file_dnd.onchange = function(evt){
	showfns(this.files); //선택된 파일 목록 표시
}


var sel_files = [];


$(document).ready(function() {
    $("#input_imgs").on("change", handleImgFileSelect);
}); 

function fileUploadAction() {
    console.log("fileUploadAction");
    $("#input_imgs").trigger('click');
}

function handleImgFileSelect(e) {

    // 이미지 정보들을 초기화
    sel_files = [];
    $(".imgs_wrap").empty();

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var index = 0;
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
            $(".imgs_wrap").append(html);
            index++;

        }
        reader.readAsDataURL(f);
        
    });
}


//input file의 인덱스번호로 쓰임(전역변수)
var fileIndex = 0;	

$(function(){
	var fileUploadElem = $("input.file");
	var fileUploadBtnElem = $("span.sendData");
	var fileUploadFrm = $("#fileform");	
		
	//ajax Progress image view Elem
	var viewLoadingImgElem = $("div#viewLoading");
	$(viewLoadingImgElem).hide();	//초기로딩시에는 이미지를 숨긴다.
	
	var intervalID = 0;
	//ajax 요청시작과 완료시의 프로그레스 이미지 element의 동작
	$(viewLoadingImgElem).ajaxStart(function(){
		// 로딩이미지의 위치 및 크기조절	
		$(viewLoadingImgElem).css('position', 'absolute');
		$(viewLoadingImgElem).css('left', $("body").offset().left);
		$(viewLoadingImgElem).css('top', $("body").offset().top);
		$(viewLoadingImgElem).css('width', $(document).width());
		$(viewLoadingImgElem).css('height', $(document).height());
		
		
		intervalID = setInterval(function(){			
			getFileUploadProgress();	//ajax요청중에 파일업로드 상태를 주기적으로 요청한다.	
		},50);
		$(this).fadeIn(250);
	}).ajaxStop(function(){		
		clearInterval(intervalID); //Stop updating		
		$(this).fadeOut(250);
	});					

	$(fileUploadBtnElem).click(function(){
		$(fileUploadFrm).ajaxSubmit({			
			url : '/testproj/fileupload.do',
			type : 'POST',
			data : $(fileUploadFrm).serialize(),
			success : function(data){
				deleteFileListAndFileElems();											
				clearInterval(intervalID); //Stop updating
				//alert("전송 완료 되었습니다.");
			},error : function(){
				deleteFileListAndFileElems();
				clearInterval(intervalID); //Stop updating	
				//alert("전송 실패 했습니다.");
			}
		});	
	});
  
	//파일업로드 상태를 주기적으로 확인해서 가져온다.
	var getFileUploadProgress = function(){
		$.ajax({
			url : '/testproj/uploadstatus.do',
			success : function(data){
				var jsonData = eval('('+ data +')');

				$(viewLoadingImgElem).html(										
						"<div class='progressTitle'>" +
						"	<span><strong>업로드 진행상태</strong></span>" +		
						"</div>" +
						"<div class='progressWrapper'>" +
						"	<div class='progresspercent'>" +
						"		<span class='percentwrapper'>"+
						"			<span class='pgbar'>&nbsp;</span>"+
						"			<span class='pgpercent'><strong>"+ jsonData.percent+"%</strong></span>" +				
						"		</span>" +
						"	</div>"+
						"	<div class='progressfilereadsize'>"+
						"		<span class='readsize'>" + jsonData.bytesread + "<strong> bytes</strong></span>" +
						"		<span class='divider'><strong>/</strong></span>" +
						"		<span class='filelength'>" + jsonData.contentlength + "<strong> bytes</strong></span>" +
						"	</div>" +
						"	<div class='progressSpeed'>" +
						"		<span class='kbps'>" + jsonData.kbps + "<strong> kbps</strong></span>" +
						"	</div>" +								
						"</div>"	);										
				$(viewLoadingImgElem).find("div.progresspercent span.pgbar").width(jsonData.percent+"%").addClass("pgbarbgcolor");				
			}
		});
	};	
});


//업로드 파일 지정
var makeUploadElem = function(fileElemObj){
	fileIndex++;	//global var	
	var addAttachFileSectionElem = $("div").filter(".addAttachFileSection");
	var attachFileListElem = $(addAttachFileSectionElem).find("ul");	
	
	var targetElem=$("div#fileUpBtnWrapper");
	var fileElem=$("<input id='file"+fileIndex+"' class='file' type='file' name='upFile[]' style='position: absolute;right:0px;top:0px; opacity:0; filter: alpha(opacity=0);cursor: pointer;outline:none;'/>");
	var fileUpBtnElem = $("<span class='fileUp'>&nbsp;파일</span>");
	
	$(fileElem).change(function(){
		makeUploadElem(this);	//recursive				
	});
	
	$(targetElem).append(fileElem);
	$(targetElem).append(fileUpBtnElem);
	$(fileElemObj).hide();	
	
	//파일 목록 추가 / 삭제
	var fileElemObjVal = $(fileElemObj).val();	
	$(attachFileListElem).append(
		"<li>" +			
			"<span class='removeAttach' onClick='deleteFileList(this,"+fileIndex+");'>x</span>" +
			"<span class='attachFileName'>"+fileElemObjVal+"</span>" +
		"</li>"
	);			
	
	$("div#debug").text($("div.fileUploadSection").html());
};
//업로드 파일 리스트 삭제
var deleteFileList = function(fileListElem,fileElemIndex){
	//기본으로 마크업된 input file의 인덱스 번호가 0으로 시작되는데
	//전역변수로 증가 시킨 상태이므로 -1을 시켜서 인덱스 번호를 맞춰준다.
	var fileElemIdx = fileElemIndex - 1;
	var fileUpBtnWrapElem = $("div").filter("#fileUpBtnWrapper");
	
	$(fileUpBtnWrapElem).find("input:file").filter("#file"+fileElemIdx).remove();	
	$(fileListElem).parent().remove();
	
	$("div#debug").text($("div.fileUploadSection").html());
};

//전송이 완료되거나 실패시에도 input file과 li를 모두삭제 시켜주고
//전역변수로 사용된 인덱스를 초기화 시켜준다.
var deleteFileListAndFileElems = function(){
	var fileUploadSectionElem = $("div").filter(".fileUpWrapper");
	var addAttachFileSectionElem = $("div").filter(".addAttachFileSection").find("ul");
	$(fileUploadSectionElem).children().remove();
	$(addAttachFileSectionElem).children().remove();
	fileIndex = 0;
};
</script>
</body>
</html>