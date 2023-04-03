
$(document).ready(function(){

	$.ajax({
		type: 'post',
		url: '/board/getBoard.do',
		data: {
			'pg' :  $('#pg').val(),
			'seq' :  $('#seq').val()
		},
		dataType : 'json', 
		success: function(data){
			
			console.log(data.idCheck);
			$('td.subject').text(data.subject);
			$('td.seq').text('글번호 : ' + data.seq);
			$('td.name').text('작성자 : ' + data.name);
			$('td.hit').text('조회수 : ' + data.hit);
			$('td  div').html('<pre>' + data.content +'</pre>');
		
			if(data.idCheck == "no") {
				$('tr td span').remove();	
			} 
			
			
		},
		error: function(err){
			console.log(err);
		}		                          
	});
	
	
	
	
});

//글수정 폼
$('#boardUpdateBtn').click(function() {

	$('#boardViewForm').attr('action', '/board/boardUpdateForm.do');
	//submit은 name만 가져감
	$('#boardViewForm').submit();
});

//답글 폼
$('#boardReplyFormBtn').click(function() {
	
	$('#boardViewForm').attr('action', '/board/boardReplyForm.do');
	//submit은 name만 가져감
	$('#boardViewForm').submit();
	
});












