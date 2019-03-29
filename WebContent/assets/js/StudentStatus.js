// 학적에 대한 스크립트 파일


// 학적 변동 신청
function modifyStudentStatus(){
	$(document).ready(function(){
		
	
	var modified_status = $("select[name=modified_status]").val();						// 구분
	var year_and_semester = $("input[name=year_and_semester]").val();	// 년도/학기
	var modified_date = $("input[name=modified_date]").val();								// 신청일자
	

	$.ajax({
		url:"ajaxStudentdStatusModify.jsp",
		type:"post",
		data:{
			modified_status: modified_status,
			year_and_semester: year_and_semester,
			modified_date: modified_date
		},
		success: function(response){
			if(response == "학적 변동에 실패하였습니다."){		// 실패
				alert(response);
			}else{
				alert(response);
				location.href = "StudentStatusChangeHistoryGet.jsp";
			}
		}
	});
	
	});

}


// 학적 변동 내역 조회
function getStudentStatusModifyHistory(){
	location.href = "StudentStatusChangeHistoryGet.jsp";
}


