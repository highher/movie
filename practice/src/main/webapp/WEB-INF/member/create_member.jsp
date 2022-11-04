<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create member</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>

    <style>
        .login-head {
            margin-bottom: 10px;
            height: 100px;
            line-height: 6rem;
            background-color: #e0f2f1;
        }

        .login-container {
            text-align: center;
           margin: 0px auto;
           margin-top: 20px;
           margin-bottom: 50px;
        }

        .loginletter {
            font-size: 35px;
        }


        .loginletter b {
            color: #4db6ac;
        }

        .loginInput {
            width: 320px;
            height: 50px;
            margin-bottom: 5px;
        }

        .login-submit {
            height: 50px;
            width: 325px;
            border-radius: 5%;
            background-color: #80cbc4;
            border: none;
        }

        .loginform {
            margin-bottom: 30px;
        }

        .emailInput {
            width: 120px;
            height: 50px;
        }

        .emailBack {
            width: 170px;
            height: 50px;
        }

        .emailSelect{
            position: absolute;
            right: 500px;
        }
        .semi-box{
        	text-align: center;
        	margin: 0px auto;
        	justify-content: center;
        }
    </style>
    <div class="login-container">
        <div class="login-head">
            <span class="loginletter"><b>회원가입</b>페이지 입니다.</span>
        </div>
        <div class="semi-box">
         <form method="post" action="movie?command=create_member_process" name="resisterForm">
            <div>
                <div class="loginform">
                        <div><input class="loginInput" type="text" id="name" name="name" placeholder="이름"></div>
                        <div><input class="loginInput inputId" type="text" id="id" name="id" placeholder="아이디">
                        </div>
                        <div><input class="loginInput" type="text" id="password" name="password"
                                placeholder="영문자+숫자+특수문자 조합"></div>
                        <div><input placeholder=' "-" 없이 숫자만 입력하세요. ' class="loginInput" type="tel" id="phoneNumber"
                                name="phoneNumber" placeholder="전화번호">
                        </div>
                        <div class="emailSel">
                            <label><input class="loginInput emailInput" type="text" id="email" name="email"
                                    placeholder="이메일">@</label>
                            <input class="emailBack" type="text" name="emailAdd">
                        </div>
                </div>
                <div>
                    <div>
                        <input class="login-submit" type="submit" value="회원가입">
                    </div>
                </div>
            </div>
            </form>
            
            
                           <script>
                    const id = document.getElementById("id");
                    id.addEventListener('focusout',(event)=>{
                        const idCheck= "var pattern= /^[A-za-z0-9]{4,12}$/";
                        if(!idCheck.test(event.target.value)){
                            return false;
                        }
                    })
                    const name = document.getElementById("name");
                    id.addEventListener('focusout',(event)=>{
                        const idCheck= "dsfdsf>*RE";
                        if(!idCheck.test(event.target.value)){
                            return false;
                        }
                    })
                    const password = document.getElementById("password");
                    id.addEventListener('focusout',(event)=>{
                        const idCheck= "dsfdsf>*RE";
                        if(!idCheck.test(event.target.value)){
                            return false;
                        }
                    })
                    const phoneNumber = document.getElementById("phoneNumber");
                    id.addEventListener('focusout',(event)=>{
                        const idCheck= "dsfdsf>*RE";
                        if(!idCheck.test(event.target.value)){
                            return false;
                        }
                    })
                    const email = document.getElementById("email");
                    id.addEventListener('focusout',(event)=>{
                        const idCheck= "dsfdsf>*RE";
                        if(!idCheck.test(event.target.value)){
                            return false;
                        }
                    })

                </script>
        
        </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>