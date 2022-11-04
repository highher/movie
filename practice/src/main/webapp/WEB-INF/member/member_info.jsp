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
    <style>

        .mypageMainName {
            font-size: 30px;
        }
        .mypagePoint {

            height: 110px;
        }

        .mypageMainHead a {
            text-decoration: none;
            color: black;
        }

        .mypageMain span {
            font-size: 22px;
        }

        .mypageHeadText {
            border-bottom: 1px solid black;
            height: 40px;
        }

        .mypageHeadText a {
            text-decoration: none;
        }

        .mypageWrap {
            height: 200px;

        }

        .mypageContent {
            line-height: 10rem;
            text-align: center;
        }
    </style>
    <style>
        .navTitle {
            background-color: #263238;
            height: 65px;
            text-align: center;
            vertical-align: middle;
            line-height: 3.6rem;
        }

        .navTitle a {
            text-decoration: none;
            color: white;
        }

        .navContainer {
            width: 200px;
            background-color: #eeeeee;
            border-radius: 2%;
            overflow: hidden;
        }

        .navContainer ul {
            margin: 0px;
            padding: 0px;
        }

        .navContainer {
            list-style: none;
            border: 1px solid #9e9e9e;
            height: 525px;
            margin-right: 50px;
        }

        .navList {
            height: 35px;
            border-bottom: 1px solid #bdbdbd;
            padding-left: 8px;
            padding-top: 8px;
        }

        .navChild {
            height: 65px;
            background-color: white;
            font-size: 14px;
        }

        .navChild li {
            margin-left: 10px;
            padding-top: 7px;
        }

        .navList a {
            color: #3c4a50;
            text-decoration: none;
        }

        .navChild a {
            text-decoration: none;
            color: #3c4a50;
        }

        .myPageFlexContainer {
            display: flex;
            
            justify-content: center;
        }
        .mypageContainer{
            width: 700px;
        }
        .reserTable {
            width:100%;
            margin-top: 10px;
            text-align: center;
        }
        .reserTable{
        	font-size: 12px;
        }
        .reserThead {
            background-color: #eeeeee;
            font-size: 15px;
        }
        .reserThead{
        	height: 50px;
        }
        .reserInfo{
            text-align: center;
            line-height: 4rem;
        }

        
    </style>

<div style ="widows: 1180px; margin:50px auto;">
  <div class="myPageFlexContainer">
        <div class="navContainer">
            <div class="navTitle"><a href="">나의 메가박스</a></div>
            <div>
                <ul>
                    <li class="navList"><a href="">예매/구매내역</a></li>
                    <li class="navList"><a href="">영화/스토어 관람권</a></li>
                    <li>
                        <ul class="navChild">
                            <li><a href="">영화관람권</a></li>
                            <li><a href="">스토어 교환권</a></li>
                        </ul>
                        </a>
                    </li>
                    <li class="navList"><a href=""> 멤버십 포인트</a></li>
                    <li>
                        <ul class="navChild">
                            <li><a href="">포인트 이용내역</a></li>
                            <li><a href="">멤버십 카드관리</a></li>
                            </a>
                        </ul>
                    </li>
                    <li class="navList"><a href="">나의 이벤트 응모내역</a></li>
                    <li class="navList"><a href="">나의 문의내역</a></li>
                    <li class="navList"><a href="">회원정보</a></li>
                    <li>
                        <ul class="navChild">
                            <li><a href="">개인정보 수정</a></li>
                            <li><a href="">선택정보 수정</a></li>
                        </ul>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="mypageContainer">
            <div class="mypageMain">

                <div class="mypageMainHead">
                    <div>
                        <p class="mypageMainName">${sessionScope.id}님은<br />(-)등급입니다.</p>
                        <p><a href="">개인정보 수정 ></a></button></p>
                    </div>
                    <div class="mypagePoint">
                        <p><a href="">총 보유 포인트 ></a> - P</p>
                    </div>
                </div>
                <div class="myReserInfo">
                    <div class="mypageHeadText">
                        <span>나의 예매내역</span><a href="">더보기 ></a>
                    </div>
                    <div class="mypageWrap">
						        <table class="reserTable">
						            <thead>
						                <tr class="reserThead">
						                    <td width="20%">구매일시</td>
						                    <td width="25%">영화명</td>
						                    <td width="20%">극장</td>
						                    <td width="20%">상영일시</td>
						                    <td width="15%">자리수</td>
						                </tr>
						            </thead>
						            <tbody>
						                <c:forEach var="list" items="${list}">
						                
						                 <tr>
						                    <td>${list.o_date}</td>
						                    <td>${list.title}</td>
						                    <td>${list.theater} ${list.screen}</td>
						                    <td>${list.date} / ${list.s_time}</td>
						                    <td>${list.amount}</td>
						                </tr>
						                
						                </c:forEach>
						            
						            </tbody>
						        </table>				                        
                    </div>
                </div>

                <div class="myPurchaseInfo">
                    <div class="mypageHeadText">
                        <span>나의 구매내역</span><a href="">더보기 ></a>
                    </div>
                    <div class="mypageWrap">
                        <div class="mypageContent">(구매 내역이 없습니다.)</div>
                    </div>
                </div>

                <div>
                    <div class="myEventInfo">
                        <div class="mypageHeadText"><span>참여 이벤트</span> <a href="">더보기 ></a>
                        </div>
                        <div class="mypageContent">(참여한 이벤트가 없습니다.)</div>
                    </div>
                </div>
                <div class="myQueryInfo">
                    <div class="mypageHeadText">
                        <span>문의내역</span><a href="">더보기 ></a>
                    </div>
                    <div class="mypageWrap">
                        <div class="mypageContent">(문의내역이 없습니다.)</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
  
<%@ include file="../include/footer.jsp" %>
</body>
</html>