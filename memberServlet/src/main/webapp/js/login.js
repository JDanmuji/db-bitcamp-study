
function checkLogin() {
	
	if (document.getElementById("id").value == ""){

		document.getElementById("idDiv").innerText="아이디 입력";	

	} else if(document.getElementById("pwd").value == "") {
		
		document.getElementById("pwdDiv").innerText="비밀번호 입력";
		
	} else {
		
		signIn();
		
	}
}


function signIn() {

	document.writeForm.action = "http://localhost:8080/LoginServlet";
	document.writeForm.submit();
}


function signUp() {
	
	document.writeForm.action = "http://localhost:8080/member/writeForm.html";
	document.writeForm.submit();
}