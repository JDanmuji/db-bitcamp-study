//$(function(){});
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/board/getBoardList.do',
		data: 'pg=' + $('#pg').val(), // {'pg': $('#pg').val()}
		dataType : 'json', //서버로부터 받는 데이터 자료형 'text', 'html', 'xml', 'json' => 객체는 받을 자료형이 없다
		                   //객체를 json으로 변환시켜서 가져와야 한다.
		success: function(data){
			//console.log(JSON.stringify(data));
			//console.log(data.list[0].seq);
			//console.log(data.list[1].name);
			
			$.each(data.list, function(index, items){
			
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
					
				})).append( $('<td/>',{
					
					}).append($('<a/>',{
						href: '#',
						class: 'subjectA subjectA_' + items.seq,
						text: items.subject 
					}))
				
				).append($('<td/>',{	
					align: 'center',
					text: items.id
				})).append($('<td/>',{
					align: 'center',
					text: items.hit
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
				})).appendTo($('#boardListTable'))
				
				for (var i=1; i <= items.lev; i++) {
					
					$('.subjectA_' + items.seq).before('&emsp;');
						
					if (items.pseq != 0 ) {
					
						$('.subjectA_'+ items.seq).before($('<img/>', {
							'src' : 'http://localhost:8080/image/reply.gif'
						}));
					}
					
				}
			});
			
			//페이징 처리
			$('#boardPaingDiv').html(data.pagingHTML);
			
			//로그인 여부
			$('.subjectA').click(function(){
				if($('#memId').val() == '')
					alert('먼저 로그인하세요');
				else{
					var seq = $(this).parent().prev().text();
					
					//console.log(seq.prop('tagName'));
				//	console.log(seq);
					
					var pg = $('#pg').val();
			
					
					location.href="/board/boardView.do?seq=" + seq + "&pg=" + pg;
				}
					
			});
			
		},
		error: function(err){
			console.log(err);
		}		                          
	});
});











