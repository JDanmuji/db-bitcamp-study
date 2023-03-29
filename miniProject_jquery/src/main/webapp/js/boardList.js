$(document).ready(function() {
	
	$.ajax({
		type: 'post',
		url : '/board/boardList.do',
		data: 'pg=' + $('#pg').val(),
		dataType : 'json',
		success : function(data) {
			$.each(data.list, function(index, items) {
				
				$('<thead/>').append($('<td/>', {
					align : 'center',
					text : items.seq	
				})).append($('<td/>', {
					text : items.subject
				})).append($('<td/>', {
					text : items.id
				})).append($('<td/>', {
					text : items.logtime
				})).append($('<td/>', {
					text : items.hit
				})).appendTo($("#boardListTable"));
			});
			
			$('#boardPagingDiv').html(data.pagingHTML);
		},
		error : function(err) {
			console.log(err);
		}
	});
	
});