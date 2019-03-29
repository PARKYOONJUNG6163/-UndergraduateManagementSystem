
	
 // 강의계획서를 등록하는 폼을 화면에 띄워줌
function loadCreateSyllabusForm(event){
	$(document).ready(function(){
	
	$(".content table").attr("style", "display:none;");
	$("#createSyllabusForm").removeAttr("style");
	
	// 등록 누른 과목의 과목명과 학수번호 전달 받기
	var academic_num = $(event.target).parent().siblings().get(0).innerText;
	var subject_name = $(event.target).parent().siblings().get(1).innerText;
	
	$("#subject_name").val(subject_name);
	$("input[name=academic_num]").val(academic_num);
	

	
	});	
}


// 강의계획서 등록폼에서 "등록" 버튼을 누를 경우 호출됨
// 강의계획서가 등록
function createSyllabus(){
	$(document).ready(function(){
		
		if($("textarea[name=lecture_way]").val() == ""){
			alert('수업 방법을 입력해주세요.');
			return;
		}
		
		
		if($("textarea[name=test_way]").val() == ""){
			alert('평가 방법을 입력해주세요.');
			return;
		}
		
		if($("textarea[name=prerequisite_learning]").val() == ""){
			alert('선수학습 내용을 입력해주세요.');
			return;
		}
		
		if($("textarea[name=out_line]").val() == ""){
			alert('수업 개요를 입력해주세요.');
			return;
		}
		
		if($("textarea[name=text_book]").val() == ""){
			alert('교재를 입력해주세요.');
			return;
		}
		
		if($("textarea[name=lecture_plan]").val() == ""){
			alert('강의 계획을 입력해주세요.');
			return;
		}
		
		var lecture_way = $("textarea[name=lecture_way]").val();
		var test_way = $("textarea[name=test_way]").val();
		var prerequisite_learning = $("textarea[name=prerequisite_learning]").val();
		var out_line = $("textarea[name=out_line]").val();
		var text_book = $("textarea[name=text_book]").val();
		var lecture_plan = $("textarea[name=lecture_plan]").val();
		var academic_num = $("input[name=academic_num]").val();
		
		
		// 강의계획서 등록
		$.ajax({
			url: "ajaxSyllabusCreate.jsp",
			type: "post",
			data: {lecture_way: lecture_way, 
				test_way:test_way, 
				prerequisite_learning:prerequisite_learning,
				   out_line:out_line,
				   text_book:text_book,
				   lecture_plan:lecture_plan,
				   academic_num: academic_num
			},
			success: function(response){
				
				if(response == "Syllabus already exist"){
					alert('강의 계획서 등록에 실패하였습니다. 이미 존재하는 강의계획서일수도 있습니다.');
				}else{
					alert(response);
					location.href = "SyllabusCreate.jsp";	
				}
			}
		});
	
		
	});
}



// 조회버튼을 선택한 과목의 강의계획서 조회
function getSyllabusForm(event){
	$(document).ready(function(){
		
		// 조회 누른 과목의 과목명과 학수번호 전달 받기
		var academic_num = $(event.target).parent().siblings().get(0).innerText;
		var subject_name = $(event.target).parent().siblings().get(1).innerText;
		
		
		$("input[name=subject_name]").val(subject_name);
		$("input[name=academic_num]").val(academic_num);
		
		// 선택된 과목의 강의계획서 출력!
		document.getElementById("tempForSyllabus").submit();
	});
	
}

// 조회버튼을 선택한 과목의 강의계획서를 조회한 후, 이전 페이지로 돌아가는 버튼
function getSyllabusList(){
	$(document).ready(function(){
		history.go(-1);				// 뒤로 가기..
	});
	}

// 강의 계획서를 수정하는 폼을  화면에 출력
function modifySyllabusForm(event){
	$(document).ready(function(){
		
		// 수정 누른 과목의 과목명과 학수번호 전달 받기
		var academic_num = $(event.target).parent().siblings().get(0).innerText;
		var subject_name = $(event.target).parent().siblings().get(1).innerText;
		
	
		$("input[name=subject_name]").val(subject_name);
		$("input[name=academic_num]").val(academic_num);
		
		
		document.getElementById("tempForSyllabus").submit();
		
	});
}

// 강의계획서 수정
function modifySyllabus(){
	$(document).ready(function (){
		
	
	if($("textarea[name=lecture_way]").val() == ""){
		alert('수업 방법을 입력해주세요.');
		return;
	}
	
	
	if($("textarea[name=test_way]").val() == ""){
		alert('평가 방법을 입력해주세요.');
		return;
	}
	
	if($("textarea[name=prerequisite_learning]").val() == ""){
		alert('선수학습 내용을 입력해주세요.');
		return;
	}
	
	if($("textarea[name=out_line]").val() == ""){
		alert('수업 개요를 입력해주세요.');
		return;
	}
	
	if($("textarea[name=text_book]").val() == ""){
		alert('교재를 입력해주세요.');
		return;
	}
	
	if($("textarea[name=lecture_plan]").val() == ""){
		alert('강의 계획을 입력해주세요.');
		return;
	}
	
	var lecture_way = $("textarea[name=lecture_way]").val();
	var test_way = $("textarea[name=test_way]").val();
	var prerequisite_learning = $("textarea[name=prerequisite_learning]").val();
	var out_line = $("textarea[name=out_line]").val();
	var text_book = $("textarea[name=text_book]").val();
	var lecture_plan = $("textarea[name=lecture_plan]").val();
	var academic_num = $("input[name=academic_num]").val();
	
	
	// 강의계획서 수정
	$.ajax({
		url: "ajaxSyllabusModify.jsp",
		type: "post",
		data: {lecture_way: lecture_way, 
			test_way:test_way, 
			prerequisite_learning:prerequisite_learning,
			   out_line:out_line,
			   text_book:text_book,
			   lecture_plan:lecture_plan,
			   academic_num: academic_num
		},
		success: function(response){
			
			if(response == "Syllabus modify fail"){
				alert('강의 계획서 수정에 실패하였습니다.');
			}else{
				alert(response);
				location.href = "SyllabusModify.jsp";	
			}
		}
	});

});

}


// 강의 계획서 삭제
function deleteSyllabus(event){
	$(document).ready(function (){
		var academic_num =  $(event.target).parent().siblings().get(0).innerText;
		
		$.ajax({
			url:"ajaxSyllabusDelete.jsp",
			type:"post",
			data:{
				academic_num: academic_num
			},
			success:function(response){
				if(response == "Syllabus remove fail"){
					alert('강의 계획서 삭제에 실패하였습니다.');
				}else{
					alert(response);
					location.href = "SyllabusDelete.jsp";	
				}
			}
		});
		
	});
}




