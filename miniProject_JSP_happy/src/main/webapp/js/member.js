function select(){
	//document.writeForm.email2.value = document.writeForm.email3.value
	document.getElementById("email2").value = document.getElementById("email3").value;
}

function checkLogin(){
	document.getElementById("idDiv").innerText="";
	document.getElementById("pwdDiv").innerText="";
	
	if(document.getElementById("id").value=="")
		document.getElementById("idDiv").innerText="아이디 입력";
	else if(document.getElementById("pwd").value=="")
		document.getElementById("pwdDiv").innerText="비밀번호 입력";
	else 
		document.loginForm.submit();
}
function checkWrite(){
	document.getElementById("nameDiv").innerText="";
	document.getElementById("idDiv").innerText="";
	document.getElementById("pwdDiv").innerText="";
	
	
	//if(document.writeForm.name.value=="")alert("이름 입력하시오.")
	//if(document.getElementById("id").value=="")alert("아이디 입력하시오.")
	if(document.getElementById("name").value=="")
		document.getElementById("nameDiv").innerText="이름 입력";
	else if(document.getElementById("id").value=="")
		document.getElementById("idDiv").innerText="아이디 입력";
	else if(document.getElementById("pwd").value=="")
		document.getElementById("pwdDiv").innerText="비밀번호 입력";	
	else if	(document.getElementById("pwd").value != document.getElementById("repwd").value)
		document.getElementById("pwdDiv").innerText="비밀번호 확인하세요";
	else if	(document.getElementById("id").value != document.getElementById("check").value)
		document.getElementById("idDiv").innerText="중복체크 하세요";	
	else 
		document.writeForm.submit();
}

function checkupdate(){
	document.getElementById("nameDiv").innerText="";

	if(document.getElementById("name").value=="")
		document.getElementById("nameDiv").innerText="이름 입력";
	else 
		document.updateForm.submit();
}

/*daum 우편 번호*/
 function post() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                               
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
                
            }
        }).open();
    }