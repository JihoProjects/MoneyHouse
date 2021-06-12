<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>실거래가 검색</title>

      <!-- Custom css -->
    <link href="css/custom.css" rel="stylesheet">
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZfdQwv6kw3YqjpTPj7AdoOSaBWK-vgsk&callback=initMap" async defer></script>
<script type="text/javascript">

function citychange() {

    var city = $("#city").val();
	
	console.log(city);

	$.ajax({
            url: "citySearch/" + city,
           type: "GET",
       datatype: "JSON",
		success: function(data) {
			$('#gu').empty();
			$('#gu').append('<option>시/구/군</option>');
			$.each(data, function(i, d) {
			    $('#gu').append($("<option>" + d + "</option>"));
			});
		}
	});

}

function guchange() {

    var gu = $("#gu").val();
	
	console.log(gu);
	
	$.ajax({
	         url: 'gugunSearch/' + gu,
	        type: "GET",
		datatype: "JSON",
		 success: function(data) {
			$('#dong').empty();
			$('#dong').append('<option>동</option>');
			$.each(data, function(i, d) {
                $('#dong').append($("<option>" + d + "</option>"));
            });
		}
	});
}

function dongchange() {

    var dong = $("#dong").val();

    console.log(dong);

    $.ajax({
             url: 'dongSearch/' + dong,
            type: "GET",
        datatype: "JSON",
         success: function(data) {
             $('#houseInfo').empty();
             $('#houseInfo').append('<h3 class="title">거래 정보</h3><div class="separator-2"></div>');

             $.each(data, function(i, d) {
                 var iter = '';
                 iter += '<div class="media margin-clear"><div class="media-body">';
                 iter += '<h4><a href="javascript:moveMap(37.6665669,127.039578,17);">' + d.aptname + '</a></h4>';
                 iter += '<h6 class="media-heading" id="deal">거래금액 : ' + d.dealamount + '</h6>';
                 iter += '<h6 class="media-heading" id="deal">면적 : ' + d.area + '</h6>';
                 iter += '<p class="small margin-clear"><i class="fa fa-calendar pr-10"></i>' + d.dealyear + '</p>';
                 iter += '</div></div><hr>';
                 $('#houseInfo').append(iter);
             });
         }
    });

}

///////////////////////////////////////////////////맵 설정
								function initMap() {
									//getLocation();
									var opt = {
										// google map에 중앙으로 표시할 좌표 설정
										center : {lat:37.6666657,lng: 127.0337541},
										zoom : 15,  //0~ 21  큰 값일 수록  zooming
									};
									//google.maps.Map(map을 그릴 영역, 옵션정보 );
									map = new google.maps.Map(document.getElementById("map"), opt);
									
									var infowindow = new google.maps.InfoWindow();
									
									
					    var marker, i;
					    for (i = 0; i < locations.length; i++) {  
					      marker = new google.maps.Marker({
					        id:i,
					        title : locations[i][3],
					        label : locations[i][0],
					        icon	:		locations[i][4],
					        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
					        map: map
					      });

					      google.maps.event.addListener(marker, 'click', (function(marker, i) {
					        return function() {
					          infowindow.setContent("<center>["+locations[i][3]+"]<br>거래가 : "+locations[i][0]+"만원</center>");
					          infowindow.open(map, marker);
					        }
					      })(marker, i));
					      if(marker)
					      {
					        marker.addListener('click', function() {
					        	 
					        	$.ajax({
																			 url: 'searchAllHouseDeal.do'
																			,data:{
																					dongcode : '11320',
																					aptname:this.title,
																			}
																			,dataType:'json'
																			,success : processSearchAptResult
																			,error   : function(err) {
																				console.log(err);
																			}
																		}) 
															console.log('title:',this.title);
															console.log('lable:',this.label);
					          map.setZoom(16);
					          map.panTo(this.getPosition());
					        });
					       }
					    }
								}
				                 
								function processSearchAptResult(jsondata, status, xhr){
									var type=['','아파트 매매','아파트 전월세','다세대 매매','다세대 전월세'];
									console.log('결과 도착')
									var list = jsondata;
									console.log(list)
									var contents = $('#houseInfo');
									contents.empty();				//기존에 내용이 있으면 비우기
									 $('<h3 class="title">거래 정보</h3><div class="separator-2"></div><h5>'+list[0].aptName+'</h5><hr>').appendTo(contents);
										$.each(list, function(index, item) {
											var html='<div class="media margin-clear"><div class="media-body">'
											html+='<h6 class="media-heading">거래금액 :'+item.dealAmount+'</h6>'
											html+='<h6 class="media-heading">전용면적: '+item.area+'</h6>'
											html+='<h6 class="media-heading">거래구분 :'+type[item.type]+'</h6>'
											html+='<p class="small margin-clear"><i class="fa fa-calendar pr-10"></i>'+item.dealYear+'.'+item.dealMonth+'.'+item.dealDay+'</p><hr>'
											$(html).appendTo(contents)
										})
								}
								
								/// 현재 위치를 최초위치로.
								
								function showLocation(position) {
									latitude = position.coords.latitude;
									longitude = position.coords.longitude;
									//alert("Latitude : " + latitude + " Longitude: " + longitude);
									//현재 위치 정보를 center로 지정하기 위해 객체 생성
									var hear = new google.maps.LatLng(latitude, longitude);
									map.panTo(hear); //위치 정보를 통해 맵에 표시 
									
								/* 	
									for (var i = 0; i < results.features.length; i++) {
		          var coords = results.features[i].geometry.coordinates;
		          var latLng = new google.maps.LatLng(coords[1],coords[0]);
		          var marker = new google.maps.Marker({
		            position: latLng,
		            map: map
		          });
		        }
									 */
								/* 	//맵에서 위치 표시하기 위한 정보 
									var marker = new google.maps.Marker({
									    position: hear,
									    title:"I'm hear!",
									    map: map
									}); */
								
								}
							
								function errorHandler(err) {
									if (err.code == 1) {
										alert("Error: Access is denied!");
									} else if (err.code == 2) {
										alert("Error: Position is unavailable!");
									}else if(err.code == 3){
										alert("Erro : Time out");
									}
								}
								function getLocation() {
									if (navigator.geolocation) {
										var options = {
											timeout : 60000,
											enabledHighAccuracy :true
										};
										navigator.geolocation.getCurrentPosition(showLocation,
												errorHandler, options);
									} else {
										alert("Sorry, browser does not support geolocation!");
									}
								}
								
								
								function moveMap(Lat, Lon, Zoomlevel) {
									map.setZoom(15);
									setTimeout(function() {										
								    var moveLatLon = new google.maps.LatLng(Lat,Lon);
								    map.panTo(moveLatLon);
								    map.setZoom(Zoomlevel);
									}, 1000);
								};
								
								</script>

</head>

<body>
<c:import url="common/header.jsp"/>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>거래 정보</h2>
          <ol>
            <li><a href="index.mvc">Home</a></li>
            <li>거래 정보</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    
      
  <!--지역 검색 을 위한 검색 창 -->
	<div class="dark-bg section" style ="padding : 20px; background-color :#f2f2f2">
     <div class="container-fluid">
          <!-- filters start -->
     <div class="sorting-filters text-center mb-10 d-flex justify-content-center">
     <form class="form-inline" id="frm"  action="searchRecentHouseDeal.do">
			  <!-- <input type="hidden" id="code"  name="code" value="code"/> -->
              <div class="form-group md">
                <select class="form-control" name="city" id="city" onchange="citychange();">
                		<option value="all" >도/광역시</option>
		                  <option value="서울특별시" >서울시</option>
		                  <option value="경기도" >경기도</option>
		                  <option value="인천광역시" >인천광역시</option>
		                  <option value="부산광역시" >부산광역시</option>
		                  <option value="대전광역시" >대전광역시</option>
		                  <option value="대구광역시" >대구광역시</option>
		                  <option value="울산광역시" >울산광역시</option>
		                  <option value="세종특별자치시" >세종시</option>
		                  <option value="광주광역시" >광주광역시</option>
		                  <option value="강원도" >강원도</option>
		                  <option value="충청북도" >충청북도</option>
		                  <option value="경상북도" >경상북도</option>
		                  <option value="경상남도" >경상남도</option>
		                  <option value="전라북도" >전라북도</option>
		                  <option value="전라남도" >전라남도</option>
		                  <option value="제주특별자치도" >제주도</option>
                </select>
              </div>
              <div class="form-group md-1">
                <select class="form-control" name="dongcode" id="gu" onchange="guchange();">
                  <option value="all" >시/구/군</option>
                </select>
              </div>
              <div class="form-group md-1">
                <select class="form-control" name="dong" id="dong" onchange="dongchange()">
                  <option value="all" >동</option>
                </select>
              </div>
            </form>
          </div>
          <!-- filters end -->
        </div>
      </div>
 	 <!--지역 검색 을 위한 검색 창 end-->
  
    <!-- ======= Contact Section ======= -->
    <section style ="padding : 20px; " id="contact" class="contact" >
      <div class="container">

        <div>
          <iframe style=" border:0; width: 100%; height: 500px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
        </div>

        <div class="row mt-5">

          <!-- <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="icofont-google-map"></i>
                <h4>Location:</h4>
                <p>A108 Adam Street, New York, NY 535022</p>
              </div>

              <div class="email">
                <i class="icofont-envelope"></i>
                <h4>Email:</h4>
                <p>info@example.com</p>
              </div>

              <div class="phone">
                <i class="icofont-phone"></i>
                <h4>Call:</h4>
                <p>+1 5589 55488 55s</p>
              </div>

            </div>

          </div> -->
          <aside class="col-lg-6 order-lg-6">
              <div class="sidebar">
                <div class="block clearfix" id="houseInfo">
                  <h3 class="title">거래 정보</h3>
                  <div class="separator-2"></div>
                  
                  
                  <div class="media margin-clear">
                    <div class="media-body">
                    		<h4><a href="javascript:moveMap(37.6665669,127.039578,17);">거성학마을아파트</a></h4>
                      <h6 class="media-heading" id="deal">거래금액 :     40,100만원</h6>
                      <h6 class="media-heading" id="deal">면적: 84.93</h6>
                      <p class="small margin-clear">
                        <i class="fa fa-calendar pr-10"></i>2019. 12. 3</p>
                    </div>
                  </div>
                  <hr>
                </div>
              </div>
            </aside>

          <!-- <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-6 form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                  <div class="validate"></div>
                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>

          </div> -->

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

<c:import url="common/footer.jsp"/>
</body>

</html>