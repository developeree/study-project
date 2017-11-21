<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/util.jsp" %> 
<%@ include file="../include/header.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지</title>
</head>
<body>
${sessionScope.user.name }
<div>
<fieldset>
<!-- 상대경로 -->
<%-- <img alt="${beer.thumb}" src="../files/${beer.thumb}" style="width:100px; height:100px;"/> --%>
<!-- 절대경로 -->
<c:forEach var="bf" items="${bf}" >
<img alt="${bf.original_name}" src="/study_project_files/${bf.trans_name}" style="width:100px; height:100px;"/>
</c:forEach>
<span>${beer.title }</span>
<span>${beer.content}</span>
<span>${beer.price }</span>
</fieldset>
</div>
<div>
<form name="form0" method="post">
<span><input type="hidden" name="_method" value="get" id="method"/></span>
<span><input type="button" value="목록" onclick="location.href='/web/beer'"/></span>
<span><input id="edit" type="button" value="수정" onclick="updatePopup();"/></span>
<span><input id="del" type="button" value="삭제"/></span>

<c:if test="${sessionScope.user.idx!=null}">
<span id="like" style="cursor:pointer;">추천<img style="height:20px; width:20px" src="<c:url value='/resources/images/heart.jpg'/>"></img></span>
<span id="likeShow" style="cursor:pointer; display:none">추천취소<img style="height:20px; width:20px" src="<c:url value='/resources/images/heart2.jpg'/>"></img></span>
</c:if>
</form>
</div>

<div>
<fieldset>
<legend>댓글:${beer.comment_count }</legend>
<!-- 댓글쓰기폼 -->

<div>
<%-- <c:if test="${sessionScope.loginUser.userId!=null }"> --%>
<form name="form1" method="post">
<span><textarea cols="5" rows="5" name="comment_content" style="width: 300px; height: 25px"></textarea></span>
<span><input id="commentNew" type="button" value="등록"/></span>
</form>
<%-- </c:if> --%>
</div>

<p/>
<!-- 댓글보기폼 -->
<c:forEach var="comment" items="${comment}" varStatus="status">
<div class="loadStart">
<fieldset style="text-align: left; margin:5px;" class="loading">
<label><input type="hidden" name=comment${status.index}  value="${comment.comment_idx}"/></label>
<label style="float:left; margin-right:5px;">작성자</label>

<label style="float:left; margin-right:5px;">
<input type="hidden" name=comment${status.index}  value="${comment.comment_idx}"/>${comment.comment_edit_date }
</label>

<div id="butt${comment.comment_idx}">
<%-- <c:if test="${comment.user.userId==sessionScope.loginUser.userId }" > --%>
<label style="float:right; margin-left:5px;"><input type="button" value="삭제" onclick="delReply(${beer.idx},${comment.comment_idx})"/></label>
<label style="float:right; margin-left:5px;"><input type="button" value="수정" class="editReply" onclick="editReply(${beer.idx},${comment.comment_idx})"/></label>
<%-- </c:if> --%>
</div>	
<br/><br/>
<label id="commentContent${comment.comment_idx}">${comment.comment_content }</label>

<div style="display:none" id="replyEditForm${comment.comment_idx}">
<form name="re" id="re${comment.comment_idx}" method="post">
<span><input type="hidden" name=comment${status.index}  value="${comment.comment_idx}"/></span>
<span><textarea cols="5" rows="5" name="comment_content" style="width: 300px; height: 25px">${comment.comment_content }</textarea></span>
<span><input type="button" value="수정" onclick="upReply(${beer.idx},${comment.comment_idx})"/></span>
<span><input type="reset" value="취소" onclick="location.href='/web/beer/${beer.idx}'"/></span>
</form>
</div>

</fieldset>
</div>
</c:forEach>

<div align="center"> <button id="next">더보기</button></div>

</fieldset>
</div>

<script type="text/javascript">
var sojuLikeCheck = ${like.like_status};
switch (sojuLikeCheck) {
   case 1 : 
      $('#like').hide();
      $('#likeShow').show();
      break;
   case null :
      $('#like').show();
      $('#likeShow').hide();
      break;
   default :
      $('#like').show();
      $('#likeShow').hide();
      break;
}
//더보기 기능
$(document).ready(function(){

    var list = $(".loadStart .loading");
    var numToShow = 2;
    var button = $("#next");
    var numInList = list.length;
    list.hide();
    if (numInList > numToShow) {
      button.show();
    }
    list.slice(0, numToShow).show();

    button.click(function(){
        var showing = list.filter(':visible').length;
        list.slice(showing - 1, showing + numToShow).fadeIn();
        var nowShowing = list.filter(':visible').length;
        if (nowShowing >= numInList) {
          button.hide();
        }
    });

});
$('#like').click(function() {
	$('#like').hide();
	$('#likeShow').show();
	var likeStatus=1;
	$.ajax({
		  type: "POST",
		  url: "/web/beer/${beer.idx}/like",
		  data:  {"likeStatus":likeStatus},
		});
});
$('#likeShow').click(function() {
	$('#like').show();
	$('#likeShow').hide();
	$.ajax({
		  type: "POST",
		  url: "/web/beer/${beer.idx}/like/cancle"
		});
});
//글 수정폼
function updatePopup() {
	window.name = "/web/beer/${beer.idx}";
    window.open("/web/beer/board/${beer.idx}", "update",
            "width = 450, height = 500, resizable = no, scrollbars = no, status = no");
}
//글삭제로직
$('#del').click(function() {
	var answer=confirm("글을 삭제하시겠습니까?");
	if (answer == true) {
		$('#method').val('delete');
		document.form0.action = '/web/beer/board/${beer.idx}';
		document.form0.submit();
	} else {
		return;
	 }
 });
//댓글쓰기로직
$('#commentNew').click(function() {
	document.form1.action = '/web/beer/'+${beer.idx}+'/commentNew';
	document.form1.submit();
});
// $('.editReply').click(function() {
	//클래스로 줄경우 버튼하나 누르면 전부 열려서 문제
// 	$('.replyEditForm').show();
// 	$('.commentContent').hide();
// });
//댓글수정폼
function editReply(beerId,commentId){
	var replyEditForm='#replyEditForm'+commentId;
	var commentContent='#commentContent'+commentId;
	var butt='#butt'+commentId;
	$(replyEditForm).show();
	$(commentContent).hide();
	$(butt).hide();
// 		$(replyEditForm).hide();
// 		$(commentContent).show();
// 		$(butt).show();
}
//댓글수정로직
function upReply(beerId,commentId){
	var re="#re"+commentId;
	var answer=confirm("댓글을 수정하시겠습니까?");
	if(answer){
        var url = '/web/beer/'+beerId+'/comment/'+commentId+'/up';
        $(re).attr('action',url).submit();
	}else {
		return;
	 }
}
//댓글삭제로직
function delReply(beerId,commentId){
// 	삭제시 어떤form이든 상관없고 그냥 form에서 method post만 빌리는듯함
	var answer=confirm("댓글을 삭제하시겠습니까?");
	if(answer){
        var url = '/web/beer/'+beerId+'/comment/'+commentId+'/del';
//         window.open(url,"_self");
        document.form1.action=url;
        document.form1.submit();
	}else {
		return;
	 }
}
</script>
</body>
</html>