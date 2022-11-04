<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <div class="total-timetable-layout">
        <div class="total-timetable-menu-wrapper">
            <div class="total-timetable-menu-bar"> 
                <div class="total-timetable-menu-bar-item">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor" class="bi bi-film" viewBox="0 0 16 16">
                        <path d="M0 1a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V1zm4 0v6h8V1H4zm8 8H4v6h8V9zM1 1v2h2V1H1zm2 3H1v2h2V4zM1 7v2h2V7H1zm2 3H1v2h2v-2zm-2 3v2h2v-2H1zM15 1h-2v2h2V1zm-2 3v2h2V4h-2zm2 3h-2v2h2V7zm-2 3v2h2v-2h-2zm2 3h-2v2h2v-2z"/>
                      </svg>영화별
                </div>
                <div class="total-timetable-menu-bar-item">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
                        <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
                      </svg>극장별
                </div>
            </div>
            <div class="total-timetable-main">
                <div class="total-timetable-main-theater-wrapper">
                    <div class="total-timetable-main-theater">
                        <div class="total-timetable-main-theater-item">
                            <div class="total-timetable-main-theater-category">
                                <div style="font-size:15px;height:40px;border-bottom:1px solid #cecccc;">
                                    <button style="height: 100%; background-color: transparent; border:none;border-bottom: 3px solid rgb(73, 73, 73);">전체영화</button>
                                </div>
                            </div>
                            <div class="total-timetable-main-theater-item-li">
                            	
                                <c:forEach var="list" items="${movielist}">
                                	<li movieid="${list.id}" movieimg="${pageContext.request.contextPath}/img/poster/${list.img}" movietitle="${list.title}">
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
                                	</li>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="total-timetable-main-theater-item-img-box">
                            
                        </div>
                    </div>
                </div>
                <div class="total-timetable-main-theater-wrapper">
                    <div class="total-timetable-main-theater">
                        <div class="total-timetable-main-theater-item">
                            <div class="total-timetable-main-theater-category">
                                <div class="theaterbtn-wrapper">
                                	<button class="theaterbtn total-timetable-main-theater-item-li-select" style="display:none" location="히든">히든</button>
                                    <button class="theaterbtn" location="서울">서울</button>
                                    <button class="theaterbtn" location="인천">인천</button>
                                    <button class="theaterbtn" location="경기">경기</button>
                                    <button class="theaterbtn" location="충청">충청</button>
                                    <button class="theaterbtn" location="경상">경상</button>
                                    <button class="theaterbtn" location="전라">전라</button>
                                    <button class="theaterbtn" location="강원">강원</button>
                                </div>
                            </div>
                            <div class="total-timetable-main-theater-item-li-2">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="search-result-timetable-layout">
		<div class="search-result-timetable-layout-menu">
		</div>    
    	<div class="search-result-timetable-layout-result">
    	</div>
    </div>
                <script type ="text/javascript">
            	let selectMv = {'movieid':""};
            	let pretarget=document.querySelectorAll('.theaterbtn')[0];
            	const ttmtil=document.querySelector('.total-timetable-main-theater-item-li');
            	ttmtil.addEventListener('click',(e)=>{
            		const target=e.target;
            		let movieObject = {'movieid':target.getAttribute('movieid'), 'movietitle':target.getAttribute('movietitle'),
            				'movieimg':target.getAttribute('movieimg')};
            		if(target.tagName='LI'&&target.getAttribute('movieid')!=selectMv.movieid){
            			target.classList.add('total-timetable-main-theater-item-li-select');
            			pretarget.classList.remove('total-timetable-main-theater-item-li-select');
            			pretarget=target;
            			selectMv=movieObject;
            			innerImg()
            		}
            	})
            	function selectTimeTableByMovie(){
            		const div = document.querySelector('.search-result-timetable-layout-menu');
            		let innerhtml = ''
            	}
            
            	function innerImg(){
            		const div = document.querySelector('.total-timetable-main-theater-item-img-box')
            		let innerhtml='<img class="total-timetable-main-theater-item-img" src = "'+selectMv.movieimg+'">';
            		div.innerHTML="";
            		div.innerHTML=innerhtml;
            	}
            	
            
                const selectBtn = document.querySelector('.total-timetable-menu-bar');
                let totaltimetablemaintheaters = document.querySelectorAll('.total-timetable-main-theater-wrapper');
                let totaltimetablemaintheaters_array = Array.prototype.slice.call(totaltimetablemaintheaters);
                let preselectBtn = document.querySelectorAll('.total-timetable-menu-bar-item')[0];
                totaltimetablemaintheaters_array[1].style.display='none';
                preselectBtn.classList.add('total-timetable-menu-bar-item-selected')
                selectBtn.addEventListener('click',(e)=>{
                    const target = e.target;
                    if(target.className=='total-timetable-menu-bar-item'&&target!=preselectBtn){
                        preselectBtn.classList.remove('total-timetable-menu-bar-item-selected');
                        target.classList.add('total-timetable-menu-bar-item-selected');
                        totaltimetablemaintheaters_array[0].style.display='none';
                        totaltimetablemaintheaters_array[1].style.display='block';
                        totaltimetablemaintheaters_array.reverse();
                        preselectBtn=target;
                    }
                })
                function getTheaterListbyLocation(location){
                    xmlHttpRequest = new XMLHttpRequest();
                    xmlHttpRequest.onreadystatechange=()=>{
                        if(xmlHttpRequest.readyState===XMLHttpRequest.DONE&&xmlHttpRequest.status===200){
                            console.log('communication success')

                            let div = document.querySelector('.total-timetable-main-theater-item-li-2');
                            console.log(xmlHttpRequest.responseText)
                            let theater =JSON.parse(xmlHttpRequest.responseText);
                            console.log(theater);
                            let innerhtml ="";
                            
                            for(i=0;i<theater.length;i++){
                                innerhtml+='<li theaterid= "'+theater[i].id+'">'+
                                theater[i].name+'</li>'
                            }
                            
                            div.innerHTML=innerhtml;
                                    
                        }else{
                          
                        }
                    }
                    xmlHttpRequest.open('post','./movie?command=ajaxTheaterList&location='+encodeURIComponent(location),true);
                    xmlHttpRequest.send(null)
                }
                
                const theaterbtn = document.querySelector('.theaterbtn-wrapper');
                let pretheaterbtn = document.querySelectorAll('.theaterbtn')[0];
                pretheaterbtn.classList.add('theaterbtn-selected');
                theaterbtn.addEventListener('click',(e)=>{
                    const target = e.target;
                    if(target.className=='theaterbtn'&&target!=pretheaterbtn){
                        let location=target.getAttribute('location');
                        getTheaterListbyLocation(location)
                        target.classList.add('theaterbtn-selected');
                        pretheaterbtn.classList.remove('theaterbtn-selected');
                        pretheaterbtn=target;

                    }
                })
            </script>
    <%@ include file="../include/footer.jsp" %>    
</body>
</html>