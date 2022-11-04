<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
crossorigin="anonymous">
<link rel="stylesheet" href = "${pageContext.request.contextPath}/css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<form action = "MultiController" method = "post" enctype="multipart/form-data">
		<p><label>영화 제목</label><input type="text" name = "title">
		<p><label>영화 내용</label><textarea rows="5" cols="30" name = "content"></textarea>
		<p><label>영화 이미지</label><input type="file" name = "image">
		<p><label>영화 감독</label><input type="text" name = "director">
		<p><label>영화 출연배우</label><input type="text" name = "actor">
		<p><label>영화 개봉일</label><input type="date" name = "date">
		<p><label>영화 제작국가</label><input type="text" name = "nation">
		<p><label>영화 장르</label><input type="text" name = "genre">
		<p><label>영화 상영시간</label><input type="text" name = "time">
		<p><label>영화 평점</label><input type="text" name = "score">
		<p><label>영화 관객수</label><input type="text" name = "amount">
		<p><input type = "submit" value = "등록">
	</form>
<%@ include file="../include/footer.jsp" %>
</body>
<script async type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
</html>