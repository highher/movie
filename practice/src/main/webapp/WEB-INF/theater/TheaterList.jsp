<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/css/theaterList.css?after">
<meta charset="UTF-8">
<title>Theater List</title>
</head>
<body>
<body>
<%@ include file="../include/header.jsp" %>
    <div class="theater-main-layout" style="margin-top:50px;">
        <h2 style="margin-left: 10px;">전체극장</h2>
        <div class="theater-check">
            <div class="theater-check-inner-top">
                <div class="theater-check-inner-top-item" location="서울">
                    서울
                </div>
                <div class="theater-check-inner-top-item" location="경기">
                    경기
                </div>
                <div class="theater-check-inner-top-item" location="인천">
                    인천
                </div>
                <div class="theater-check-inner-top-item" location="충청">
                    충청
                </div>
                <div class="theater-check-inner-top-item" location="경상">
                    경상
                </div>
                <div class="theater-check-inner-top-item" location="전라">
                    전라
                </div>
                <div class="theater-check-inner-top-item" location="강원">
                    강원
                </div>
            </div>
            <div class="theater-check-inner-middle">
                <div class="theater-check-inner-middle-item">
                    <ul class="theater-check-inner-middle-item-list">
                        <c:forEach var="list" items="${theaterList}">
                        	<li><a href="movie?command=theaterView&id=${list.id}">${list.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="theater-check-inner-bottom">
                <p style="font-size:11px; margin-left:50px">영화관을 선택해보세요!
                <button class="theater-check-inner-bottom-login-btn">로그인하기</button></p>
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
    <script type="text/javascript" src = "${pageContext.request.contextPath}/js/TheaterList.js"></script>
</body>
</html>