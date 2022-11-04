<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href = "${pageContext.request.contextPath}/css/reserveSeat.css?after">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="reserve_error_modal_box">
		<div class="invalid_access_login_modal_box">
	    	<div style="width:100%; height: 35px; background-color: #993399; margin-bottom: 50px; text-align: end">
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="35" fill="white" class="bi bi-x-circle-fill" viewBox="0 0 16 16" style="margin-right: 5px;"  id="modal_cancle">
			  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
			</svg>
	    	</div>
			좌석 선택을 확인해주세요
	    </div>
	</div>
	<c:choose>
      	<c:when test="${param.error eq 'no_member'}">
				<div class="commentmodal login_error_modal_box">
					<div class="invalid_access_login_modal_box">
				    	<div style="width:100%; height: 35px; background-color: #993399; margin-bottom: 50px; text-align: end">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="35" fill="white" class="bi bi-x-circle-fill" viewBox="0 0 16 16" style="margin-right: 5px;"  id="modal_cancle_">
						  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
						</svg>
				    	</div>
						로그인이 필요한 서비스입니다.<br/>
						<button class="modal_login_btn" onclick='location="movie?command=loginmember"'>로그인</button>
				    </div>
				</div>
      	</c:when>
	</c:choose>
	
    <div class="reserve-seat-container">
        <div class="reserve-seat-item-1">
            <div class="reserve-seat-title">
                빠른예매
            </div>
            <div style="display: flex; margin:10px 10px 10px 0px;">
                <div style="font-size:18px; width: 88%; ">
                    관람인원선택
                </div>  
                <div style="flex-grow: 1;">
                    <button class="select-peaple-re" id="re">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="15" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
                            <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
                            <path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
                          </svg>
                        초기화
                    </button>
                </div>
            </div>
            <div class="seat-layout-box">
               <div style="background-color: #eeeeee;display:flex; height: 50px; line-height:50px;">
                    <div class="button-group">
                        <label for="adult">성인</label>
                        <BUtton id="minus_adult">-</BUtton>
                        <BUtton style="width:45px;" id="adult" peaple="0">0</BUtton>
                        <BUtton id="plus_adult">+</BUtton>
                    </div>
                    <div class="button-group">
                        <label for="student">청소년</label>
                        <BUtton id="minus_student">-</BUtton>
                        <BUtton style="width: 45px;" id="student" peaple="0">0</BUtton>
                        <BUtton id="plus_student">+</BUtton>
                    </div>
                    <div class="button-group">
                        <label for="first">우대</label>
                        <BUtton id="minus_first">-</BUtton>
                        <BUtton style="width: 45px;" id="first" peaple="0">0</BUtton>
                        <BUtton id="plus_first">+</BUtton>
                    </div>
               </div>
               <script type="text/javascript">
               let adult_peaple = document.querySelector('#adult').getAttribute('peaple')
               let student_peaple = document.querySelector('#student').getAttribute('peaple')
               let first_peaple = document.querySelector('#first').getAttribute('peaple')
               
               function checkNum() {
				const total = Number(adult_peaple)+Number(student_peaple)+Number(first_peaple);
            	   if(total>7){
            		   return false;
            	   }else{
            		   return true;
            	   }	
               }
               
               const adult = document.querySelector('#adult');
               const student = document.querySelector('#student')
               const first = document.querySelector('#first')
               
               const adult_minus = document.querySelector('#minus_adult')
               adult_minus.addEventListener('click',()=>{
            	   if(adult_peaple>0){
                	   adult_peaple--;
                	   adult.innerText= adult_peaple;
                	   console.log(total_peaple);
            	   }
               })
               const adult_plus = document.querySelector('#plus_adult')
               adult_plus.addEventListener('click',()=>{
            	   if(checkNum()){
                	   adult_peaple++;
                	   adult.innerText= adult_peaple;
            	   }
				
               })
              const student_minus = document.querySelector('#minus_student')
               student_minus.addEventListener('click',()=>{
            	   if(student_peaple>0){
                	   student_peaple--;
                	   student.innerText= student_peaple;
            	   }
               })
               const student_plus = document.querySelector('#plus_student')
               student_plus.addEventListener('click',()=>{
            	   if(checkNum()){
                	   student_peaple++;
                	   student.innerText= student_peaple;
            	   }
				
               })
               const first_minus = document.querySelector('#minus_first')
               first_minus.addEventListener('click',()=>{
            	   if(first_peaple>0){
                	   first_peaple--;
                	   first.innerText= first_peaple;
            	   }
               })
               const first_plus = document.querySelector('#plus_first')
               first_plus.addEventListener('click',()=>{
            	   if(checkNum()){
                	   first_peaple++;
                	   first.innerText= first_peaple;
            	   }
				
               })
               
               </script>
                <div class="main-select-seat-area">
                    <div class="select-seat">
                        <div>
                            <img  style="width:100%;" src="${pageContext.request.contextPath}/img/logo/img-theater-screen.png" alt="screen">
                        </div>
                        <c:forEach var="i" items="${type}">
	                        <div class="seat">
							<c:forEach var="j" items="${i}">
								<c:choose>
									<c:when test="${j eq '--'}">
										<button class="route"></button>
									</c:when>
									<c:when test="${j eq 'DR' }">
										<button class="door">↕</button>
									</c:when>
									<c:when test="${j eq 'sell' }">
										<button class="sell"></button>
									</c:when>
									<c:otherwise>
										<button class="able" seat="${j}">${j}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							</div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

            
       
        <div class="reserve-seat-item-2">
            <div>
                <div style="margin:10px; padding-bottom: 10px;border-bottom: 1px solid rgb(169, 169, 169);">
                    <div style="font-size: 20px;">${timetalble.title}</div>
                    ${timetalble.grade}
                </div>
                <div style="margin:10px; padding-bottom: 10px; font-size: 13px; display: flex; border-bottom: 1px solid rgb(169, 169, 169);">
                    <div style="margin:5px;">
                        <li>${timetalble.theater}</li>
                        <li>${timetalble.screen}</li>
                        <li>${timetalble.date}</li>
                        <li style="color: white;">${timetalble.s_time} ~ ${timetalble.e_time}</li>
                    </div>
                    <div style="flex-grow: 1; margin-left: 105px;">
                        <img  width="80px" src="${pageContext.request.contextPath}/img/poster/${timetalble.img}" alt="영화이미지">
                    </div>
                </div>
                <div style="margin:10px;font-size: 13px; border: 1px solid rgb(154, 154, 154); border-radius: 5%; display: flex;">
                    <div style="width: 55%; height: 240px;;border-right: 1px solid rgb(154, 154, 154);">
                        <ul style="padding-left:25px; margin-top: 30px;">
                            <li><button style="height:20px; width:20px; background-color:darkmagenta; margin-right:5px;"></button>선택</li>
                            <li><button style="height:20px; width:20px; background-color:#C0C0C0; margin-right:5px;"></button>선택가능</li>
                            <li><button style="height:20px; width:20px; background-color:rgb(62,62,62); margin-right:5px;font-size:15px;"></button>예매완료</li>
                            <li style="display:flex;"><button style="height:20px; width:20px; background-color:rgb(62,62,62); 
                            font-weight:600;color:white;margin-right:5px;display:flex;align-items:center;justify-content:center;">X</button>선택불가</li>
                            
                        </ul>
                    </div>
                    <div style="flex-grow:1;text-align:center;margin:10px;">
                        선택좌석
                        <div id ="select-seat-info"style="display: flex; flex-wrap: wrap; margin-top: 10px; margin-left: 5px; right:5px; width:95px; height: 200px;">
                            <div class="seat-select-area">
                                -
                            </div>
                            <div class="seat-select-area">
                                -
                            </div>
                            <div class="seat-select-area">
                                -
                            </div>
                            <div class="seat-select-area">
                                -
                            </div>
                            <div class="seat-select-area">
                                -
                            </div>
                            <div class="seat-select-area">
                                -
                            </div>
                            <div class="seat-select-area">
                                -
                            </div>
                            <div class="seat-select-area">
                                -
                            </div>
                        </div>
                    </div>
                </div>
                <form action = "movie" method="post" id = "reserveForm">
                	<input type = "hidden" name = "command" value="reserveSeatProcess">
                	<input type = "hidden" name = "timetalble_id" value="${timetalble.id }">
                </form>
                <div class = "seat-select-info">
                    <div style="font-size: 16; height: 22px;" id="peaple-info">
                        -
                    </div>
                    <div style="display:flex; margin-top: 5px;">
                        <div style="width:50%; font-size: 17px; color: white;">최종결제금액</div>
                        <div style="width:50%; text-align:end; margin-right:20px; color:#33cccc; font-size: 18px; font-weight: 600;"id="totalmoney"> -원</div>
                    </div>
                </div>
                <div style="text-align:center; margin:10px 0px 10px 0px">
                    <button class="order-seat-btn" id="order-cancle">이전</button><button class="order-seat-btn" id="next-stap">다음</button>
                </div>
                
                
                	<script type="text/javascript">
					function setSeatInfo(a){
						const seatInfo = document.querySelector('#select-seat-info');
						let innerhtml = '';
						
							for (var i = 0; i < a.length; i++) {
								innerhtml += '<div class="seat-select-area seat-selected">'+
		                                	 	a[i]+
		                            		 '</div>'
							}
							for (var i = 8; i > a.length; i--) {
								innerhtml += '<div class="seat-select-area">'+
						                	 	'-'+
						            		 '</div>'
							}
							
						seatInfo.innerHTML = innerhtml
					}
					
		            function checkSeat(a,b){
						const num = a.filter((c)=>c==b)
						return num.length;
		            }
		            function removeSeat(a,b) {
						const arr = a.filter((c)=>c!=b)
						return arr
					}
		            function checkPeaple(a){
		            	const total = Number(adult_peaple)+Number(student_peaple)
		            	+Number(first_peaple);
		            	if(a.length<total){
		            		return true;
		            	}else{
		            		return false;
		            	}
		            }
		            function innerInfo(){
		            	const price = 12000
		            	const total = Number(adult_peaple)+Number(student_peaple)+Number(first_peaple);
		            	if(seats.length!=0&&seats.length===total){
		            		const peapleInfo = document.querySelector('#peaple-info');
		            		const priceInfo = document.querySelector('#totalmoney');
		            		html = "";
							if(adult_peaple!=0){html+=" 성인 "+Number(adult_peaple)}
						
							if(student_peaple!=0){html+=" 청소년 "+Number(student_peaple)}
							
					
		            		if(first_peaple!=0){html+=" 우대 "+Number(first_peaple)}
							
		            		peapleInfo.innerText = html
		            		priceInfo.innerText = total*price+"원"
		            	}
		            	
		            }
		           
		            
		            let seats =[];
		            function selectSeat(e){
		            	const target = e.target;
		            	const target_seat = target.getAttribute('seat');
		            	console.log(target_seat);
		            	if(target.className ==='able'&&!checkSeat(seats,target_seat)&&checkPeaple(seats)){
		            		target.classList.add('seat-selected')
		            		seats.push(target_seat);
		            		setSeatInfo(seats)
		            		innerInfo()
		            		
		            	}else if(checkSeat(seats,target_seat)>0){
		            		target.classList.remove('seat-selected')
		            		seats = removeSeat(seats,target_seat);
		            		setSeatInfo(seats)
		            		innerInfo()
		            	}
		            	
		            }
		            const seat_area = document.querySelector('.select-seat');
		            seat_area.addEventListener('click',selectSeat)
		            
		            
		            </script>
                
                <script type="text/javascript">
                	
                	const order_cancle = document.querySelector('#order-cancle')
                	order_cancle.addEventListener('click',()=>{
                		location.href="movie?command=reserve_main";
                	})
                	const re = document.querySelector('#re')
                	re.addEventListener('click',()=>{
                		window.history.go(0);
                	})
                	
                	const next_step =  document.querySelector('#next-stap')
                	next_step.addEventListener('click', ()=>{
                	const total = Number(adult_peaple)+Number(student_peaple)+Number(first_peaple);
                		if(seats.length!=0&&seats.length===total){
                			
                			let form = document.querySelector('#reserveForm')
                			
                			let input1 = document.createElement('input')
                			let input2 = document.createElement('input')
                			
               				input1.setAttribute("type", "hidden");
							input1.setAttribute("name", "amount");
							input1.setAttribute("value", total);
							
							input2.setAttribute("type", "hidden");
							input2.setAttribute("name", "seats");
							input2.setAttribute("value", seats);
							
							form.appendChild(input1);
							form.appendChild(input2);
							                			
                			
                			form.submit();
                			
                		}else{
                			document.querySelector('.reserve_error_modal_box').style.display='block'
                		}
                	})
                	const modal_cancle = document.querySelector('#modal_cancle')
                    modal_cancle.addEventListener('click',()=>{
                        document.querySelector('.reserve_error_modal_box').style.display='none';	
                    });
    			    const modal_cancle_ = document.querySelector('#modal_cancle_')
    			    modal_cancle_.addEventListener('click',()=>{
    			    	document.querySelector('.commentmodal').style.display='none';	
    			    });
                </script>
            </div>
        </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>