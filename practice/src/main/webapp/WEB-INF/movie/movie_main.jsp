<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/css/style.css?after">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet:wght@500&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Movie list</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<c:choose>
      	<c:when test="${param.error eq 'no_member'}">
				<div class="commentmodal login_error_modal_box">
					<div class="invalid_access_login_modal_box">
				    	<div style="width:100%; height: 35px; background-color: #993399; margin-bottom: 50px; text-align: end">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="35" fill="white" class="bi bi-x-circle-fill" viewBox="0 0 16 16" style="margin-right: 5px;"  id="modal_cancle">
						  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
						</svg>
				    	</div>
						로그인이 필요한 서비스입니다.<br/>
						<button class="modal_login_btn" onclick='location="movie?command=loginmember"'>로그인</button>
				    </div>
				</div>
      	</c:when>
	   	<c:otherwise>
	   	</c:otherwise>
</c:choose>
    <div class="main-movie-1">
        <div class = "container">
            <div class = "boxofice">
                <h4>박스오피스</h4>
            </div>
            <a class="text-right" href="movie?command=list">
                <p> 더 많은 영화보기+</p>
            </a>
            <div class = "main-movie">
            
            
            <c:forEach var="i" begin="0" end="3" step="1">
                <div class="wrapper-0">
                    <a style="text-decoration:none;" href="movie?command=view&movie_id=${list[i].id}">
                    <div class="wrapper">
                        <div class="main-movie-image-box">
                            <img class="main-background-img" src = "${pageContext.request.contextPath}/img/poster/${list[i].img}">
                            <div class="main-movie-rank">${i+1}</div>
                        </div>
                        <div class="movie-content">
                            
                            <div class="movie-content-1">
                                <p>${list[i].content}</p>
                            </div>
                            
                            <div class="movie-content-2">
                                <p>관람평<span class="main-score">${list[i].score}</p></span>
                            </div>

                        </div>
                    </div>
                    </a>
                    <div class = "btn-1">
                     
                     	<form action="movie" method="post" id="liketable">
						 <input type="hidden" name="command" value="createliketable">
						 <input type="hidden" name="movieId" value="${list[i].id}">
						 <button type="submit"class="btn-1-2"><span class="material-symbols-outlined">favorite</span>${list[i].like}</button>
						 </form>
                     
                       

                    </div>
                    <div class = "btn-1">
                        <button class="btn-1-1" onclick='location.href="movie?command=totalreserve"'>예매하기</button>
                    </div>
                </div>
                </c:forEach>
 

            </div>
            <div class="container-2">
                <div class = "main-tool-btn">
                    <div class = "main-tool-btn-wrapper">
                    <ul>
                        <li>
                            <form action = "#" method="get">
                                <input class ="main-search" type="text" placeholder="영화명을 입력해주세요">
                                <button class = "tool-btn-1" type ="submit"><span class="material-symbols-outlined" id="tool-btn-1-id">search</span></button>
                            </form>
                        </li>
                        <a href="movie?command=totalreserve"><li><span class="material-symbols-outlined tool-btn-icon">calendar_month</span><p>상영시간표</p></li></a>
                        <a href="movie?command=list"><li><span class="material-symbols-outlined tool-btn-icon">theaters</span><p>박스오피스</p></li></a>
                        <li><span class="material-symbols-outlined tool-btn-icon">confirmation_number</span><p><a href="movie?command=reserve_main" style="color:inherit">빠른예매</a></p></li>
                    </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-movie-2">
		<div class="container" style="text-align: start">
			<div style="margin-left:150px; padding-top:20px ; font-size: 20px; font-weight: 600;">진행중인 이벤트</div>
			<div style="text-align: center; cursor:pointer; margin:10px 100px 10px 0px; font-size: 13px;"><a href="#" style="color: black">진행중 이벤트 더보기+</a></div>
			
		<div id='photo-container'>
            <div id="photos">
                <div class='photo'> <img src="${pageContext.request.contextPath}/img/event/event_1.PNG" alt="캐로셀"> </div>
                <div class="photo"> <img src="${pageContext.request.contextPath}/img/event/event_2.PNG" alt="캐로셀"> </div>
                <div class="photo"> <img src="${pageContext.request.contextPath}/img/event/event_3.png" alt="캐로셀"> </div>
                <div class="photo"> <img src="${pageContext.request.contextPath}/img/event/event_4.png" alt="캐로셀"> </div>
                <div class="photo"> <img src="${pageContext.request.contextPath}/img/event/event_5.png" alt="캐로셀"> </div>
            </div>

            <div id='selection'>
                <div class="options active"></div>
                <div class="options"></div>
                <div class="options"></div>
                <div class="options"></div>
                <div class="options"></div>
            </div>
        </div>
			
			    <script>
			        const photos = document.getElementById('photos');
			        const body = document.querySelector("body");
			        const widthOfPhoto = 500 // 사진너비 
			        let marginLeft = widthOfPhoto // 사진이동 간격 
			        let timerID = null // 타이머 ID 
			
			        function changeIndicator(index) {
			            const selection = document.getElementById('selection')
			            const activeOption = selection.querySelector('.active')
			            if (activeOption) activeOption.classList.remove('active') // 이전 active 한 인디케이터 제거
			            selection.querySelectorAll('.options')[index].classList.add('active') // 현재 인디케이터에 active 추가 
			        }
			
			
			        function changePosition() {
			            const photosLength = photos.querySelectorAll('.photo').length // 사진의 총 갯수
			            photos.style.marginLeft = marginLeft * -1 + 'px' // -1 : 왼쪽으로 이동
			
			            const index = parseInt(marginLeft / widthOfPhoto) // 현재 사진의 인덱스값 
			            changeIndicator(index) // 인디케이터 변경
			
			            marginLeft = marginLeft >= (widthOfPhoto * (photosLength - 1)) ? 0 : marginLeft + widthOfPhoto // 사진 너비만큼 이동
			        }
			
			        function startCarousel() {
			            timerID = setInterval(changePosition, 1500)
			        }
			
			        function stopCarousel() {
			            clearInterval(timerID)
			        }
			
			        body.addEventListener('mouseenter', startCarousel)
			    </script>
			
		</div>
		
    </div>
    <div class="main-movie-3">
        <div class="section">
            <a href="#"><div class="section1"><span class="material-symbols-outlined">diamond</span><p>VIP LOUNGE</p></div></a>
            <a href="#"><div class="section1"><span class="material-symbols-outlined">emoji_people</span><p>멤버쉽</p></div></a>
            <a href="#"><div class="section1"><span class="material-symbols-outlined">credit_card</span><p>할인카드 안내</p></div></a>
            <a href="#"><div class="section1"><span class="material-symbols-outlined">redeem</span><p>이벤트</p></div></a>
            <a href="#"><div class="section1"><span class="material-symbols-outlined">fastfood</span><p>스토어</p></div></a>
        </div>
    </div>
    <div class="main-movie-4">
        <div class="section4">
            <table class ="section4-table">
                <td width ="6%">지점</td>
                <td width ="15%"><span class="section4-category">[상암월드컵경기장]	</span></td>
                <td width ="60%"><a href="">상암월드컵경기장] 22년 9월 27(화) 축구 국가대표 평가전 경기 당일 주차 안내</td>
                <td width ="6%">2022.09.20</td>
                <td width ="6%"><a href="">더보기</a></td>
            </table>
        </div>
    </div>
</body>

	<script type="text/javascript">
	const modal_cancle = document.querySelector('#modal_cancle')
	modal_cancle.addEventListener('click',()=>{
		document.querySelector('.commentmodal').style.display='none';	
	});
	</script>

<%@ include file="../include/footer.jsp" %>
</html>