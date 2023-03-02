var guestbookSearchForm = document.guestbookSearchForm; 

let check = /^[0-9]+$/; 

function search(){
	
	
	var num = document.getElementById("num");
	
	var numDiv = document.getElementById("numDiv");

	numDiv.innerText = "";

	
	if (num.value == "") {
		 
		numDiv.innerText = "글번호 입력하세요.";
	
	} else if (check.test(num.val)) {
		
		numDiv.innerText = "숫자만 입력하세요.";
		
	} else {
		guestbookSearchForm.action = "http://localhost:8080/GuestbookListServlet";
		guestbookSearchForm.submit();
			
	}
	
}

