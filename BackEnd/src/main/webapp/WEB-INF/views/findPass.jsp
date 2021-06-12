<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Sailor Bootstrap Template - Index</title>

<!-- Login JS Start. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		customerSelect();//한 사람 선택시 처리할 이벤트 등록
		
/* 		//비밀번호 찾기 수행 기능.
		$("#find").click(function(){
			var account = localStorage.getItem("account");
			if(account == null){
				$("#hero").hide();
				$(".hero_off").show();
				$("#passinfo").html(`<h2 style="color:red;">찾으시는 아이디가 잘못되었습니다.</h2>`);
				return;
			}
			account = JSON.parse(account);
			id = $("#inputId").val();
			name = $("#inputUserName").val();
			tel = $("#inputTel").val();
			lid = account.id;
			lname = account.name;
			ltel = account.tel;
			
			console.log(id +" "+ lid +" " + name +" " + lname +" " + ltel +" " + tel);
			
			if(id != lid || name != lname || ltel != tel){
				$("#hero").hide();
				$(".hero_off").show();
				$("#passinfo").html(`<h2 style="color:red;">찾으시는 아이디가 없습니다..</h2>`);
				return;
			}
			
			lpass = account.pass;
			$("#hero").hide();
			$(".hero_off").show();
			$("#passinfo").html(`<h2 style="color:black;">찾으시는 비밀번호 : ${lpass}</h2>`);
		});
		
		//돌아가기.
		$("#back").click(function(){
			$("#hero").show();
			$(".hero_off").hide();
		}); */
	});
	
	function customerSelect() {			
		$("#find").click(function(){
			//var num = $(this).find('#hidden_num').val();
			
			var id = $("#inputSId").val();
			
			var name = $("#inputUserName").val();
			
			var phone = $("#inputTel").val();
			
			
			console.log( id ,name ,phone );
			
			//ajax 요청
			$.ajax({
				url:'findPass',
				type:'post',
				data: JSON.stringify({ //data to server
					id : id,
					name : name,
					phone : phone				
				}),
				contentType:'application/json',
				
				success: customerSelectResult,
				error : function(xhr,status,message) {
					alert("찾을 수 없음"+ xhr.status);

				}
			});			
		});			
	}//customerSelect
	
	function customerSelectResult(data){
		
		lpass = data.password;
		//console.log("333"+lpass);
		$("#hero").hide();
		$(".hero_off").show();
		var msg = "<h2 style = 'color:black'>찾으시는 비밀 번호  "+lpass + "</h2>";
		//$("#passinfo").html(`<h2 style="color:black;">찾으시는 비밀번호 : ${lpass} </h2>`);
		$("#passinfo").html(msg);
	}
</script>
<!-- Login JS End -->

<body>
<c:import url="common/header.jsp"/>
	
	<!-- FindForm Start -->
	<section id="hero">
		<nav id="loc_nav" class="container" aria-label="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item active aria-current="">findPass</li>
			</ol>
		</nav>

		<div class="form-block container justify-config-center" style="background-color:#e6e6e6; padding:10px; border-radius: 1rem">
			<h2 style="color:black" class="title">비밀번호 찾기</h2>

			<form class="form-horizontal" action="index.html" method="post">
				<div class="form-group has-feedback row">
					<label for="inputId"
						class="col-md-3 control-label text-md-right col-form-label">아이디
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputSId"
							placeholder="" required="" name="id"> <i
							class="fa fa-pencil form-control-feedback pr-4"></i>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputUserName"
						class="col-md-3 control-label text-md-right col-form-label">이름
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputUserName"
							placeholder="User Name" required="" name="name"> <i
							class="fa fa-user form-control-feedback pr-4"></i>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputPassword"
						class="col-md-3 control-label text-md-right col-form-label">전화번호
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputTel"
							placeholder="010-xxxx-xxxx" required="" name="tel"> <i
							class="fa fa-lock form-control-feedback pr-4"></i>
					</div>
				</div>
			</form>
				<div class="form-group row justify-content-center">
					<button id="find" class="btn btn-group btn-warning btn-animated">
						찾기 <i class="fa fa-check"></i>
					</button>
				</div>
		</div>
	</section>
	<!-- result -->
	<section id="hero" class="hero_off" style="display:none">
		<nav id="loc_nav" class="container" aria-label="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index">Home</a></li>
				<li class="breadcrumb-item active aria-current="">findPass</li>
			</ol>
		</nav>

		<div class="form-block container justify-config-center" style="background-color:#e6e6e6; padding:10px; border-radius: 1rem">
			<h2 style="color:black" class="title" >비밀번호 찾기</h2>
				<div id="passinfo" class="form-group has-feedback row" style="display:flex;justify-content:center">
				</div>
			<div class="form-group row justify-content-center">
					<button id="back" class="btn btn-group btn-warning btn-animated">
						돌아가기 <i class="fa fa-check"></i>
					</button>
				</div>
		</div>
		
	</section>
	<!-- FindForm end -->


<c:import url="common/footer.jsp"/>
</body>
</html>