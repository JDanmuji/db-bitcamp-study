<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write your story</title>

<style type="text/css">
	body{
		margin: 50px;
		font-family: serif;
		}
	h3 {
		color: #539165;
		}
	table {
		border-collapse: collapse;
		background-color: #B5EAEA;
		border: #EDF6E5 3px solid;
		}
	input, textarea {
		padding: 6px;
		background-color: #EDF6E5;
		border: #EDF6E5;
		color: #F38BA0;
		font-weight: 700;
	}
	th {
		padding: 8px;
		background-color: #F38BA0;
		color: #EDF6E5;
	}
	#subjectDiv, #contentDiv {
		margin-top: 8px;
		color: #F38BA0;
		font-weight: 600;
		font-size: 12px;
	}
</style>

</head>
<body>

<form name="boardWriteForm" id="boardWriteForm">
<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="subject" id="subject">
			<div id="subjectDiv"></div>
		</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td>
			<textarea cols="50" rows="15" name="content" id="content"></textarea>
			<div id="contentDiv"></div>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="button" value="게시물 등록" id="boardWriteBtn" style="margin-left:150px;">
			<input type="reset" value="다시 작성" style="margin-left:50px;">
		</td>
	</tr>
</table>
</form>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$('#boardWriteBtn').click(function() {
	if($('#subject').val() == '') {
		$('#subjectDiv').text('제목을 입력하세요');
	}
	else if($('#content').val() == '') {
		$('#contentDiv').text('내용을 입력하세요');
	}
	else {
		$.ajax({
			type: 'post',
			url: '/board/boardWrite.do',
			data: $('#boardWriteForm').serialize(), //<form>에 입력된 데이터들을 문자열 형식으로 가져옴
			dataType: 'text',
			success: function(data) {
				data = data.trim();
				if(data=='ok') {
					alert("게시물이 등록되었습니다.");
					location.href = '/board/boardList.do?pg=1'
				}
			},
			error: function(err) {
				console.log(err);
			}
		});
	}
});
</script>
</body>
</html>