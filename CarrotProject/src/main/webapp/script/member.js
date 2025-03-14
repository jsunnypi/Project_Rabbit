// 아이디 중복 체크를 위한 함수
function useridCheck() {
	if (document.frm.userid.value == "") {
		alert('아이디를 입력하세요.');
		document.frm.userid.focus();
		return false;
	}
	var url = "useridCheck.do?userid=" + document.frm.userid.value;
	
	const width = 500;
	const height = 320;
	const left = (screen.width - width) / 2;
	const top = (screen.height - height) / 2;

	window.open(url, "_blank_1", 
	    `toolbar=no, menubar=no, scrollbars=yes, resizable=no, 
	    width=${width}, height=${height}, 
	    top=${top}, left=${left}`
	);
}

// "사 용" 버튼 클릭 시 부모 창에 아이디 값을 설정하고 창을 닫는 함수
function idok(userid) {
	if (opener && !opener.closed && opener.document.frm) {
		opener.document.frm.userid.value = userid;   // 부모 창에 아이디 값 설정
		opener.document.frm.reuserid.value = userid; // reuserid도 동일하게 설정
		self.close();  // 자식 창 닫기
	} else {
		alert("부모 창을 찾을 수 없거나 폼이 존재하지 않습니다.");
	}
}


// 회원가입란 작성 여부 확인 메소드
function joinCheck() {

	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력해 주세요");
		frm.userid.focus();
		return false;
	}


	if (document.frm.reuserid.value.length == 0) {
		alert("중복 체크를 하지 않았습니다.");
		frm.userid.focus();
		return false;
	}

	if (document.frm.password.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.password.focus();
		return false;
	}

	if (document.frm.password.value != document.frm.checked_password.value) {
		alert("암호가 일치하지 않습니다.");
		frm.password.focus();
		return false;
	}

	if (document.frm.name.value.length == 0) {
		alert("이름을 입력해주세요");
		frm.name.focus();
		return false;
	}

	if (document.frm.nickname.value.length == 0) {
		alert("닉네임을 입력해주세요");
		frm.nickname.focus();
		return false;
	}

	if (document.frm.phone.value.length == 0) {
		alert("전화번호를 입력해주세요");
		frm.phone.focus();
		return false;
	}

	if (document.frm.email.value.length == 0) {
		alert("이메일을 입력해주세요");
		frm.email.focus();
		return false;
	}

	if (document.frm.address.value.length == 0) {
		alert("주소를 입력해주세요");
		frm.address.focus();
		return false;
	}

	return true;

}	


document.addEventListener('DOMContentLoaded', function() {
    const emailDomain = document.querySelector('input[name="email_domain"]');
    const emailSelect = document.querySelector('select[name="email_select"]');
    
    emailSelect.addEventListener('change', function() {
        const selectedValue = this.value;
        if (selectedValue === 'custom') {
            emailDomain.value = '';
            emailDomain.removeAttribute('readonly');
        } else {
            emailDomain.value = selectedValue;
            emailDomain.setAttribute('readonly', true);
        }
    });
});
