<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href = "${pageContext.request.contextPath}/css/style2.css?after">

<title>Insert title here</title>
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
					<script type="text/javascript">
					const modal_cancle = document.querySelector('#modal_cancle')
					modal_cancle.addEventListener('click',()=>{
						document.querySelector('.commentmodal').style.display='none';	
					});
					</script>
      	</c:when>
	   	<c:otherwise>
	   	</c:otherwise>
</c:choose>
    <div class ="list-container" style="margin-top:50px;">
        <h2 style="margin: 15px">전체영화</h2>
        <div class="flex-box">
            <div class ="flex-box-item" onclick='location.href="movie?command=list"'>
                박스오피스
            </div>
            <div class ="flex-box-item" onclick='location.href="movie?command=commingsoon"'>
                상영예정작
            </div>
            <div class ="flex-box-item flex-box-item-selected">
                상영종료작
            </div>
        </div>

        <div class = "flex-box">
            <div class ="align-left">
                <span id ="totalcnt"style="font-size:20px; color:#037B94; font-weight: 600;">${totalCnt}</span>개의 영화가 검색되었습니다.
            </div>
            <div class="align-right">
                <form action="movie" method="get" id="search_movie">
                    <input type ="hidden" name="command" value="lastmovie">
                    <input type="text" name = "title" id="title" placeholder="영화명 검색" style="width:200px; height:30px">
                    <button class="btn-none-style"><span class="material-symbols-outlined">search</span></button>
                </form>
            </div>
        </div>
        <div class="flex-box wrap" id="list-movie">
			<c:forEach var="list" items="${list}" varStatus="status">
            <div class = "movie-box"><a href="movie?command=view&movie_id=${list.id}">
                <div class ="movie-box-img-box">
                    <img alt="영화 사진" src="${pageContext.request.contextPath}/img/poster/${list.img}">
                	<div class ="movie-box-rank">${status.count}</div>
                    <div class = "display-none-wrapper">
                        <div class ="movie-box-img-box-content">
						${list.content}
                        </div>
                        <div class ="movie-movie-box-img-box-content-2">
                            <span style="color:white;">관람평</span><span style="font-size:25px; font-weight:600; color:darkcyan">${list.score}</span>
                        </div>
                    </div>
                </div>
                <div class="movie-box-contents"></a>
                    <div style="font-size: 17px; margin: 5px; font-weight: 600;">
                    <c:choose>
					        <c:when test="${fn:length(list.title) gt 12}">
					        <c:out value="${fn:substring(list.title, 0, 11)}...">
					        </c:out>
					        </c:when>
					        <c:otherwise>
					        <c:out value="${list.title}">
					        </c:out>
					        </c:otherwise>
					</c:choose>
                    </div>

                     <span style="font-size: 14px; border-right: 1px solid lightgray; padding-right: 7px;"> 예매율
                      <c:choose>
					        <c:when test="${list.total eq 0}">
					        <c:out value="-">
					        </c:out>
					        </c:when>
					        <c:otherwise>
					        <fmt:formatNumber value="${list.sales/list.total*100}" pattern="#.#"/>
					        </c:otherwise>
					</c:choose>%</span>
                    <span style="font-size: 14px; padding-left: 1px;">개봉일 <fmt:formatDate value="${list.date}" pattern="yyyy.MM.dd"/></span>
						<div style="display: flex;">
	                 	<form action="movie" method="post" id="liketable">
						 <input type="hidden" name="command" value="createliketable">
						 <input type="hidden" name="movieId" value="${list.id}">
						  <button class="good-btn" type="submit">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
							  <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
							</svg>${list.like}	
						</button>
						</form>
						 <div class="reserve-btn2" style="font-size: 15px;text-align: center;line-height: 35px">상영종료</div>
	                 	</div>
               		</div>
               	</div>	
			</c:forEach>
        </div>
    </div>
    <div class="list-container" style="text-align: center;">
        <button class="more-btn">더보기 ▽</button>
    </div>
    <script type="text/javascript">
	    function getContextPath() {
	        let hostIndex = location.href.indexOf( location.host ) + location.host.length;
	        return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	    }
    
    	function moreMovie(){
    		let xmlHttp = new XMLHttpRequest();
    		xmlHttp.onreadystatechange = function() { 

    		    if(this.status == 200 && this.readyState == this.DONE) {

    		    	let movie = xmlHttp.responseText;
    		    	movie =JSON.parse(movie);
    		    	let html ="";
    		    	
    		    	for(i=0;i<movie.length;i++){
    		    		html+='<div class = "movie-box">'+
    		    		'<a href="movie?command=view&movie_id='+movie[i].id+'">'+
    		    		'<div class ="movie-box-img-box">'+
    		    		'<img style="width:230px; height:330px;" alt="영화 사진" src="'+getContextPath()+
    		    		'/img/poster/'+movie[i].img+'">'+
    		    		'<div class ="movie-box-rank"></div>'+
    		    		'<div class = "display-none-wrapper">'+
    		    		'<div class ="movie-box-img-box-content">'+
    		    		+'</div>'+
    		    		'<div class ="movie-movie-box-img-box-content-2">'+
    		    		'<span style="color:white;">관람평</span><span style="font-size:25px;'+
    		    		'font-weight:600; color:darkcyan">'+movie[i].score+'</span>'+
    		    		'</div></div></div><div class="movie-box-contents"></a>'+
    		    		'<div style="font-size: 17px; margin: 5px; font-weight: 600;">'+
    		    		movie[i].title+'</div>'+
    		    		'<span style="font-size: 14px; border-right: 1px solid lightgray;'+
    		    		'padding-right: 7px;"> 예매율'+(movie[i].sales/movie[i].total*100).toFixed(1)+'%</span>'+
    		    		'<span style="font-size: 14px; padding-left: 1px;">개봉일'+(movie[i].date).replace(/-/g,'.')+'</span>'+
    		    		'<div style="display: flex;">'+
    		    		'<form action="movie" method="post" id="liketable">'+
    					'<input type="hidden" name="command" value="createliketable">'+
    					'<input type="hidden" name="movieId" value='+movie[i].id+'>'+
    					'<button class="good-btn" type="submit">'+
    					'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"'+
    					'class="bi bi-suit-heart" viewBox="0 0 16 16">'+
    					'<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>'+
    					'</svg>'+movie[i].like+
    					'</button></form><div class="reserve-btn2" style="font-size: 15px;text-align: center;line-height: 35px">상영종료</div></div></div></div></div>'
    					
    		    	}
    		    	console.log(html)
    		    	document.querySelector('#list-movie').insertAdjacentHTML('beforeend', html);
    		    	

    		    }

    		};
			const s_page = document.querySelectorAll('.movie-box').length;
    		console.log(s_page);
			xmlHttp.open("GET", "movie?command=moreLastMovie&s_page="+s_page, true);
    		xmlHttp.send();
    	}
    
    	const more_btn = document.querySelector('.more-btn')
    	more_btn.addEventListener('click',moreMovie)
    </script>

<%@ include file="../include/footer.jsp" %>
</body>
</html>