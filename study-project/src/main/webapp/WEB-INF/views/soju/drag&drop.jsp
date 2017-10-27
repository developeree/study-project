<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../include/util.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.dragAndDropDiv {
		border: 2px dashed #92AAB0;
		width: 650px;
		height: 200px;
		color: #92AAB0;
		text-align: center;
		vertical-align: middle;
		padding: 10px 0px 10px 10px;
		font-size:200%;
		display: table-cell;
	}
	.progressBar {
		width: 200px;
		height: 22px;
		border: 1px solid #ddd;
		border-radius: 5px; 
		overflow: hidden;
		display:inline-block;
		margin:0px 10px 5px 5px;
		vertical-align:top;
	}
	              
	.progressBar div {
		height: 100%;
		color: #fff;
		text-align: right;
		line-height: 22px; /* same as #progressBar height if we want text middle aligned */
		width: 0;
		background-color: #0ba1b5; border-radius: 3px; 
	}
	.statusbar{
		border-top:1px solid #A9CCD1;
		min-height:25px;
		width:99%;
		padding:10px 10px 0px 10px;
		vertical-align:top;
	}
	.statusbar:nth-child(odd){
		background:#EBEFF0;
	}
	
	.filename{
		display:inline-block;
		vertical-align:top;
		width:250px;
	}
	.filesize{
		display:inline-block;
		vertical-align:top;
		color:#30693D;
		width:100px;
		margin-left:10px;
		margin-right:5px;
	}
	.abort{
		background-color:#A8352F;
		-moz-border-radius:4px;
		-webkit-border-radius:4px;
		border-radius:4px;
		display:inline-block;
		color:#fff;
		font-family:arial;
		font-size:13px;
		font-weight:normal;
		padding:4px 15px;
		cursor:pointer;
		vertical-align:top
	}
</style>
</head>
<body>
<form>
	<div id="fileUpload" class="dragAndDropDiv">여기에 파일을 드래그</div>
	<input type="hidden" name="h_data">
</form>
<script type="text/javascript">
	$(document).ready(function(){
	
			
		var objDragAndDrop = $(".dragAndDropDiv");
	                 
		$(document).on("dragenter",".dragAndDropDiv",function(e){
			e.stopPropagation();
			e.preventDefault();
			$(this).css('border', '2px solid #0B85A1');
		});
	                
		$(document).on("dragover",".dragAndDropDiv",function(e){
			e.stopPropagation();
			e.preventDefault();
		});
	                
		$(document).on("drop",".dragAndDropDiv",function(e){
			$(this).css('border', '2px dotted #0B85A1');
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;
	                 
			handleFileUpload(files,objDragAndDrop);
		});
	                 
		$(document).on('dragenter', function (e){
			e.stopPropagation();
			e.preventDefault();
		});
	                
		$(document).on('dragover', function (e){
			e.stopPropagation();
			e.preventDefault();
			objDragAndDrop.css('border', '2px dotted #0B85A1');
		});
	                
		$(document).on('drop', function (e){
			e.stopPropagation();
			e.preventDefault();
		});
	                 
		function handleFileUpload(files,obj) {
			var fd = new FormData();

			for (var i = 0; i < files.length; i++) {
				
				fd.append('file', files[i]);
	            documnet.form.h_data.value = files[i];
				alert("파일은"+files[i]);
				var data = document.form['h_data'].value;
				alert("히든은"+data);
				var status = new createStatusbar(obj); //Using this we can set progress.
				status.setFileNameSize(files[i].name,files[i].size);
				
				sendFileToServer(fd,status);
				
			}
		}
	                 
		var rowCount=0;
		function createStatusbar(obj){
				rowCount++;
				var row="odd";
				if(rowCount %2 ==0) row ="even";
				this.statusbar = $("<div class='statusbar "+row+"'></div>");
				this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
				this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
				this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
				this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
		                     
				obj.after(this.statusbar);
		                  
				this.setFileNameSize = function(name,size){
					var sizeStr="";
					var sizeKB = size/1024;
					if(parseInt(sizeKB) > 1024){
						var sizeMB = sizeKB/1024;
						sizeStr = sizeMB.toFixed(2)+" MB";
					}else{
						sizeStr = sizeKB.toFixed(2)+" KB";
					}
					this.filename.html(name);
					this.size.html(sizeStr);
				}
		                     
				this.setProgress = function(progress){       
					var progressBarWidth =progress*this.progressBar.width()/ 100;  
					this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
						if(parseInt(progress) >= 100) {
							this.abort.hide();
						}
				}
		                     
				this.setAbort = function(jqxhr){
				var sb = this.statusbar;
					this.abort.click(function() {
						jqxhr.abort();
						sb.hide();
					});
				}
			}
		
		function sendFileToServer(formData,status) {
			var uploadURL = "/web/soju/drag.do"; //Upload URL
			var extraData ={}; //Extra Data.
			
			var jqXHR=$.ajax(
					{xhr: function() {
					var xhrobj = $.ajaxSettings.xhr();
					if (xhrobj.upload) {
						xhrobj.upload.addEventListener('progress', function(event) {
							var percent = 0;
							var position = event.loaded || event.position;
							var total = event.total;
							if (event.lengthComputable) {
								percent = Math.ceil(position / total * 100);
							}
							//Set progress
							status.setProgress(percent);
						}, false);
					}
		                            return xhrobj;
				},
				
					url: uploadURL,
					type: "POST",
					contentType:false,
					processData: false,
					cache: false,
					data: formData,
					success: function(data){
						status.setProgress(100);
						//$("#status1").append("File upload Done<br>");           
					}
			}); 
	                  
			status.setAbort(jqXHR);
		}
	                 
	});
</script>

 <form name="form0" action="file/upload" method="POST" enctype="multipart/form-data">
        <ul>
            <li>파일 하나 업로드 : <input id="file1" type="file" name="file" /></li>
            <li>여러 파일 업로드 : <input id="file2" type="file" name="multifile" multiple /></li>
            <li>파일을 선택하고 '전송'을 눌러 업로드하시거나, 탐색기에서 파일을 드래그앤드롭하여 업로드할 수 있습니다. 드래그앤드롭은 '전송'을 누르는 것이 아니라 드롭시점에 바로 업로드됩니다.</li>
        </ul>
        <input type="submit" value="전송"/>
    </form>
    <script type="text/javascript">
    var dropzone1 = document.getElementById('file1');
    var dropzone2 = document.getElementById('file2');
    setDnDhandler(dropzone1);
    setDnDhandler(dropzone2);
     
    function setDnDhandler(obj) {
        obj.addEventListener("dragover", function(event) {
            event.preventDefault();
        }, true);
        obj.addEventListener("drop", function(event) {
            event.preventDefault();
            var allTheFiles = event.dataTransfer.files;
            for (var i=0; i<allTheFiles.length; i++) {
                var element = document.createElement('div');
                element.id = 'f' + i;
                document.body.appendChild(element);
                sendFile(allTheFiles[i], element.id);
            }
        }, true);
    }
    function sendFile(file, fileId) {
        var xhr = new XMLHttpRequest();
         
        xhr.upload.addEventListener("progress", function(e) {
                if (e.lengthComputable) {
                    var percentage = Math.round((e.loaded * 100) / e.total);
                    document.getElementById(fileId).innerHTML = file.name + ' - ' + percentage + '%';
                }
            }, false);
        xhr.onreadystatechange = function() {  
            if (xhr.readyState == 4 && xhr.status == 200) {
                alert(xhr.responseText);
            }
        };
        xhr.upload.addEventListener("load", function(e){
                document.getElementById(fileId).innerHTML = file.name + ' - uploaded';
            }, false);
        xhr.open("POST", "file/upload");
        var fd = new FormData();
        fd.append("file", file);
        xhr.send(fd);
    }
    </script>

</body>
</html>