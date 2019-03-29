function idChecking() {
	// 아이디 유효성 체크, ajax 사용.
	var idcheck = false;
	var idInput = document.getElementById("id").value;
	if (idInput == "") {
		// 입력을 하지 않앗을 경우의 예외처리.
		alert("Please fill in ID");
		document.getElementById("terms").focus();
		return;
	}
	$.ajax({
		// ajax를 통한 백그라운드 연산.
		type : 'post',
		url : 'ajaxID.jsp',
		data : {
			validate_Type : "validate_ID",
			id_validate : $('#id').val()
		},

		success : function(data) {
			// 서버에서 연산된 결과를 가지고 참 거짓을 판단하자.
			if ($.trim(data) == 'false') {
				idcheck = false;
				// check
				alert("ID error!");
				$('#id').val("");
			}
		}
	});

}

function pwdChecking() {
	// 비밀번호 유효성 체크, ajax 사용.

	var pwdcheck = true;
	var pwdInput = document.getElementById("pwd").value;
	if (pwdInput == "") {
		// 예외처리.
		alert("Please fill in Password");
		document.getElementById("id").focus();
		return;
	}else if (pwdcheck == "") {
		alert("missing password check!")
		return false;
	}

	$.ajax({

		// ajax를 사용하여 백 그라운드로 체크.
		type : 'post',
		url : 'ajaxPwd.jsp',
		data : {
			validate_Type : "validate_pwd",
			pwd_validate : $('#pwd').val()
		},

		success : function(data) {
			// 뒤에서 연산한 결과를 가지고 가부를 판단
			if ($.trim(data) == 'false') {
				pwdcheck = false;
				alert("password error!");
				$('#pwd').val("");
			} else {
				document.getElementById("cpwd").focus();
			}
		}
	});
}

function checkDup() {
	$.ajax({
		// ajax를 통한 백그라운드 연산.
		type : 'post',
		url : 'ajaxDup.jsp',
		data : {
			validate_Type : "validate_ID",
			id_validate : $('#id').val()
		},

		success : function(data) {
			console.log(data);
			// 서버에서 연산된 결과를 가지고 참 거짓을 판단하자.
			if ($.trim(data) == 'false') {
				alert("이미 존재하는 아이디입니다.");
				$('#id').val("");
			} else {
				alert("사용가능한 아이디 입니다.");
				document.getElementById("pwd").focus();
			}
		}
	});
}

function samePwd() {
	// 비밀번호확인체크.
	var pwd = document.getElementById("pwd").value;
	var cpwd = document.getElementById("cpwd").value;
	if (pwd != cpwd) {
		alert("please enter the same password!");
		return;
	} else {
		document.getElementById("nameInput").focus();
	}

}

//function nameChecking() {
//	// 이름 유효성 체크.
//	var name = document.getElementById("nameInput").value;
//	var namereg = /^[가-힝a-zA-Z]{1,}$/g;
//
//	if (!name.match(namereg)) {
//		alert("please type appropriate name");
//		name = null;
//		return false;
//	}else if (name == "") {
//		alert("missing name!");
//		return false;
//	}
//}

function emailChecking() {
	// 이메일 유효성체크.
	var email = document.getElementById("emailInput").value;
	var emailreg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if (!email.match(emailreg)) {
		alert("please type appropriate email");
		email = null;
		return false;
	} else if (email == "") {
		alert("missing email!");
		return false;
	}
}

function telChecking() {
	// 이메일 유효성체크.
	var tel = document.getElementById("telInput").value;
	var telreg =  /^\d{3}-\d{3,4}-\d{4}$/;
	if (!tel.match(telreg)) {
		alert("please type appropriate tel");
		tel = null;
		return false;
	}
}

function val(){
	 //체크박스나, 아이디,비밀번호의 입력안한것에 대한 예외처리는 위에서 햇기때문에, 나머지 항목들에 대해서 마지막 검토 함
	var who;
	var id = document.getElementById("id").value;
	var pw = document.getElementById("pwd").value;
	var name = document.getElementById("nameInput").value;
	var major = document.getElementById("majorInput").value;
	var tel =  document.getElementById("telInput").value;
	var email =  document.getElementById("emailInput").value;
	var birth =  document.getElementById("birthInput").value;
	var status =  document.getElementById("statusInput").value;
	
	for(var i=0;i<2;i++){
		if(document.check.elements["rank"][i].checked){
			who = document.check.elements["rank"][i].value;
			break;
		}
	}
	
	var identifier = "2018";
	
	if(who == "student"){
		// 학번 랜덤 부여 9자리
		for(var i=0;i<5;i++){
			var temp = Math.floor(Math.random() * 10);
			identifier += temp;
		}
	}else{ // 교번 랜덤 부여 7자리
		for(var i=0;i<3;i++){
			var temp = Math.floor(Math.random() * 10);
			identifier += temp;
		}
	}
	
	alert("생성된 고유 번호 : " + identifier);
	
	$.ajax({
		// 학번 부여 후 디비에 저장
		type : 'post',
		url : 'ajaxMember.jsp',
		data : {
			id : id,
			pw : pw,
			name : name,
			major : major,
			tel : tel,
			email : email,
			birth : birth,
			status : status,
			identifier : identifier,
			who : who
		},

		success : function(data) {
			// 뒤에서 연산한 결과를 가지고 가부를 판단
			if ($.trim(data) == 'false') {
				alert("회원 가입 실패!")
			} else {
				alert("회원 가입 완료!")
			}
		}
	});
}