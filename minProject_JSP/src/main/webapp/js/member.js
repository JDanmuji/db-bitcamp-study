//html common form
//html 당 form tag가 하나만 있어 index : 0 fix 
var form = document.forms[0];


function idCheck() {
	var check = true;
	
	var idDivTag = document.getElementById("idDiv");
	var idValue = document.getElementById("id").value;
	
	idDivTag.innerText = "";
	
	if (!idValue) {
		idDivTag.innerText = "아이디 입력";
		check = false;
	}
	
	return check;	
}

function pwdCheck() {
	var check = true;
	
	var pwdDivTag = document.getElementById("pwdDiv");
	var pwdValue = document.getElementById("pwd").value;
	
	pwdDivTag.innerText = "";
	
	if (!pwdValue) {
		pwdDivTag.innerText="비밀번호 입력";
		check = false;
	}	

	return check;
}

function nameCheck() {
	var check = true;
	
	var nameDivTag = document.getElementById("nameDiv");
	var nameValue = document.getElementById("name").value;
	
	nameDivTag.innerText = "";
	
	if (!nameValue) {
		nameDivTag.innerText="이름 입력";
		check = false;
	}	

	return check;	
}

function rePwdCheck() {
	var check = true;
	
	var pwdValue = document.getElementById("pwd").value;
	var pwdDivTag = document.getElementById("pwdDiv");
	var rePwdValue = document.getElementById("repwd").value;
	
	if (pwdValue !== rePwdValue) {
		pwdDivTag.innerText="비밀번호가 맞지 않습니다";
		check = false;
	}

	return check;
}
 
function select(){
	form.email2.value = form.email3.value;
}

/* Daum 우편번호 */
function execDaumPostcode() {
	var zipCode =  document.getElementById('zipcode');
	var addr1 =  document.getElementById("addr1");
	var addr2 = document.getElementById("addr2");
	 
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

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
            addr2.focus();
        }
    }).open();
}

function checkLogin(){
	
	if (!idCheck()) {
		return;
	}
	
	if (!pwdCheck()) {
		return
	}

	form.submit();
}


function checkWrite(){
	
	if (!nameCheck()) {
		return;
	}
	
	if (!idCheck()) {
		return;
	}
	
	if (!pwdCheck()) {
		return;
	}
	
	if (!rePwdCheck()) {
		return;
	}			
	
	form.submit();
}

function checkUpdate() {

	if (!nameCheck()) {
		return;
	}

	if (!pwdCheck()) {
		return;
	}
	
	if (!rePwdCheck()) {
		return;
	}
	
	//disable tag submit 전송 불가, 전송 전 disable 해제
	document.getElementById("id").disabled = false;
	form.submit();
}


function checkDelete() {

	if (!pwdCheck()) {
		return;
	}
	
	
	form.submit();
}











