<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    
    body{
        margin-left: 80px;
        margin-bottom: 80px;
    }
    .giftContentContainer{
        display: flex;
    }
    .storeList {
        list-style: none;
    }
    .storeList a{
        text-decoration: none;
        display: inline;
        margin: 5px;
        
    }
    .giftContentContainer:hover { 
        border-radius: 3px solid blueviolet;
    }
    .giftContentContainer div{
        width:280px;
        flex-wrap: wrap;
        border: 1px solid #e0e0e0;
        border-radius: 4%;
        overflow: hidden;
    }
    .storePrice{
        border-top: 1px solid #e0e0e0;
        border-radius: 4%;
        height: 40px;
        padding-top: 25px;
        margin-bottom: 5px;
       
    }
    .giftContentContainer a{
        text-decoration: none;
    }
    .giftContentContainer img{
        width:280px;
    }
    .giftContainer{
        display: flex;
        justify-content: space-between;
        margin-top: 20px;  
    }
    .giftContentContainer div{
       margin: 15px;    
    }
    .storeImgBox{
        position: relative;

    }
    .discount{
        text-decoration: line-through;
        margin: 0px;
        padding: 0px;
        height: 28px;
    }
        
    .imgOverwrite{
        position: absolute;
        background-color: #bdbdbd;
        left: 0%;
        top: 0%;
        width: 280px;
        height: 270px;
        margin: 2px;
        padding: none;
        opacity: 0.2;

    }
    .storeHeight{
        height: 50px;
    }
    .storeFontSize{
        font-size: 28px;
        color: #512da8;
    }
    .storeBold{
        font-weight: bold;
    }
    .Storelink{
        color: black;
    }
    .storeStock{
        float: right;
        margin-right: 12px;
        padding-bottom: 4px;
        margin: 10px;
        padding: 0px;
    }
    .storeTitle{
        font-size: 23px;
        margin-left: 20px;
        margin-top: 45px;
    }
    .store{
        font-size: 35px;
        padding-bottom: 20px;
        margin-left: 20px;
    }
    .storeList{
        display: flex;
        margin-left: 20px;
    }
    .storeList div{
        border: 1px solid #bdbdbd;
        width: 235px;
        height: 28px;
        float: left;
        padding-top: 10px;
        text-align: center;
    }
    .storeList div a {
        color: black;
    }
    .storeContainer{
        width: 1200px;
    }
    .viewMore{
        color:black;
        text-decoration: none;
    }
    .moreBox{
        margin-left: 20px;
        margin-top: 45px;
    }
    </style>
</head>

<body>
    <div>
        <div class="store">스토어</div>
        <div>
            <div class="storeList">
                <div><a href="">새로운 상품</a></div>
                <div><a href="">기프트카드</a></div>
                <div><a href="">메가티켓</a></div>
                <div><a href="">팝콘/음료/굿즈</a></div>
                <div><a href="">포인트룸</a></div>
            </div>
        </div>
        <div>
            <a href="">
                <img src="../image/store_main.jsp" alt="">
            </a>
        </div>
        </div>
        <div class="storeContainer">
            <div class="giftContainer">
                <div class="storeTitle">팝콘/음료/굿즈</div>
            </div>
            <div class="giftContentContainer">
                <div class="storeImgBox"><a class="Storelink" href="">
                    <p class="imgOverwrite"></p>
                    <img class="sroteImg" src="../image/store_8.jpg" alt="">
                        <p class="storeBold">러브콤보</p>
                        <p>팝콘(L) 1 + 탄산음료(R) 2</p>
                        <p class="storePrice storeFontSize">10,000원</p>
                    </a></div>
                <div class="storeImgBox"><a class="Storelink" href="">
                    <p class="imgOverwrite"></p>
                    <img class="sroteImg" src="../image/store_9.jpg" alt="">
                        <p class="storeBold">더블콤보</p>
                        <p>팝콘(R) 1 + 탄산음료(R) 2</p>
                        <p class="storePrice storeFontSize">13,000원</p>
                    </a></div>
            </div>
        </div>
    </div>
</body>

</html>