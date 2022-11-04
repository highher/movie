<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../include/header.jsp" %>
	<style>
        .login-head{
        	width:400px;
        	margin: auto;
            margin-bottom: 30px;
            height: 100px;
            background-color: #e0f2f1;
        }
        .login-container {
        	width:1080px;
        	align-items:center;
            margin: 20px auto;
            text-align: center;
        }

        .loginletter {
            font-size: 39px;
            line-height: 6rem;
        }

        .loginletter b {
            color: #4db6ac;
        }

        .loginInput {
            width: 320px;
            height: 50px;
            margin-bottom: 5px;
        }

        .loginbox a {
            text-decoration: none;
            color: black;
        }

        .loginbox {
            display: flex;
            justify-content: center;

        }

        .loginbox div {
            margin: 20px;
        }

        .login-submit {
            height: 50px;
            width: 325px;
            border-radius: 5%;
            background-color: #80cbc4;
            border: none;
            margin-bottom: 8px;
            margin-top: 20px;
        }
          .kakaoLogoImg{
          margin-left:9px;
          }
        .kakaoLogoImg img{
            height: 50px;
            width: 325px;
            border-radius: 5%;
        }
        .semi-box{
        justify-content: center;
        }
        .loginerrormodal{
        position: fixed;
        background-color: rgba(0, 0, 0, 0.5);
        top: 0; 
        left: 0; 
        bottom: 0; 
        right: 0;
        }
        .modal__box{
        z-index:10;
		  position: absolute;
		  top: 100px; left: calc(50vw - 200px);
		  background-color: white;
		  text-align:center;
		  overflow:hidden;
		  border-radius: 10px;
		  width: 400px;
		  height: 200px;
	}
     #loginfailmodal:hover {
     cursor: pointer;

     }
   
    </style>
    
    <div class="login-container">
        <div class="login-head">
	        <c:choose>
	        	<c:when test="${not empty error}">
			        <div class="loginerrormodal">
						<div class="modal__box">
					    	<div style="width:100%; height: 35px; background-color: #993399; margin-bottom: 50px; text-align: end">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="35" fill="white" class="bi bi-x-circle-fill" viewBox="0 0 16 16" style="margin-right: 5px;"  id="loginfailmodal">
							  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
							</svg>
					    	</div>
					    	로그인에 실패하였습니다.<br/>
					    	비밀번호/ 아이디를 확인해주세요.
					    </div>
					</div>
	        	</c:when>
	        	<c:otherwise>
	        	</c:otherwise>
	        </c:choose>
            <span class="loginletter"><b>로그인</b>페이지 입니다.</span>
        </div>
        <div class="semi-box">
         <form method="post" action="movie">
            <input type="hidden" name="command" value="loginprocess">
            <div>
                <div class="loginform">
                        <div><input class="loginInput" type="text" name="id" placeholder="아이디"></div>
                        <div><input class="loginInput" type="password" name="password" placeholder="비밀번호"></div>
                        <input class="saveid" type='checkbox' name='id-save' value='id-save' />아이디 저장
                </div>
                <div>
                    <div>
                        <input class="login-submit" type="submit" value="로그인">
                    </div>
                    <div class="kakaoLogoImg">
                        <a href="javascript:kakaoLogin();" class="kakaologin">
                            <img class="kakaoLogo" src="${pageContext.request.contextPath}/img/logo/kakao.png" alt="카카오톡 로고">
                        </a>
                    </div>
                    <div class="loginbox">
                        <div class="find-id"><a href="">ID/PW찾기</a></div>
                        <div class="find-ps"><a href="movie?command=create_member">회원가입</a></div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
    <script src="http://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>

        window.Kakao.init("b95c8a17a2e7ac479ed163e9700b4566");

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname,account_email,gender',
                success: function (authObj) {
                    console.log(authObj);
                    window.Kakao.API.request({
                        url: '/v2/user/me',
                        success: res => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                        }
                    });
                }
            });


        }

        
        const modalcancle_btn = document.querySelector('#loginfailmodal');
        modalcancle_btn.addEventListener('click',()=>{
        	document.querySelector('.loginerrormodal').style.display='none';
        })
        
    </script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>