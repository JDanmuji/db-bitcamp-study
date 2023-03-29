
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
			
			
			$('#subject').val(data.boardDTO.subject);
			$('#content').val(data.boardDTO.content);
			
			
		},
		error: function(err){
			console.log(err);
		}		                          
	});
});











