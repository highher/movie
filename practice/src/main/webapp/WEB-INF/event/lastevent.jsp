<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/5ae31fdf61.js" crossorigin="anonymous"></script>
<style>
    .lastEvent{
        display: flex;
        padding: 10px;
        flex-direction: row;
        border-bottom: 1px solid #bcbcbc;
    }
    .lastEvent a {
        text-decoration: none;
        color: black;
    }
    .lastEvent img{
        width: 120px;
    }
    .lastEvent>div{
        margin-right: 20px;
    }
    .lastEventContainer{
        margin-top: 20px;
    }
    .lastEventInput{
        float: right;
    }
    .lastEventHeader{
        padding-bottom: 20px;
        border-bottom: 1px solid black;
    }
    .lastEventNaem{
        font-weight: bold;
        margin-bottom: 30px;
    }
</style>
<title>Last event</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<div style ="width:1080px; margin:0px auto; margin-top:50px; margin-bottom: 100px">
        <div class="lastEventHeader">
            <h2>지난 이벤트</h2>
            <p>- 응모하신 이벤트의 당첨여부는 당첨자발표의 나의 응모결과 확인을 통해 확인하실 수 있습니다.</p>
            <span>전체 8건</span> 
                <span class="lastEventInput">
                    <input type="text" placeholder="검색어를 입력하세요">
                    <button>
                        <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                    </button>
                </span>
        </div>
        <div class="lastEventContainer">
            <a href="">
            <div class="lastEvent">
                <div>
                	<img src="${pageContext.request.contextPath}/img/event/discount__10.jpg" >
                </div>
                <div>
                    <p class="lastEventNaem">(인생은아름다워)시사회</p>
                    <span>2022.10.02~2022.10.03</span>
                </div>
            </div>
            </a>
       </div>
      </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>