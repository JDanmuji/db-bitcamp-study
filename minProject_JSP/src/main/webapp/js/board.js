var form = document.forms[0];



function checkBoardWrite(){
	
	
	var subject = document.getElementById("subject");
	var content = document.getElementById("content");
	
	var subjectDiv = document.getElementById("subjectDiv");
	var contentDiv = document.getElementById("contentDiv");  
	

	subjectDiv.innerText = "";
	contentDiv.innerText = "";
	
	if (subject.value == "") {
		
		subjectDiv.innerText="제목 입력";
		
	} else if (content.value == "") {
		
		contentDiv.innerText="내용 입력";
		
	} else {
		
		form.submit();
			
	}
	
}
/*
function clickList(){
		guestbookForm.action = "http://localhost:8080/GuestbookListServlet?pg=1";
		guestbookForm.submit();
	
}*/