var wirteForm = document.writeForm; 



function select(){
	wirteForm.email2.value = wirteForm.email3.value;
}

function checkWrite(){
	
	var id = document.getElementById("id");
	var name = document.getElementById("name");
	var pwd = document.getElementById("pwd");  
	var rePwd = document.getElementById("repwd");
	var nameDiv = document.getElementById("nameDiv");
	var idDiv = document.getElementById("idDiv");
	var pwdDiv = document.getElementById("pwdDiv");  
	
	nameDiv.innerText = "";
	idDiv.innerText = "";
	pwdDiv.innerText = "";
	
	if (name.value == "") {
		 
		nameDiv.innerText="이름 입력";
		
	} else if (id.value == "") {
		
		idDiv.innerText="아이디 입력";
		
	} else if (pwd.value == "") {
		
		pwdDiv.innerText="비밀번호 입력";
		
	} else if (pwd.value != rePwd.value) {
		
		pwdDiv.innerText="비밀번호가 맞지 않습니다";
		
	} else {
		
		wirteForm.submit();
			
	}
	
}


function post() {
	var zipCode = document.getElementsByName("zipcode"); 
	var addr1 = document.getElementsByName("addr1");

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

                

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                zipCode.value = data.zonecode;
                addr1.value = addr;
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("addr2").focus();
               

            
    	}
	}).open();
	
}
