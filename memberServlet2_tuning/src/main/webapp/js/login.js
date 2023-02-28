var loginForm = document.loginForm;
var loginSerlvetURL = "http://localhost:8080/LoginServlet";
var writeFormHtmlURL = "http://localhost:8080/member/writeForm.html";

function checkLogin() {
	var id = document.getElementById("id");
	var idDiv = document.getElementById("idDiv");
	var pwd = document.getElementById("pwd");
	var pwdDiv = document.getElementById("pwdDiv");
	
	
	if (id.value == "") {

		idDiv.innerText="아이디 입력";	

	} else if(pwd.value == "") {
		
		pwdDiv.innerText="비밀번호 입력";
		
	} else {
		
		signIn();
		
	}
}


function signIn() {
	loginForm.action = loginSerlvetURL;
	loginForm.submit();
}


function signUp() {
	loginForm.action = writeFormHtmlURL;
	loginForm.submit();
}