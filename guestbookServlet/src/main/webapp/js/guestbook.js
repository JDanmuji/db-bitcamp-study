var guestbookForm = document.guestbookForm; 



function checkWrite(){
	
	
	var name = document.getElementById("name");
	var email = document.getElementById("email");  
	var subject = document.getElementById("subject");
	var content = document.getElementById("content");
	
	var nameDiv = document.getElementById("nameDiv");
	var emailDiv = document.getElementById("emailDiv");
	var subjectDiv = document.getElementById("subjectDiv");
	var contentDiv = document.getElementById("contentDiv");  
	
	nameDiv.innerText = "";
	emailDiv.innerText = "";
	subjectDiv.innerText = "";
	contentDiv.innerText = "";
	
	
	if (name.value == "") {
		 
		nameDiv.innerText="이름 입력";
		
	} else if (email.value == "") {
		
		emailDiv.innerText="이메일 입력";
		
	} else if (subject.value == "") {
		
		subjectDiv.innerText="제목 입력";
		
	} else if (content.value == "") {
		
		contentDiv.innerText="내용 입력";
		
	} else {
		guestbookForm.action = "http://localhost:8080/GuestbookWriteServlet";
		guestbookForm.submit();
			
	}
	
}

function clickList(){
	
	alert("글 목록은 준비중입니다.");
}