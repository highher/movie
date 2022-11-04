<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../include/header.jsp" %>

	<div style ="margin:60px auto; width:1080px; height:600px;  text-align: center;">
		<h2>예매가 완료되었습니다</h2>
		<h3>예매 확인하러가기</h3>
		<button  id = "confrim" style ="background-color: white; width: 200px; height: 50px; border-radius: 10%; cursor: pointer;">확인한다</button>
	</div>
	
	<script>
	
	const confirm = document.querySelector('#confrim')
	confirm.addEventListener('click',()=>{
		location.href="movie?command=member_info"
	})
	
	</script>

<%@ include file="../include/footer.jsp" %>

</body>
</html>