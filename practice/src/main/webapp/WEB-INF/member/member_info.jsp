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
            <div class="navTitle"><a href="">?????? ????????????</a></div>
            <div>
                <ul>
                    <li class="navList"><a href="">??????/????????????</a></li>
                    <li class="navList"><a href="">??????/????????? ?????????</a></li>
                    <li>
                        <ul class="navChild">
                            <li><a href="">???????????????</a></li>
                            <li><a href="">????????? ?????????</a></li>
                        </ul>
                        </a>
                    </li>
                    <li class="navList"><a href=""> ????????? ?????????</a></li>
                    <li>
                        <ul class="navChild">
                            <li><a href="">????????? ????????????</a></li>
                            <li><a href="">????????? ????????????</a></li>
                            </a>
                        </ul>
                    </li>
                    <li class="navList"><a href="">?????? ????????? ????????????</a></li>
                    <li class="navList"><a href="">?????? ????????????</a></li>
                    <li class="navList"><a href="">????????????</a></li>
                    <li>
                        <ul class="navChild">
                            <li><a href="">???????????? ??????</a></li>
                            <li><a href="">???????????? ??????</a></li>
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
                        <p class="mypageMainName">${sessionScope.id}??????<br />(-)???????????????.</p>
                        <p><a href="">???????????? ?????? ></a></button></p>
                    </div>
                    <div class="mypagePoint">
                        <p><a href="">??? ?????? ????????? ></a> - P</p>
                    </div>
                </div>
                <div class="myReserInfo">
                    <div class="mypageHeadText">
                        <span>?????? ????????????</span><a href="">????????? ></a>
                    </div>
                    <div class="mypageWrap">
						        <table class="reserTable">
						            <thead>
						                <tr class="reserThead">
						                    <td width="20%">????????????</td>
						                    <td width="25%">?????????</td>
						                    <td width="20%">??????</td>
						                    <td width="20%">????????????</td>
						                    <td width="15%">?????????</td>
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
                        <span>?????? ????????????</span><a href="">????????? ></a>
                    </div>
                    <div class="mypageWrap">
                        <div class="mypageContent">(?????? ????????? ????????????.)</div>
                    </div>
                </div>

                <div>
                    <div class="myEventInfo">
                        <div class="mypageHeadText"><span>?????? ?????????</span> <a href="">????????? ></a>
                        </div>
                        <div class="mypageContent">(????????? ???????????? ????????????.)</div>
                    </div>
                </div>
                <div class="myQueryInfo">
                    <div class="mypageHeadText">
                        <span>????????????</span><a href="">????????? ></a>
                    </div>
                    <div class="mypageWrap">
                        <div class="mypageContent">(??????????????? ????????????.)</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
  
<%@ include file="../include/footer.jsp" %>
</body>
</html>