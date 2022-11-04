<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href = "${pageContext.request.contextPath}/css/reserve.css">
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
			조회가능한 영화가 없습니다.
	    </div>
	</div>
    <div class="reserve-layout">
        <h2>빠른예매</h2>        
        <div class="month">
			<fmt:parseDate value="${datelist[0].date}" var="dateValue" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${dateValue}" pattern="yyyy년 MM월"/>
		</div>

        <div class="reserve-layout-top">
            <button class= "reserve-layout-top-pre-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
                    <path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/>
                  </svg>
            </button>
            <div class="reserve-layout-top-days-view">
                <c:forEach var="datelist" items="${datelist}">
                	<button class="reserve-layout-top-days-view-btn" id="${datelist.week}" reservedayinfo="${datelist.date}">
                		<fmt:parseDate value="${datelist.date}" var="dateValue" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${dateValue}" pattern="dd"/>&#8729;${datelist.weekKor}
                	</button>
                </c:forEach>
            </div>
            <button class= "reserve-layout-top-pro-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
                    <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
                  </svg>
            </button>
            <script type = "text/javascript">
                    let leftbtn=document.querySelector('.reserve-layout-top-pre-btn');
                    leftbtn.addEventListener('click',()=>{
                        document.querySelector('.reserve-layout-top-days-view').scrollLeft-=81;
                    })
                    let rightbtn=document.querySelector('.reserve-layout-top-pro-btn');
                    rightbtn.addEventListener('click',()=>{
                        document.querySelector('.reserve-layout-top-days-view').scrollLeft+=81;
                    })

                    const reserveLayoutTopDaysView = document.querySelector('.reserve-layout-top-days-view');
                    let day = document.querySelectorAll('.reserve-layout-top-days-view-btn')[0];
                    let date = day.getAttribute("reservedayinfo")
                    day.classList.add('reserve-layout-top-days-view-btn-selected');
                    function reserveLayoutTopDaysViewBtnSelected(e){
                        let reserveDayTarget = e.target;
                        if(reserveDayTarget.className==='reserve-layout-top-days-view-btn'&&reserveDayTarget!==day){
                            day.classList.remove('reserve-layout-top-days-view-btn-selected');
                            reserveDayTarget.classList.add('reserve-layout-top-days-view-btn-selected');
                            date=reserveDayTarget.getAttribute("reservedayinfo")
                           	getTimetalbleList();
                            day=reserveDayTarget;

                        }
                    }
                    reserveLayoutTopDaysView.addEventListener('click',reserveLayoutTopDaysViewBtnSelected);
            </script>

        </div>
        <div class="reserve-layout-middle">
            <div class="reserve-layout-middle-movie-layout">
                <h4 style="margin-left:20px;"> 영화 </h4>
                <div class="reserve-layout-middle-layout-wrapper">
                    <button class="reserve-layout-middle-layout-wrapper-btn" id="movieAll">전체</button><button class="reserve-layout-middle-layout-wrapper-btn" id="movieTop10">Top5</button>   
                    <div class = "reserve-layout-middle-main">
                        <div class="middle-main-item movie-select-area" id="movie-all-area">
                            <c:forEach var="movielist" items="${movielist}">
                            	<li movieid="${movielist.id}" movieimg="${pageContext.request.contextPath}/img/poster/${movielist.img}" movietitle="${movielist.title}">
			                     <c:choose>
								        <c:when test="${fn:length(movielist.title) gt 12}">
								        <c:out value="${fn:substring(movielist.title, 0, 11)}...">
								        </c:out>
								        </c:when>
								        <c:otherwise>
								        <c:out value="${movielist.title}">
								        </c:out>
								        </c:otherwise>
								</c:choose>
                            	</li>
                            </c:forEach>
                        </div>
                        <div class="middle-main-item movie-select-area" id="movie-top10-area">
                            <c:forEach var="recommend" items="${recommendMovie}">
                            	<li movieid="${recommend.id}" movieimg="${pageContext.request.contextPath}/img/poster/${recommend.img}" movietitle="${recommend.title}">${recommend.title}</li>
                            </c:forEach>
                        </div>
                    </div>
                    <script type ="text/javascript">
                        const movieAll = document.getElementById('movieAll');
                        movieAll.classList.add('reserve-layout-middle-layout-wrapper-btn-selected');
                        const movieTop10 = document.getElementById('movieTop10');
                        document.querySelector('#movie-top10-area').classList.add('displaynone');

                        movieAll.addEventListener('click',()=>{
                            if(!movieAll.classList.contains('reserve-layout-middle-layout-wrapper-btn-selected')){
                                movieAll.classList.add('reserve-layout-middle-layout-wrapper-btn-selected');
                                document.querySelector('#movie-all-area').classList.remove('displaynone')
                            }
                            if(movieTop10.classList.contains('reserve-layout-middle-layout-wrapper-btn-selected')){
                                movieTop10.classList.remove('reserve-layout-middle-layout-wrapper-btn-selected');
                                document.querySelector('#movie-top10-area').classList.add('displaynone');
                            }
                        })
                        movieTop10.addEventListener('click',()=>{
                            if(!movieTop10.classList.contains('reserve-layout-middle-layout-wrapper-btn-selected')){
                                movieTop10.classList.add('reserve-layout-middle-layout-wrapper-btn-selected');
                                document.querySelector('#movie-top10-area').classList.remove('displaynone');
                            }
                            if(movieAll.classList.contains('reserve-layout-middle-layout-wrapper-btn-selected')){
                                movieAll.classList.remove('reserve-layout-middle-layout-wrapper-btn-selected');
                                document.querySelector('#movie-all-area').classList.add('displaynone')
                            }
                        })
                    </script> 
                    <div class = "reserve-layout-middle-main-bottom">
                    	<div class ="reserve-img-box-left"></div>
                    	<div class ="reserve-img-box-right"></div>
                        영화목록에서 영화를 선택하세요
                    </div>
                </div>
                <script type="text/javascript">
                    const movieSelectAreas = document.querySelectorAll('.movie-select-area');
					function checkObj(a,b){
						const num = a.filter((c)=>c.movieId==b.movieId)
						return num.length;
					}
                    
                    let movie =[];
                    function setImg(a){
                    	const imgBoxLeft = document.querySelector('.reserve-img-box-left')
                    	const imgBoxRight = document.querySelector('.reserve-img-box-right')
                    	imgBoxLeft.innerHTML=""
                    	imgBoxRight.innerHTML=""
						if(movie.length==1){
							imgBoxLeft.innerHTML="<img style=\"width:100%;height:100%;object-fit:cover\" src=\""+a[0].movieImg+"\">";
						}
						else if(movie.length==2){
							imgBoxLeft.innerHTML="<img style=\"width:100%;height:100%;object-fit:cover\" src=\""+a[0].movieImg+"\">";
	                    	imgBoxRight.innerHTML="<img style=\"width:100%;height:100%;object-fit:cover\" src="+a[1].movieImg+">";
						}
						
                    }
                    
                    function movieSelect(e){
                        let target = e.target;
                        let movieObject = {"movieId":target.getAttribute('movieid'),
                        		"movieTitle":target.getAttribute('movietitle'),"movieImg":target.getAttribute('movieimg')};
                        if(target.tagName==='LI'&&!checkObj(movie,movieObject)&&movie.length<2){
                            target.classList.add('movie-selected');
                            movie.push(movieObject);
                           
                            

                        }else if(checkObj(movie,movieObject)===1){
                            target.classList.remove('movie-selected');
                            movie=movie.filter(v=>v.movieId!=target.getAttribute('movieid'));
                           
                        }
                        setImg(movie)
                        getTimetalbleList();
                       
						
                    }
                    for(movieSelectArea of movieSelectAreas){
                        movieSelectArea.addEventListener('click',movieSelect)
                    }

                </script>
            </div>
            <div class="reserve-layout-middle-theater-layout">
                <h4 style="margin-left:20px;"> 극장 </h4>
                <div class="reserve-layout-middle-layout-wrapper">
                    <button class="reserve-layout-middle-layout-wrapper-btn" id="theaterAll">전체</button><button class="reserve-layout-middle-layout-wrapper-btn" id="theaterRecommand">추천 영화관</button>
                    <div class = "reserve-layout-middle-main" id="theater-theater-theater">
                        <div class="middle-main-item" id="theater-all-area">
                            <div class="theater-all-area-wrapper">
                                <div class="wrapper-item-location">
                                    <li style="display:none" id="none"></li>
                                    <li location ="서울">서울</li>
                                    <li location ="경기">경기</li>
                                    <li location ="인천">인천</li>
                                    <li location ="충청">충청</li>
                                    <li location ="경상">경상</li>
                                    <li location ="전라">전라</li>
                                    <li location ="강원">강원</li>
                                </div>
                                <div class="wrapper-item-theater">

                                </div>
                            </div>
                        </div>
                        <div class="middle-main-item" id="theater-recommand-area">
                            <li class="select-theater-li" theaterid="59" theatername="영천">영천</li>
                            <li class="select-theater-li" theaterid="60" theatername="경산자인">경산자인</li>
                            <li class="select-theater-li" theaterid="58" theatername="영진(용계역)">영진(용계역)</li>
                        </div>
                    </div>
                    <script type="text/javascript">
     
                        const theaterAll = document.getElementById('theaterAll');
                        const theaterRecommand = document.getElementById('theaterRecommand');
                        theaterAll.classList.add('reserve-layout-middle-layout-wrapper-btn-selected');
                        document.querySelector('#theater-recommand-area').classList.add('displaynone');
                        theaterAll.addEventListener('click',()=>{
                            if(!theaterAll.classList.contains('reserve-layout-middle-layout-wrapper-btn-selected')){
                                theaterAll.classList.add('reserve-layout-middle-layout-wrapper-btn-selected');
                                document.querySelector('#theater-all-area').classList.remove('displaynone');
                            }
                            if(theaterRecommand.classList.contains('reserve-layout-middle-layout-wrapper-btn-selected')){
                                theaterRecommand.classList.remove('reserve-layout-middle-layout-wrapper-btn-selected');
                                document.querySelector('#theater-recommand-area').classList.add('displaynone');
                            }
                        })
                        theaterRecommand.addEventListener('click',()=>{
                            if(!theaterRecommand.classList.contains('reserve-layout-middle-layout-wrapper-btn-selected')){
                                theaterRecommand.classList.add('reserve-layout-middle-layout-wrapper-btn-selected');
                                document.querySelector('#theater-recommand-area').classList.remove('displaynone');
                            }
                            if(theaterAll.classList.contains('reserve-layout-middle-layout-wrapper-btn-selected')){
                                theaterAll.classList.remove('reserve-layout-middle-layout-wrapper-btn-selected');
                                document.querySelector('#theater-all-area').classList.add('displaynone');
                            }
                        })
                    </script> 
                    <div class = "reserve-layout-middle-main-bottom">
                        <div class="reserve-theater-view-area">

                        </div>
                        극장목록에서 극장을 선택하세요
                    	</div>
                    
                    <script type ="text/javascript">
	                    function checkTheaterObj(a,b){
	                        const num = a.filter((c)=>c.theaterId==b.theaterId)
	            			return num.length;           
	                    }
	                    function innerHTMLTheaters(){
	                    	const reservetheaterviewarea = document.querySelector('.reserve-theater-view-area');
	                    	let html ="";
	                    		for ( var i=0; i<theaters.length; i++) {
									html+= '<div class="reserve-theater-view-area-item" theaterId="'+theaters[i].theaterId+'">'
									+theaters[i].theaterName+'</div>';
								}
	                    	reservetheaterviewarea.innerHTML=html
	                    }
	                    function clickTheater(e){
	                        let theaterObject = {"theaterId":e.target.getAttribute('theaterid'),
	                                "theaterName":e.target.getAttribute('theatername')};
				            
				            if(e.target.className==='select-theater-li'&&!checkTheaterObj(theaters,theaterObject)&&theaters.length<2){
				                theaters.push(theaterObject);
				                innerHTMLTheaters();
				            }else if(e.target.className==='select-theater-li'&&!checkTheaterObj(theaters,theaterObject)&&theaters.length==2){
				                theaters.shift();
				                theaters.push(theaterObject);
				                innerHTMLTheaters();
				            }
				            getTimetalbleList();
				            
	                    }
	                    let theatertheatertheater = document.querySelector('#theater-theater-theater')
	                    let theaters =[];
	                    theatertheatertheater.addEventListener('click',clickTheater)
                
                    
                        let locationArea = document.querySelector('.wrapper-item-location');
                        let locationSelected=document.querySelector('#none');
                        function locationAreaFunction(e){
                            if(e.target.tagName==='LI'&&e.target!=locationSelected){
                                e.target.classList.add('wrapper-item-location-selected');
                                locationSelected.classList.remove('wrapper-item-location-selected')
                                locationSelected = e.target;
                                
                                let location = e.target.getAttribute('location');
								
                                xmlHttpRequest = new XMLHttpRequest();
                                xmlHttpRequest.onreadystatechange=()=>{
                                    if(xmlHttpRequest.readyState===XMLHttpRequest.DONE&&xmlHttpRequest.status===200){
                                        console.log('communication success')

                                        let div = document.querySelector('.wrapper-item-theater');
                                        
                                        
                                        let theater =JSON.parse(xmlHttpRequest.responseText);
                                        console.log(theater);
                                        let innerhtml ="";
                                        
                                        for(i=0;i<theater.length;i++){
                                            innerhtml+='<li class="select-theater-li" theaterid= "'+theater[i].id+'" theatername= "'+theater[i].name+'">'+
                                            theater[i].name+'</li>'
                                        }
                                        
                                        div.innerHTML=innerhtml;
                                                
                                    }else{
                                       
                                    }
                                }
                                xmlHttpRequest.open('post','./movie?command=ajaxTheaterList&location='+encodeURIComponent(location),true);
                                xmlHttpRequest.send(null)
                            }

                        }
                        
                        locationArea.addEventListener('click',locationAreaFunction)
						
                        let clickedtheater = document.querySelectorAll('.reserve-layout-middle-main-bottom')[1];
						clickedtheater.addEventListener('click',(e)=>{
						 if(e.target.className==='reserve-theater-view-area-item'){
						    let clickedid = e.target.getAttribute('theaterid');
						   	theaters=theaters.filter((c)=>c.theaterId!=clickedid)
						    }
						     innerHTMLTheaters();
						     
						});
                        
                    </script>
                </div>
            </div>
            <div class="reserve-layout-middle-timetable-layout">
                <h4 style="margin-left:20px;"> 시간 </h4>
                <div class="reserve-layout-middle-layout-wrapper">
                    <div class="reserve-layout-timetable">
                        <button class= "reserve-layout-timetable-pre-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
                                <path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/>
                              </svg>
                        </button>
                        <div class="reserve-layout-timetable-view">
                            <button class="reserve-layout-timetable-view-btn">00</button>
                            <button class="reserve-layout-timetable-view-btn">01</button>
                            <button class="reserve-layout-timetable-view-btn">02</button>
                            <button class="reserve-layout-timetable-view-btn">03</button>
                            <button class="reserve-layout-timetable-view-btn">04</button>
                            <button class="reserve-layout-timetable-view-btn">05</button>
                            <button class="reserve-layout-timetable-view-btn">06</button>
                            <button class="reserve-layout-timetable-view-btn">07</button>
                            <button class="reserve-layout-timetable-view-btn">08</button>
                            <button class="reserve-layout-timetable-view-btn">09</button>
                            <button class="reserve-layout-timetable-view-btn">10</button>
                            <button class="reserve-layout-timetable-view-btn">11</button>
                            <button class="reserve-layout-timetable-view-btn">12</button>
                            <button class="reserve-layout-timetable-view-btn">13</button>
                            <button class="reserve-layout-timetable-view-btn">14</button>
                            <button class="reserve-layout-timetable-view-btn">15</button>
                            <button class="reserve-layout-timetable-view-btn">16</button>
                            <button class="reserve-layout-timetable-view-btn">17</button>
                            <button class="reserve-layout-timetable-view-btn">18</button>
                            <button class="reserve-layout-timetable-view-btn">19</button>
                            <button class="reserve-layout-timetable-view-btn">20</button>
                            <button class="reserve-layout-timetable-view-btn">21</button>
                            <button class="reserve-layout-timetable-view-btn">22</button>
                            <button class="reserve-layout-timetable-view-btn">23</button>
                            <button class="reserve-layout-timetable-view-btn">24</button>
                        </div>
                        <button class= "reserve-layout-timetable-pro-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
                                <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
                              </svg>
                        </button>
                    </div>

                    <div class = "reserve-layout-middle-main timetable-main">
                        <div class="middle-main-item" id ="timetable-area">
							
							
	


                        </div>
                    </div>
                    <script type="text/javascript">
                        let timeRightBtn= document.querySelector('.reserve-layout-timetable-pro-btn');
                        timeRightBtn.addEventListener('click',()=>{
                            document.querySelector('.reserve-layout-timetable-view').scrollLeft+=100;
                        })
                        let timeLeftBtn= document.querySelector('.reserve-layout-timetable-pre-btn');
                        timeLeftBtn.addEventListener('click',()=>{
                            document.querySelector('.reserve-layout-timetable-view').scrollLeft-=100;
                        })
                        let timeTableViewBtn = document.querySelector('reserve-layout-timetable-view');

                        const reserveLayoutTimeTableView=document.querySelector('.reserve-layout-timetable-view');
                        let timeTableViewSelectedPreTarget;
                        function timeTableViewSelected(e){
                            let timeTableViewTarget = e.target;
                            if(timeTableViewTarget.className==='reserve-layout-timetable-view-btn'){
                                timeTableViewTarget.classList.add('reserve-layout-timetable-view-btn-seleted')
                                if(timeTableViewSelectedPreTarget!=null){
                                    timeTableViewSelectedPreTarget.classList.remove('reserve-layout-timetable-view-btn-seleted');
                                }
                                timeTableViewSelectedPreTarget=timeTableViewTarget;
                                
                            }
                        }
                        reserveLayoutTimeTableView.addEventListener('click',timeTableViewSelected);
                
                        function getTimetalbleList(){
                        	
							if(date!==null&&movie.length!==0&&theaters.length!==0){
                        	
                        	let data= '{"date":"'+date+'",'
                        	data+= '"movies":'+JSON.stringify(movie)+','
                        	data+= '"theaters":'+JSON.stringify(theaters)
                        	data+= '}'
                        	xmlHttpRequest = new XMLHttpRequest();
                            xmlHttpRequest.onreadystatechange=()=>{
                                if(xmlHttpRequest.readyState===XMLHttpRequest.DONE&&xmlHttpRequest.status===200){
                                    console.log('communication success')

                                    let div = document.querySelector('#timetable-area');
                                   	let timetable =JSON.parse(xmlHttpRequest.responseText);

                                    let innerhtml ="";
                                    if(timetable.data==="nodata"){
                                    	
                                    	document.querySelector('.reserve_error_modal_box').style.display="block"
                                    	div.innerHTML=innerhtml;
                                    
                                    }else{
                                    	
                                        for(i=0;i<timetable.length;i++){
                                            innerhtml+='<a class="reserve-timetable" style="color:black"href="movie?command=select_seat&timetable_id='+timetable[i].id+'">'+
                                            				'<div class="timetable-list">'+
     				       								'<div class="timetable-list-item-1">'+
     				       									'<div style="font-size: 16px; font-weight: 600; padding-top:5px">'+
     				       										timetable[i].s_time+
     				       									'</div>'+
     				       									'<div style="font-size: 12px">~'+
     				       										timetable[i].e_time+
     				       									'</div>'+
     				       								'</div>'+
     				       								'<div class="timetable-list-item-2">'+
     				       									'<div style="padding-top:5px">'+
     					       									timetable[i].title+
     				       									'</div>'+
     				       									'<div style="font-size: 12px">'+
     				       										timetable[i].grade+
     				       									'</div>'+
     				       								'</div>'+
     				       								'<div class="timetable-list-item-3">'+
     				       									'<div  style="font-size: 12px">'+
     					       									timetable[i].theater+
     				       									'</div>'+
     				       									'<div  style="font-size: 12px">'+
     				       										timetable[i].screen+
     				       									'</div>'+
     				       									'<div style="font-size: 12px">'+
     				       										'<span style="color:#037B94">'+timetable[i].leftseat+'</span>/'+timetable[i].totalseat+
     				       									'</div>'+
     				       								'</div>'+
     				       							'</div>'+
     		                                      '</a>'
                                         }
                                    	
                                        div.innerHTML=innerhtml;
                                    }
                                    

                                    
                                    
                                            
                                }else{
                                   
                                }
                            }
                            xmlHttpRequest.open('post','./movie?command=ajaxTimetableList',true);
                            xmlHttpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                            xmlHttpRequest.send("data="+data)
                        }
                        }
		                   
                        const modal_cancle = document.querySelector('#modal_cancle')
                        modal_cancle.addEventListener('click',()=>{
                        	document.querySelector('.reserve_error_modal_box').style.display='none';	
                        });
                    </script>
                </div>

            </div>
        </div>
    </div>
<%@ include file="../include/footer.jsp" %>    
</body>
</html>