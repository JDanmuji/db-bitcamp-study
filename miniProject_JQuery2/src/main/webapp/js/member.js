function select() {
	
	document.getElementById("email2").value = document.getElementById("email3").value;
}

$('#writeBtn').click(function() {
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if($('#name').val() == '') {
		$('#nameDiv').text('이름을 입력하세요');
		$('#name').focus();
	}
	else if($('#id').val() == '') {
		$('#idDiv').text('아이디를 입력하세요');
		$('#id').focus();
	}
	else if($('#pwd').val() == '') {
		$('#pwdDiv').text('비밀번호를 입력하세요');
		$('#pwd').focus();
	}
	else if($('#pwd').val() != $('#repwd').val()) {
		$('#repwdDiv').text('비밀번호가 일치하지 않습니다');
		$('#repwd').focus();
	}
	else if($('#id').val() != $('#check').val()) {
		$('#idDiv').text('중복체크 하십시오');
		$('#id').focus();
	}
	else {
		//다른 페이지로 이동해버림
		//$('#writeForm').submit();
		
		$.ajax({
			type: 'post',
			url: '/miniProject_JQuery/member/write.do',
			data: $('#writeForm').serialize(), //<form>에 입력된 데이터들을 문자열 형식으로 가져옴
			dataType: 'text',
			success: function(data) {
				data = data.trim();
				
				if(data=='ok') {
					alert('회원가입 성공');
					location.href = '../index.jsp'
				}
				else if(data=='fail') {
					alert('회원가입 실패');
				}
			},
			error: function(err) {
				console.log(err);
			}
		});
	}
});

//아이디 중복체크
/*
var checked = "";

function checkId() {
	var id = document.writeForm.id.value;
	if (id == "") document.getElementById("idDiv").innerText = "아이디를 입력하세요";
	else {
		window.open("./checkId.do?id=" + id, "checkId", "width=400 height=150");
		checked = "checked";
	}
}
function isChecked() {checked = "";}
*/

//회원가입 유효성 검사
/*
function writeCheck() {
	//경고문 초기화
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").innerText = "";
	document.getElementById("pwdDiv").innerText = "";
	document.getElementById("repwdDiv").innerText = "";
	document.getElementById("emailDiv").innerText = "";
	document.getElementById("phoneDiv").innerText = "";
	document.getElementById("addrDiv").innerText = "";

	if (document.writeForm.name.value == "") {
	    document.getElementById("nameDiv").innerText = "이름을 입력하세요";
	} else if (document.writeForm.id.value == "") {
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";
	} else if (document.writeForm.pwd.value == "") {
		document.getElementById("pwdDiv").innerText = "비밀번호를 입력하세요";
	} else if (document.writeForm.pwd.value != document.writeForm.repwd.value) {
		document.getElementById("repwdDiv").innerText = "비밀번호가 일치하지 않습니다";
	} else if (document.writeForm.email1.value == "" || document.writeForm.email2.value == "") {
		document.getElementById("emailDiv").innerText = "이메일을 입력하세요";
	} else if (document.writeForm.phone2.value == "" || document.writeForm.phone3.value == "") {
		document.getElementById("phoneDiv").innerText = "전화번호를 입력하세요";
	} else if (document.writeForm.zipcode.value == "" || document.writeForm.addr1.value == "") {
		document.getElementById("addrDiv").innerText = "주소를 입력하세요";
	} else if (checked != "checked") {  //아이디 중복체크
		alert("아이디 중복체크 하십시오");
	} else {
		document.writeForm.submit();
	}
}
*/


//회원정보 수정 유효성 검사
function updateCheck() {
	//경고문 초기화
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("pwdDiv").innerText = "";
	document.getElementById("repwdDiv").innerText = "";
	document.getElementById("emailDiv").innerText = "";
	document.getElementById("phoneDiv").innerText = "";
	document.getElementById("addrDiv").innerText = "";

	if (document.updateForm.name.value == "") {
	    document.getElementById("nameDiv").innerText = "이름을 입력하세요";
	} else if (document.updateForm.pwd.value == "") {
		document.getElementById("pwdDiv").innerText = "비밀번호를 입력하세요";
	} else if (document.updateForm.pwd.value != document.updateForm.repwd.value) {
		document.getElementById("repwdDiv").innerText = "비밀번호가 일치하지 않습니다";
	} else if (document.updateForm.email1.value == "" || document.updateForm.email2.value == "") {
		document.getElementById("emailDiv").innerText = "이메일을 입력하세요";
	} else if (document.updateForm.phone2.value == "" || document.updateForm.phone3.value == "") {
		document.getElementById("phoneDiv").innerText = "전화번호를 입력하세요";
	} else if (document.updateForm.zipcode.value == "" || document.updateForm.addr1.value == "") {
		document.getElementById("addrDiv").innerText = "주소를 입력하세요";
	} else {
		document.updateForm.submit();
	}
}


// 다음 우편번호 api
function execDaumPostcode() {
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
            document.getElementById("zipcode").value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            // document.getElementById("addr2").focus();
        }
    }).open();
}
