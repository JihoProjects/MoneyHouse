<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>

<!-- META DATA -->
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Favicons -->
<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets/css/style.css" rel="stylesheet">

</head>

<!-- 로그인 처리 -->
<script type="text/javascript">
    $(document).ready(function() {
        //로그아웃 기능.
         $("#logout").click(function(){
            location.href="logout";
            alert("로그아웃 성공!!");
        }); 
        
        //비밀번호 찾기 기능.
        $("#findpass").click(function(){
            location.href = "user/findPass";
        });
    });
</script>

<!-- HEADER -->
<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

        <h1 class="logo">
            <a href="/">HAPPY HOUSE</a>
        </h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav class="nav-menu d-none d-lg-block">

            <ul>
                <li class="active"><a href="Notice.html">공지 사항</a></li>

                <li class="drop-down"><a href="#">오늘의 뉴스</a>
                    <ul>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="team.html">Team</a></li>
                        <li><a href="testimonials.html">Testimonials</a></li>

                        <li class="drop-down"><a href="#">Deep Drop Down</a>
                            <ul>
                                <li><a href="#">Deep Drop Down 1</a></li>
                                <li><a href="#">Deep Drop Down 2</a></li>
                                <li><a href="#">Deep Drop Down 3</a></li>
                                <li><a href="#">Deep Drop Down 4</a></li>
                                <li><a href="#">Deep Drop Down 5</a></li>
                            </ul></li>
                    </ul></li>

                <li><a href="SearchAir.mvc">관심 지역 대기 상황</a></li>
                <li><a href="favoriteArea.mvc">관심 지역 설정</a></li>
                <li><a href="SearchrArcade.mvc">관심지역 둘러보기</a></li>
                
                <!--   <li><a href="blog.html">Blog</a></li>
      <li><a href="contact.html">Contact</a></li> -->

            </ul>

        </nav>
        <!-- nav-menu -->
        <!-- Login Button start -->
        <div id="button-on" class="col-lg-3 text-right">
            <a href="/qnalist">
                <button type="button" class="btn btn-primary">QnA</button>
            </a>
            <c:if test="${empty id}">
                <a href="#login" style="color: white" data-toggle="modal">
                    <button type="button" class="btn btn-success">로그인</button>
                </a>
                <a href="join" style="color: white">
                    <button type="button" class="btn btn-info">회원가입</button>
                </a>
	        </c:if>
	        <c:if test="${!empty id}">
                <a href="logout" style="color: white" data-toggle="modal">
                    <button id ="logout" type="button" class="btn btn-danger">로그아웃</button>
                </a>
                
                <a href="user/info" style="color: white">
                    <button type="button" class="btn btn-info">회원정보</button>
                </a>
	        </c:if>
        </div>
        <!-- Login Button end -->
    </div>
</header>




<!-- Login modal start -->
<div id="login" class="modal fade">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">로그인</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="login" method="post">
                    <div class="form-group has-feedback row">
                        <label for="inputId"
                            class="col-md-3 control-label text-md-right col-form-label">아이디
                            <span class="text-danger small">*</span>
                        </label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="inputId"
                                placeholder="" required="" name="id"> <i id="idfeed"
                                class="fa fa-pencil form-control-feedback pr-4"></i>
                        </div>
                    </div>
                    <div class="form-group has-feedback row">
                        <label for="inputPassword"
                            class="col-md-3 control-label text-md-right col-form-label">비밀번호
                            <span class="text-danger small">*</span>
                        </label>
                        <div class="col-md-8">
                            <input type="password" class="form-control" id="inputPassword" placeholder="" required="" name="pw">
                            <i id="passfeed" class="fa fa-pencil form-control-feedback pr-4"></i>
                        </div>
                    </div>
                    
                    <div class="form-group container justify-content-end" style="display:flex">
                        <button id="findpass" type="button" class="btn btn-warning" data-dismiss="modal">비밀번호 찾기</button>
                    </div>
                    
                    <div class="modal-footer" style="justify-content: space-between">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-group btn-animated btn-success">로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Login modal end-->
