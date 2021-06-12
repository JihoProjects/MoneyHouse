<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <title>아파트 검색 페이지</title>

      <!-- Custom css -->
    <link href="css/custom.css" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZfdQwv6kw3YqjpTPj7AdoOSaBWK-vgsk&callback=initMap" async defer></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
    console.log("로드 완료");
    getAptName();
});

function getAptName() {

    $.ajax({
            url: 'houseSearch',
           type: "GET",
       datatype: "JSON",
        success: function(data) {
           $('#Apt').empty();
           $('#Apt').append('<option value="all">아파트</option>');
           $.each(data, function(i, d) {
               $('#Apt').append("<option>" + d + "</option>");
           });
       }
    
    });

}

function nameSearch() {

    var name = $("#Apt").val();

    console.log(name);

    if (name == "all") {
        console.log("전체 검색");
        name = "%";
    }

    $.ajax({
             url: 'nameSearch/' + name,
            type: "GET",
        datatype: "JSON",
         success: function(data) {
            $('#houseInfo').empty();
            $('#houseInfo').append('<h3 class="title">거래 정보</h3><div class="separator-2"></div>');
            $.each(data, function(i, d) {
                var iter = '';
                iter += '<div class="media margin-clear"><div class="media-body">';
                iter += '<h4><a href="javascript:moveMap(37.6665669,127.039578,17);">' + d.aptname + '</a></h4>';
                iter += '<h6 class="media-heading" id="deal">거래금액 : ' + d.dealamount + '만원</h6>';
                iter += '<h6 class="media-heading" id="deal">면적 : ' + d.area + '</h6>';
                iter += '<p class="small margin-clear"><i class="fa fa-calendar pr-10"></i>' + d.dealyear + '</p>';
                iter += '</div></div><hr>';
                $('#houseInfo').append(iter);
            });
        }

    });
}


                                //https://console.developers.google.com    key받기 위한 site
                                
                                /*  var locations = [
                                      ['도봉구'    ,   37.6658609  ,   127.0317674 ],
                                         ['은평구' ,   37.6176125  ,   126.9227004 ],
                                         ['동대문구'    ,   37.5838012  ,   127.0507003 ],
                                         ['동작구' ,   37.4965037  ,   126.9443073 ],
                                         ['금천구' ,   37.4600969  ,   126.9001546 ],
                                         ['구로구' ,   37.4954856  ,   126.858121  ],
                                         ['종로구' ,   37.5990998  ,   126.9861493 ],
                                         ['강북구' ,   37.6469954  ,   127.0147158 ],
                                         ['중랑구' ,   37.5953795  ,   127.0939669 ],
                                         ['강남구' ,   37.4959854  ,   127.0664091 ],
                                         ['강서구' ,   37.5657617  ,   126.8226561 ],
                                         ['중구'  ,   37.5579452  ,   126.9941904 ],
                                         ['강동구' ,   37.5492077  ,   127.1464824 ],
                                         ['광진구' ,   37.5481445  ,   127.0857528 ],
                                         ['마포구' ,   37.5622906  ,   126.9087803 ],
                                         ['서초구' ,   37.4769528  ,   127.0378103 ],
                                         ['성북구' ,   37.606991   ,   127.0232185 ],
                                         ['노원구' ,   37.655264   ,   127.0771201 ],
                                         ['송파구' ,   37.5048534  ,   127.1144822 ],
                                         ['서대문구'    ,   37.5820369  ,   126.9356665 ],
                                         ['양천구' ,   37.5270616  ,   126.8561534 ],
                                         ['영등포구'    ,   37.520641   ,   126.9139242 ],
                                         ['관악구' ,   37.4653993  ,   126.9438071 ],
                                         ['성동구' ,   37.5506753  ,   127.0409622 ],
                                         ['용산구' ,   37.5311008  ,   126.9810742 ]
                                 ]; */
                                
                                 var locations =[];
                                 
                                    locations.push(['    40,100', 37.6665669, 127.039578, "거성학마을아파트", "images/house.jpg"])
                                 
                                    locations.push(['    34,000', 37.6643234, 127.0268376, "극동아파트", "images/house.jpg"])
                                 
                                    locations.push(['    35,750', 37.6645833, 127.0450668, "금광포란재아파트", "images/house.jpg"])
                                 
                                    locations.push(['    69,500', 37.664974, 127.048155, "대상타운현대아파트", "images/house.jpg"])
                                 
                                    locations.push(['    17,500', 37.6626224, 127.0281621, "대원그린아파트", "images/house.jpg"])
                                 
                                    locations.push(['    50,000', 37.6636071, 127.0390268, "동부센트레빌아파트", "images/house.jpg"])
                                 
                                    locations.push(['    41,500', 37.6644054, 127.0302278, "동양크레오아파트", "images/house.jpg"])
                                 
                                    locations.push(['    12,000', 37.6674038, 127.0447699, "방학 지음재힐스", "images/house.jpg"])
                                 
                                    locations.push(['    60,000', 37.66856200000001, 127.0454839, "방학E.S.A1아파트", "images/house.jpg"])
                                 
                                    locations.push(['    52,000', 37.6663859, 127.0455878, "방학E.S.A2아파트", "images/house.jpg"])
                                 
                                    locations.push(['    49,000', 37.6664804, 127.0448997, "방학E.S.A3아파트", "images/house.jpg"])
                                 
                                    locations.push(['    74,500', 37.6668979, 127.0473902, "방학동삼성래미안1", "images/house.jpg"])
                                 
                                    locations.push(['    65,000', 37.6650641, 127.0458053, "방학동삼성래미안2", "images/house.jpg"])
                                 
                                    locations.push(['    36,000', 37.66029839999999, 127.0321807, "벽산아파트1", "images/house.jpg"])
                                 
                                    locations.push(['    39,400', 37.6587155, 127.0254295, "벽산아파트2", "images/house.jpg"])
                                 
                                    locations.push(['    24,000', 37.6638949, 127.037417, "부영팰리스", "images/house.jpg"])
                                 
                                    locations.push(['    50,000', 37.6634767, 127.0450526, "브라운스톤방학아파트", "images/house.jpg"])
                                 
                                    locations.push(['    26,500', 37.6611831, 127.0339317, "삼익세라믹아파트", "images/house.jpg"])
                                 
                                    locations.push(['    39,500', 37.6615064, 127.0358939, "성원아파트", "images/house.jpg"])
                                 
                                    locations.push(['    22,000', 37.6666657, 127.0337541, "성진파크뷰 아파트", "images/house.jpg"])
                                 
                                    locations.push(['    24,500', 37.666979, 127.0360873, "송학휴스테이", "images/house.jpg"])
                                 
                                    locations.push(['    27,500', 37.6609614, 127.0265811, "신동아아파트1", "images/house.jpg"])
                                 
                                    locations.push(['    27,500', 37.6609614, 127.0265811, "신동아아파트1", "images/house.jpg"])
                                 
                                    locations.push(['    27,500', 37.6609614, 127.0265811, "신동아아파트1", "images/house.jpg"])
                                 
                                    locations.push(['    27,500', 37.6609614, 127.0265811, "신동아아파트1", "images/house.jpg"])
                                 
                                    locations.push(['    27,500', 37.6609614, 127.0265811, "신동아아파트1", "images/house.jpg"])
                                 
                                    locations.push(['    37,500', 37.6591068, 127.0234943, "신동아아파트2", "images/house.jpg"])
                                 
                                    locations.push(['    39,500', 37.660255, 127.0232072, "신동아아파트3", "images/house.jpg"])
                                 
                                    locations.push(['    27,300', 37.6626197, 127.0299133, "신동아아파트4", "images/house.jpg"])
                                 
                                    locations.push(['    38,500', 37.6633879, 127.0286599, "신동아아파트5", "images/house.jpg"])
                                 
                                    locations.push(['    31,800', 37.66216989999999, 127.0287936, "신동아타워아파트", "images/house.jpg"])
                                 
                                    locations.push(['    21,000', 37.664066, 127.0359776, "신주아파트(A동)", "images/house.jpg"])
                                 
                                    locations.push(['    16,800', 37.6641579, 127.0360852, "신주아파트B", "images/house.jpg"])
                                 
                                    locations.push(['    31,300', 37.6578986, 127.023934, "우성아파트1", "images/house.jpg"])
                                 
                                    locations.push(['    36,700', 37.6568265, 127.0219908, "우성아파트2", "images/house.jpg"])
                                 
                                    locations.push(['    42,500', 37.6637245, 127.0456082, "우암쎈스뷰아파트", "images/house.jpg"])
                                 
                                    locations.push(['    36,500', 37.6575265, 127.0260117, "청구아파트", "images/house.jpg"])
                                 
                                    locations.push(['    36,500', 37.6575265, 127.0260117, "청구아파트", "images/house.jpg"])
                                 
                                    locations.push(['    10,300', 37.6674352, 127.043873, "퍼스티안", "images/house.jpg"])
                                 
                                    locations.push(['    29,000', 37.66122259999999, 127.0316077, "한화/성원아파트", "images/house.jpg"])
                                 
                                    locations.push(['    40,500', 37.6613225, 127.0329087, "효성하이타운아파트", "images/house.jpg"])
                                 

                                var map = null;
                                var latitude;
                                var longitude;
                                
                                
///////////////////////////////////////////////////event 설정 및 초기 설정


                                
                                function processGuResult(jsondata, status, xhr){
                                    console.log('결과 도착')
                                    var list = jsondata;
                                    console.log(list)
                                    var contents = $('#gu');
                                    contents.empty();               //기존에 내용이 있으면 비우기 
                                    $('<option value="all">시/구/군</option>').appendTo(contents)
                                        $.each(list, function(index, item) {
                                            $('<option value="'+item.dongcode+'">'+item.gugun+'</option>').appendTo(contents)
                                        })
                                }
                                
                                function processDongResult(jsondata, status, xhr){
                                    console.log('결과 도착')
                                    var list = jsondata;
                                    console.log(list)
                                    var contents = $('#dong');
                                    contents.empty();               //기존에 내용이 있으면 비우기
                                     $('<option value="all">동</option>').appendTo(contents)
                                        $.each(list, function(index, item) {
                                            $('<option value="'+item.dong+'">'+item.dong+'</option>').appendTo(contents)
                                        })
                                        var paramDong = '방학동';
                                        if(paramDong){
                                             $('#dong').val(paramDong).prop('selected',true);
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
                            icon    :       locations[i][4],
                            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                            map: map
                          });

                          google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                              infowindow.setContent("<center>["+locations[i][3]+"]<br>거래가 : "+locations[i][0]+"만원</center>");
                              infowindow.open(map, marker);
                            }
                          })(marker, i));
                           }
                        }
                                }
                                 
                                function processSearchAptResult(jsondata, status, xhr){
                                    var type=['','아파트 매매','아파트 전월세','다세대 매매','다세대 전월세'];
                                    console.log('결과 도착')
                                    var list = jsondata;
                                    console.log(list)
                                    var contents = $('#houseInfo');
                                    contents.empty();               //기존에 내용이 있으면 비우기
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
                                /*  //맵에서 위치 표시하기 위한 정보 
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
            <li><a href="/">Home</a></li>
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
            <form class="form-inline" id="frm"  >
                <!-- <input type="hidden" id="code"  name="code" value="code"/> -->
                <div class="form-group md">
                    <select class="form-control" name="Apt" id="Apt">
                        <option value="all">아파트</option>
                    </select>
                    
                </div>
            </form>
            <button id="search" onclick="nameSearch()">검색하기</button>
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
        <aside class="col-lg-12 order-lg-12">
            <div class="sidebar">
                <div class="block clearfix" id="houseInfo"></div>
            </div>
        </aside>
           


        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

<c:import url="common/footer.jsp"/>
</body>

</html>