<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href = "${pageContext.request.contextPath}/css/style.css?after">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet:wght@500&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class = "header">
    <div class="header-top">
    	<div class = header-top-left>
           <a href="#">VIP LOUNGE</a>
		   <a href="#">멤버십</a>
		   <a href="#">고객센터</a>
        </div>
        <div class = header-top-right>
        
           <c:choose>
		        <c:when test="${not empty sessionScope.id}">
         			<span style="font-size:14px;">${sessionScope.id}</span>님 환영합니다 <a href="movie?command=logoutmember">로그아웃</a>
		        </c:when>
		        <c:otherwise>
		            <a href="movie?command=loginmember">로그인</a>
      				<a href="movie?command=create_member">회원가입</a>
		        </c:otherwise>
			</c:choose>
            <a href="movie?command=reserve_main">빠른예매</a>   
        </div>
    </div>
	        <div class ="search-layout" id = "search-layout-id">
		    	<div class ="list-container-1">
		            <div class="flex-box">
		             	<div class="search-movie-form-layout">
		                    <form action="movie" method="get">
		                        <input type ="hidden" name="command" value="search">
		                        <input type ="text" class="search-movie-form-layout-search-btn" placeholder="영화를 검색하세요">
		                        <span class="material-symbols-outlined">search</span>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		<div class="mypagePop" id="mypagepopid">
	        <c:choose>
	        	<c:when test="${not empty sessionScope.id}">
					<div class="loginedMypagePop ">
					    <div class="mypageBox">
					        <p >안녕하세요!</p>
					        <p>${sessionScope.id} 회원님</p>
					        <div class="mypageBtn"><a href="movie?command=member_info"><button class="loginedButton">나의 메가박스</button></a></div>
					    </div>
					    <div class="mypageBox memberInfoBtn myBtn2 ">
					        <p>Point</p>
					        <p class="dbPoint">-</p>
					        <div class="mypageBtn"><a href="movie?command=member_info"><button class="loginedButton">멤버십 포인트</button></a></div>
					    </div>
					    <div class="mypageBox memberInfoBtn ">
					        <p>예매</p>
					        <p class="dbPoint">0건</p>
					        <div class="mypageBtn"><a href="movie?command=member_info"><button class="loginedButton">예매내역</button></a></div>
					    </div>
					    <div class="mypageBox memberInfoBtn">
					        <p>구매</p>
					        <p class="dbPoint">0건</p>
					        <div class="mypageBtn"><a href="movie?command=member_info"><button class="loginedButton">구매내역</button></a></div>
					    </div>
					</div>
	        	</c:when>
	        	<c:otherwise>
		        	<div class="popConatiner">
			            <p class="loginPopTop">로그인 하시면 나의 슈퍼박스를 만날 수 있어요. <br/>
			                영화를 사랑하는 당신을 위한 꼭 맞는 혜택까지 확인해 보세요!</p>
			            <p><button class="loginPopButton" onclick="location='movie?command=loginmember'">
			                로그인
			            </button></p>
			            <p class="loginPopBottom"> <a href="movie?command=create_member"> 아직 회원이 아니신가요? </a></p>
			        </div>
	        	</c:otherwise>
	        </c:choose>
	    </div>
    <div class ="sitemap-layout" id="sitemap-layout-id">
        <div class = "sitemap-container">
	            <div class="sitemap-title">
		            SITEMAP
	            </div>
	            <div class = "sitemap-contents">
				<div class="item">
					<div class="contents">
					<p>영화</p>
					   <ul class="list-depth">
					       <li><a href="movie?command=list" title="전체영화">전체영화</a></li>
					       <li><a href="#" title="무비포스트">무비포스트</a></li>
					   </ul>
					</div>
				
					<div class="contents">
					<p>예매</p>
					   <ul class="list-depth">
					       <li><a href="movie?command=reserve_main" title="빠른예매">빠른예매</a></li>
					       <li><a href="movie?command=totalreserve" title="상영시간표">상영시간표</a></li>
					   </ul>
					</div>
				
					<div class="contents">
					<p >극장</p>
					   <ul class="list-depth">
					       <li><a href="movie?command=theaterList" title="전체극장">전체극장</a></li>
					   </ul>
					</div>
				
					<div class="contents">
					<p>이벤트</p>
					   <ul class="list-depth">
					       <li><a href="#" title="진행중 이벤트">진행중 이벤트</a></li>
					       <li><a href="movie?command=lastevent" title="지난 이벤트">지난 이벤트</a></li>
					       <li><a href="#" title="당첨자 발표">당첨자발표</a></li>
					   </ul>
					</div>
				
					<div class="contents">
					<p>스토어</p>
					   <ul class="list-depth">
					       <li><a href="#" title="새로운 상품">새로운상품</a></li>
					       <li><a href="#" title="슈퍼티켓">슈퍼티켓</a></li>
					       <li><a href="#" title="슈퍼찬스">슈퍼찬스</a></li>
					       <li><a href="#" title="팝콘/음료/굿즈">팝콘/음료/굿즈</a></li>
					   </ul>
					</div>
					
					<div class="contents">
					<p >나의 메가박스</p>
					   <ul class="list-depth">
					       <li><a href="#" title="나의 슈퍼박스 홈">나의 슈퍼박스 홈</a></li>
					       <li><a href="#" title="예매/구매내역">예매/구매내역</a></li>
					       <li><a href="#" title="영화관람권">영화관람권</a></li>
					       <li><a href="#" title="스토어교환권">스토어교환권</a></li>
					       <li><a href="#" title="멤버십포인트">멤버십포인트</a></li>
						   <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li>
						   <li><a href="#" title="나의 이벤트 응모내역">나의 이벤트 응모내역</a></li>
					       <li><a href="#" title="나의 문의내역">나의 문의내역</a></li>   
					       <li><a href="#" title="회원정보">회원정보</a></li>        	       
					   </ul>
					</div>
				<!-- 여기서 줄바꿈 -->
				
					<div class="contents">
					<p>혜택</p>
					   <ul class="list-depth">
					       <li><a href="#" title="멤버십 안내">멤버십 안내</a></li>
					       <li><a href="#" title="제휴/할인">제휴/할인</a></li>
					   </ul>
					</div>
					
					<div class="contents">
					<p >고객센터</p>
					   <ul class="list-depth">
					       <li><a href="#" title="빠른예매">고객센터 홈</a></li>
					       <li><a href="#" title="빠른예매">자주묻는질문</a></li>
					       <li><a href="#" title="빠른예매">공지사항</a></li>
					       <li><a href="#" title="빠른예매">1:1문의</a></li>
					       <li><a href="#" title="빠른예매">단체/대관문의</a></li>	   
					       <li><a href="#" title="빠른예매">분실물문의</a></li>	           
					   </ul>
					</div>
				
					<div class="contents">
					<p >회사소개</p>
					   <ul class="list-depth">
					       <li><a href="#" title="빠른예매">사회공헌</a></li>
					       <li><a href="#" title="빠른예매">인재채용</a></li>
					       <li><a href="#" title="빠른예매">윤리경영</a></li>
					   </ul>
					</div>
				
					<div class="contents">
					<p>이용정책</p>
					   <ul class="list-depth">
					       <li><a href="#" title="빠른예매">이용약관</a></li>
					       <li><a href="#" title="빠른예매">위치기반서비스 이용약관</a></li>
					       <li><a href="#" title="빠른예매">개인정보처리방침</a></li>
					   </ul>
					</div>
				</div>
				</div>
				</div>
			</div>

    <div class="header-middle">

        <div class = "menu">
            <ul class = "menu-ul">
                <li class = "menu-li-btn">
                    <span class="material-symbols-outlined" id="sitemap-icon">menu</span>
                    <span class="material-symbols-outlined" id="sitemap-icon-cancle">cancel</span>
                </li>
                
                <li class = "menu-li-btn">
                    <span class="material-symbols-outlined" id="search-icon">search</span>
                    <span class="material-symbols-outlined" id="search-icon-cancle">cancel</span>
                </li>
                
                <li class = "menu-ul-li">
                    영화
                    <div class = "depth_1">
                        <div class = "depth_1_item">
                        <div class = "seperate">
                            <div class ="seperate_1">
                                <a href="movie?command=list">전체영화</a>
                                <a>무비포스트</a>
                            </div>
                        </div>
                        </div>
                     </div>
                </li>
                <li class = "menu-ul-li">
                    예매
                    <div class = "depth_1">
                        <div class = "depth_1_item">
                        <div class = "seperate">
                            <div class ="seperate_2">
                                <a href="movie?command=reserve_main">빠른예매</a>
                                <a href="movie?command=totalreserve">상영시간표</a>
                            </div>
                        </div>
                        </div>
                     </div>
                </li>
                <li class = "menu-ul-li">
                    극장
                    <div class = "depth_1">
                        <div class = "depth_1_item">
                        <div class = "seperate">
                            <div class ="seperate_3">
                                <a href="movie?command=theaterList">전체극장</a>
                                <a>준비중</a>
                            </div>
                        </div>
                        </div>
                     </div>
                </li>
                <li><a href="movie?command=main">
                	<img style="width:200px; height:25px" src="${pageContext.request.contextPath}/img/logo/logo.JPG" alt="로고"></a>
                </li>
                <li class = "menu-ul-li">
                    이벤트
                    <div class = "depth_1">
                        <div class = "depth_1_item">
                        <div class = "seperate">
                            <div class ="seperate_4">
                                <a>진행중 이벤트</a>
                                <a href="movie?command=lastevent">종료된 이벤트</a>
                                <a>당첨자 발표</a>
                            </div>
                        </div>
                        </div>
                     </div>
                </li>
                <li class = "menu-ul-li" onclick ='location.href="movie?command=storeMain"'>스토어</li>
                <li class = "menu-ul-li">
                    혜택
                    <div class = "depth_1">
                        <div class = "depth_1_item">
                        <div class = "seperate">
                            <div class ="seperate_5">
                                <a>제휴/할인</a>
                                <a>멤버십</a>
                            </div>
                        </div>
                        </div>
                     </div>
                </li>
                <li class = "menu-li-btn">
					<a href="movie?command=totalreserve"><span style="color: black"class="material-symbols-outlined" id="calendar-icon">calendar_month</span></a>
                </li>
                <li class = "menu-li-btn">
                	<span class="material-symbols-outlined" id="person-icon">person</span>
					<span class="material-symbols-outlined" id="person-icon-cancle">cancel</span>
                </li>
            </ul>
        </div> 
    </div>
</div>
<script async type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>