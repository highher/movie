<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
      	</c:when>
	   	<c:otherwise>
	   	</c:otherwise>
	</c:choose>
	<div class = "view-main">
		<div class= "view-main-background">
			<div class = "view-main-background-wrapper">
				<img class = "view-main-background-img" alt="영화 사진" src="${pageContext.request.contextPath}/img/poster/${movie.img}">
				<div class ="view-container">
					 <div class="view-container-half">
					 	<div class="view-container-title">
						 	 ${movie.title}
						 	 <p style="font-size:13px;font-weight:400;color:lightgray;">${movie.etitle}</p>
						 </div>
						 <form action="movie" method="post" id="liketable">
						 <input type="hidden" name="command" value="createliketable">
						 <input type="hidden" name="movieId" value="${movie.id}">
						 </form>
						 <div class = "view-btn-group">
							 <div class = "view-btn">
								<button class="view-good-btn" id="likeMovie"><span class="material-symbols-outlined fill-0">favorite</span>${movie.like}</button>
								<button class="view-share-btn"><span class="material-symbols-outlined fill-0">share</span> 공유하기</button>
							 </div>
						 </div>
						 <div class = "view-info">
						 	<div class="view-info-1">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journals" viewBox="0 0 16 16">
								  <path d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2 2 2 0 0 1-2 2H3a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1H1a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v9a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2z"/>
								  <path d="M1 6v-.5a.5.5 0 0 1 1 0V6h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V9h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 2.5v.5H.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1H2v-.5a.5.5 0 0 0-1 0z"/>
								</svg>
						 		실관람평<h1 style="color:#037B94;">${movie.score}</h1>
						 	</div>
						 	<div class="view-info-1">
							 	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-ticket" viewBox="0 0 16 16">
								  <path d="M0 4.5A1.5 1.5 0 0 1 1.5 3h13A1.5 1.5 0 0 1 16 4.5V6a.5.5 0 0 1-.5.5 1.5 1.5 0 0 0 0 3 .5.5 0 0 1 .5.5v1.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 11.5V10a.5.5 0 0 1 .5-.5 1.5 1.5 0 1 0 0-3A.5.5 0 0 1 0 6V4.5ZM1.5 4a.5.5 0 0 0-.5.5v1.05a2.5 2.5 0 0 1 0 4.9v1.05a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-1.05a2.5 2.5 0 0 1 0-4.9V4.5a.5.5 0 0 0-.5-.5h-13Z"/>
								</svg>
							 	예매율
							 	<div style="line-height: 100px; font-size:30px">
								<c:choose>
								        <c:when test="${movie.total eq 0}">
								        <c:out value="-">
								        </c:out>
								        </c:when>
								        <c:otherwise>
								        <fmt:formatNumber value="${movie.sales/movie.total*100}" pattern="#.#"/><c:out value="%"></c:out>
								        </c:otherwise>
								</c:choose>
								</div>
						 	</div>
						 	<div class="view-info-1">
						 		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
								  <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"/>
								</svg>
						 		관객수
						 		<h3 style="color:#ffffff;line-height:70px;">
							 		<c:choose>
									        <c:when test="${movie.view eq 0}">
									        <c:out value="-">
									        </c:out>
									        </c:when>
									        <c:otherwise>
									      	<fmt:formatNumber value="${movie.view}" pattern="#,###"/><c:out value="명"></c:out>
									        </c:otherwise>
									</c:choose>
						 		</h3>
						 	</div>
						 </div>	
					 </div>
					 <div class="view-container-half">
					 	<div class = "img-container-wrapper">
					 	<div class = "img-container">
					 		<img class = "main-background-img" alt="영화 사진" src="${pageContext.request.contextPath}/img/poster/${movie.img}">
					 	</div>
		                    <button class="btn-1-1" id="view-reserve-btn" onclick='location.href="movie?command=totalreserve"'>예매하기</button>
					 	</div>
					 </div>
				</div>
			</div>
		</div>
		</div>
						
        
		<div class="view-main2" id="info" >
			<div class="flex-box" style="margin-top:40px">
	            <div class ="flex-box-item not" onclick='location.href="movie?command=view&movie_id=${movie.id}#info"'>
	               상세정보
	            </div>
	            <div class ="flex-box-item flex-box-item-selected" onclick='location.href="movie?command=view_comment&movie_id=${movie.id}#info"'>
	               관람평가
	            </div>
	            <div class ="flex-box-item not">
	               무비포스트
	            </div>
	        </div>		
		</div>
		
		<div class = "view-main2" style="margin-top:30px;margin-bottom:20px">
			<span style="font-size: 30px; font-weight:600; color:#037B94">${movie.title}</span>
			<span style="font-size:25px; color:#503396; font-weight:600;">에 대한 <span style="color:#037B94">${movie.commentCnt}개</span>의 이야기가 있어요!</span>
		</div>
		
		<div class="moviecomment-layout" style="margin-bottom:20px">
        <div class= "create-moviecomment-wrapper">
                <textarea cols="110" rows="1" maxLength="200" class="moviecomment-layout-textarea" placeholder="${movie.title} 재밌게 보셨나요? 영화의 어떤점이 좋았는지 이야기해주세요"></textarea>
                <button class="create-moviecomment-btn"><span class="material-symbols-outlined">edit</span><p style="margin-top:-3px;">관람평쓰기</p></button>
        </div>
        <table class = "moviecomment-table" style = "">
            <c:forEach var="commentlist" items="${commentlist}">
	            <tr>
	                <td width="10%">
	                   	${commentlist.member_id}
	                </td>
	                <td width="7%">
	                    ${commentlist.score}
	                </td>
	                <td width="8%">
	                    ${commentlist.category}
	                </td>
	                <td width ="60%">
	                    ${commentlist.comment}
	                </td>
	                <td width="15%">
	                    ${commentlist.date}
	                </td>
	            </tr>  
            </c:forEach> 
        </table>
    </div>	
    <div class="comment_page">
    	<c:forEach var="i" begin="1" end="${lastpage}"> 
    		<c:choose>
    			<c:when test="${param.page eq i}">
    				<button class="comment_page_btn comment_page_btn-selected">${i}</button>
    			</c:when>
    			<c:otherwise>
    				<button class="comment_page_btn" onclick="location.href='movie?command=view_comment&movie_id=${movie.id}&page=${i}'">${i}</button>
    			</c:otherwise>
    		</c:choose>
    	</c:forEach>
    </div>
    
    
    
    
    
        <c:choose>
		        <c:when test="${not empty sessionScope.id}">

			     <div class="commentmodal">
					<div class="comment_modal_box">
				    	<div style="width:100%; height: 35px; background-color: #993399; margin-bottom: 5px; text-align: end">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="35" fill="white" class="bi bi-x-circle-fill" viewBox="0 0 16 16" style="margin-right: 5px;"  id="modal_cancle">
							  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
					    </div>
					    	<form action="movie" method="post">
					    		<input type="hidden" name="command" value="resist_comment">
								<input type="hidden" name="movieId" value="${movie.id}">
								<span style="font-weight: 600; font-size: 30px;">

								<c:choose>
								        <c:when test="${fn:length(movie.title) gt 12}">
								        <c:out value="${fn:substring(movie.title, 0, 11)}...">
								        </c:out>
								        </c:when>
								        <c:otherwise>
								        <c:out value="${movie.title}">
								        </c:out>
								        </c:otherwise>
								</c:choose>

								</span><br/>
								<div class="star-rating space-x-4 mx-auto">
									<input type="radio" id="5-stars" name="score" value="10"/>
									<label for="5-stars" class="star pr-4">★</label>
									<input type="radio" id="4-stars" name="score" value="8"/>
									<label for="4-stars" class="star">★</label>
									<input type="radio" id="3-stars" name="score" value="6"/>
									<label for="3-stars" class="star">★</label>
									<input type="radio" id="2-stars" name="score" value="4"/>
									<label for="2-stars" class="star">★</label>
									<input type="radio" id="1-star" name="score" value="2"/>
									<label for="1-star" class="star">★</label>
								</div>
								<p style="color:gray">별점과 가장 마음에 든 점을 선택하세요</p>
			
									<div style="margin:0px auto;text-align:center;display:flex; justify-content:center">
										<div class="form_radio_btn radio_male">
											<input id="radio-1" type="radio" name="category" value="스토리">
											<label for="radio-1">스토리</label>
										</div>					 
										<div class="form_radio_btn">
											<input id="radio-2" type="radio" name="category" value="연출">
											<label for="radio-2">연출</label>
										</div>
										<div class="form_radio_btn">
											<input id="radio-3" type="radio" name="category" value="OST">
											<label for="radio-3">OST</label>
										</div>
										<div class="form_radio_btn">
											<input id="radio-4" type="radio" name="category" value="영상미">
											<label for="radio-4">영상미</label>
										</div>
										<div class="form_radio_btn">
											<input id="radio-5" type="radio" name="category" value="배우">
											<label for="radio-5">배우</label>
										</div>
									</div>
								<textarea cols="70" rows="5" name="content" placeholder=" 감상평을 남겨주세요"></textarea></br>
								<button class="modal_form_btn btn_submit" type="submit">확인</button>
							</form>
					    </div>
					</div>

		        </c:when>
		        <c:otherwise>
		        
				<div class="commentmodal">
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
				
		        </c:otherwise>
		</c:choose>			    
    	
    <script type="text/javascript">
    
    const modalbtn = document.querySelector('.create-moviecomment-wrapper');
    modalbtn.addEventListener('click',()=>{
    	document.querySelector('.commentmodal').style.display='block';	
    });
    const modal_cancle = document.querySelector('#modal_cancle')
    modal_cancle.addEventListener('click',()=>{
    	document.querySelector('.commentmodal').style.display='none';	
    });

    const liketableBtn = document.querySelector('#likeMovie')
    liketableBtn.addEventListener('click',()=>{
    	document.querySelector('#liketable').submit();
    })
    
    </script>    		
		
<%@ include file="../include/footer.jsp" %>
</body>
</html>