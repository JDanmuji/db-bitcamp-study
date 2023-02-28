var guestbookSearchForm = document.guestbookSearchForm; 



function search(){
	
	
	var num = document.getElementById("num");
	
	var numDiv = document.getElementById("numDiv");

	numDiv.innerText = "";

	
	if (num.value == "") {
		 
		numDiv.innerText = "글번호 입력하세요.";
		
	} else {
		guestbookSearchForm.action = "http://localhost:8080/GuestbookSearchServlet";
		guestbookSearchForm.submit();
			
	}
	
}

