

function do_login(){
	var id = $("input[name=ids]").val();
	var pwd = $("input[name=pwd]").val();
	var rank = $("input[name=rank]:checked").val();		
	

	if(id==""){
		alert('아이디를 입력하세요');
		return;
	}
	
	if(pwd ==""){
		alert("비밀번호를 입력하세요");
		return;
	}
	
	if(rank == undefined){
		alert("학생, 교수 항목을 체크하세요");
		return;
	}
	
	
	// 로그인 값 검증(존재하는 회원인지 확인)
	$.ajax({
		url: "ajaxLogin.jsp",
		type: "post",
		data: {id: id, pwd:pwd, rank:rank},
		success: function(response){
			
			if(response == "no exist user"){
				alert('존재하지 않는 사용자 입니다.');
			}else{
				alert(response + '님, 환영 합니다.');
				document.getElementById("signInForm").submit();
			}
		}
	});
	
	
}