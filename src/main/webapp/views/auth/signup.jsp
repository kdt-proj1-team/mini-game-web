<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<!-- Font-->
<link rel="stylesheet" type="text/css" href="css/montserrat-font.css">
<link rel="stylesheet" type="text/css"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@web3auth/modal@latest"></script>
<style>
body {
	margin: 0;
}

.page-content {
	width: 100%;
	margin: 0 auto;
	background: #3D3D3D;
	display: flex;
	display: -webkit-flex;
	justify-content: center;
	-o-justify-content: center;
	-ms-justify-content: center;
	-moz-justify-content: center;
	-webkit-justify-content: center;
	align-items: center;
	-o-align-items: center;
	-ms-align-items: center;
	-moz-align-items: center;
	-webkit-align-items: center;
}

.form-v10-content {
	background: #fff;
	width: 1100px;
	border-radius: 10px;
	-o-border-radius: 10px;
	-ms-border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	-o-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	-ms-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	-webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	margin: 95px 0;
	position: relative;
	font-family: 'Montserrat', sans-serif;
}

.form-v10-content .form-detail {
	position: relative;
	width: 100%;
	display: flex;
	display: -webkit-flex;
}

.form-v10-content .form-detail h2 {
	font-weight: 500;
	font-size: 25px;
	margin-bottom: 34px;
	padding: 33px 50px 0px 60px;
}

.form-v10-content .form-detail .form-left {
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	width: 100%;
}

.form-v10-content .form-detail .form-right {
	width: 100%;
	/* background: #4835d4;*/
	background: #1E201E;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
}

.form-v10-content .form-detail .form-right h2 {
	color: #fff;
}

.form-v10-content .form-detail .form-group {
	display: flex;
	display: -webkit-flex;
}

.form-v10-content .form-detail .form-row {
	position: relative;
	margin-bottom: 24px;
	padding-left: 60px;
	padding-right: 50px;
}

.form-v10-content .form-detail .form-left .form-group .form-row.form-row-1
	{
	width: 50%;
	padding: 0 12px 0 60px;
}

.form-v10-content .form-detail .form-left .form-group .form-row.form-row-2
	{
	width: 50%;
	padding: 0 50px 0 12px;
}

.form-v10-content .form-detail .form-left .form-group .form-row.form-row-3
	{
	width: 73%;
	padding: 0 12px 0 60px;
}

.form-v10-content .form-detail .form-left .form-group .form-row.form-row-4
	{
	width: 50%;
	padding: 0 50px 0 12px;
}

.form-v10-content .form-detail .form-right .form-group .form-row.form-row-1
	{
	width: 50%;
	padding: 0 12px 0 60px;
}

.form-v10-content .form-detail .form-right .form-group .form-row.form-row-2
	{
	width: 100%;
	padding: 0 50px 0 12px;
}

.form-v10-content .form-detail select, .form-v10-content .form-detail input
	{
	width: 100%;
	padding: 11.5px 15px 15px 15px;
	border: 1px solid transparent;
	background: transparent;
	appearance: unset;
	-moz-appearance: unset;
	-webkit-appearance: unset;
	-o-appearance: unset;
	-ms-appearance: unset;
	outline: none;
	-moz-outline: none;
	-webkit-outline: none;
	-o-outline: none;
	-ms-outline: none;
	font-family: 'Montserrat', sans-serif;
	font-size: 16px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-o-box-sizing: border-box;
	-ms-box-sizing: border-box;
}

.form-v10-content .form-detail select {
	background: 0 0;
	position: relative;
	z-index: 9;
	cursor: pointer;
}

.form-v10-content .form-detail .form-left select {
	color: #666;
}

.form-v10-content .form-detail .form-right select {
	color: #f2f2f2;
}

.form-v10-content .form-detail .select-btn {
	z-index: 0;
	position: absolute;
	top: 30%;
	right: 11.5%;
	font-size: 18px;
}

.form-v10-content .form-detail .form-left .select-btn {
	color: #666;
}

.form-v10-content .form-detail .form-right .select-btn {
	color: #f2f2f2;
}

.form-v10-content .form-detail .form-group .form-row.form-row-4 .select-btn
	{
	top: 20%;
	right: 26%;
}

.form-v10-content .form-detail .form-right .form-group .form-row.form-row-2 .select-btn
	{
	top: 20%;
	right: 19%;
}

.form-v10-content .form-detail .form-left input {
	color: #000;
}

.form-v10-content .form-detail .form-right input {
	color: #fff;
}

.form-v10-content .form-detail .form-left input, .form-v10-content .form-detail .form-left select
	{
	border-bottom: 1px solid #ccc;
}

.form-v10-content .form-detail .form-left input:focus, .form-v10-content .form-detail .form-left select:focus
	{
	border-bottom: 1px solid #999;
}

.form-v10-content .form-detail .form-right input, .form-v10-content .form-detail .form-right select
	{
	border-bottom: 1px solid;
	border-bottom-color: rgba(255, 255, 255, 0.3);
}

.form-v10-content .form-detail .form-right input:focus,
	.form-v10-content .form-detail .form-right select:focus {
	border-bottom: 1px solid #ccc;
}

.form-v10-content .form-detail .form-right select option {
	background: #4835d4;
}

.form-v10-content .form-detail .form-checkbox {
	margin-top: 37px;
	padding: 0 50px 0 60px;
	position: relative;
}

.form-v10-content .form-detail .form-checkbox input {
	position: absolute;
	opacity: 0;
}

.form-v10-content .form-detail .form-checkbox .checkmark {
	position: absolute;
	top: 1px;
	left: 60px;
	height: 15px;
	width: 15px;
	border: 1px solid #e5e5e5;
	cursor: pointer;
}

.form-v10-content .form-detail .form-checkbox .checkmark::after {
	content: "";
	position: absolute;
	left: 5px;
	top: 1px;
	width: 3px;
	height: 8px;
	border: 1px solid #fff;
	border-width: 0 2px 2px 0;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	transform: rotate(45deg);
	display: none;
}

.form-v10-content .form-detail .form-checkbox input:checked ~ .checkmark::after
	{
	display: block;
}

.form-v10-content .form-detail .form-checkbox p {
	margin-left: 34px;
	color: #e5e5e5;
	font-size: 14px;
	font-weight: 400;
}

.form-v10-content .form-detail .form-checkbox .text {
	font-weight: 400;
	color: #fff;
	text-decoration: underline;
}

.form-v10-content .form-detail .form-right .form-row-last {
	padding-left: 60px;
	margin: 44px 0 10px;
}

.form-v10-content .form-detail .form-right .register {
	background: #fff;
	border-radius: 25px;
	-o-border-radius: 25px;
	-ms-border-radius: 25px;
	-moz-border-radius: 25px;
	-webkit-border-radius: 25px;
	box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	-o-box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	-ms-box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	-webkit-box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	width: 180px;
	border: none;
	margin: 6px 0 50px 0px;
	cursor: pointer;
	color: #333;
	font-weight: 700;
	font-size: 15px;
}

.form-v10-content .form-detail .form-right .register:hover {
	background: #ccc;
}

.form-v10-content .form-detail .form-right .form-row-last input {
	padding: 12.5px;
}

.form-v10-content .form-detail .form-left input::-webkit-input-placeholder
	{ /* Chrome/Opera/Safari */
	color: #666;
	font-size: 16px;
}

.form-v10-content .form-detail .form-left input::-moz-placeholder {
	/* Firefox 19+ */
	color: #666;
	font-size: 16px;
}

.form-v10-content .form-detail .form-left input:-ms-input-placeholder {
	/* IE 10+ */
	color: #666;
	font-size: 16px;
}

.form-v10-content .form-detail .form-left input:-moz-placeholder {
	/* Firefox 18- */
	color: #666;
	font-size: 16px;
}

.form-v10-content .form-detail .form-right input::-webkit-input-placeholder
	{ /* Chrome/Opera/Safari */
	color: #f2f2f2;
	font-size: 16px;
}

.form-v10-content .form-detail .form-right input::-moz-placeholder {
	/* Firefox 19+ */
	color: #f2f2f2;
	font-size: 16px;
}

.form-v10-content .form-detail .form-right input:-ms-input-placeholder {
	/* IE 10+ */
	color: #f2f2f2;
	font-size: 16px;
}

.form-v10-content .form-detail .form-right input:-moz-placeholder {
	/* Firefox 18- */
	color: #f2f2f2;
	font-size: 16px;
}

/* Responsive */
@media screen and (max-width: 1199px) {
	.form-v10-content {
		margin: 95px 20px;
	}
}

@media screen and (max-width: 991px) and (min-width: 768px) {
	.form-v10-content .form-detail .form-group {
		flex-direction: column;
		-o-flex-direction: column;
		-ms-flex-direction: column;
		-moz-flex-direction: column;
		-webkit-flex-direction: column;
	}
	.form-v10-content .form-detail .form-left .form-group .form-row.form-row-1,
		.form-v10-content .form-detail .form-left .form-group .form-row.form-row-2,
		.form-v10-content .form-detail .form-left .form-group .form-row.form-row-3,
		.form-v10-content .form-detail .form-left .form-group .form-row.form-row-4,
		.form-v10-content .form-detail .form-right .form-group .form-row.form-row-1,
		.form-v10-content .form-detail .form-right .form-group .form-row.form-row-2
		{
		width: auto;
		padding: 0 50px 0 60px;
	}
	.form-v10-content .form-detail .select-btn, .form-v10-content .form-detail .form-left .form-group .form-row.form-row-4 .select-btn,
		.form-v10-content .form-detail .form-right .form-group .form-row.form-row-2 .select-btn
		{
		right: 15%;
	}
}

@media screen and (max-width: 767px) {
	.form-v10-content .form-detail {
		flex-direction: column;
		-o-flex-direction: column;
		-ms-flex-direction: column;
		-moz-flex-direction: column;
		-webkit-flex-direction: column;
	}
	.form-v10-content .form-detail .form-right {
		border-top-right-radius: 0px;
		border-bottom-left-radius: 10px;
	}
	.form-v10-content .form-detail .form-left {
		padding-bottom: 50px;
	}
}

@media screen and (max-width: 575px) {
	.form-v10-content .form-detail .form-group {
		flex-direction: column;
		-o-flex-direction: column;
		-ms-flex-direction: column;
		-moz-flex-direction: column;
		-webkit-flex-direction: column;
	}
	.form-v10-content .form-detail .form-row, .form-v10-content .form-detail .form-left .form-group .form-row.form-row-1,
		.form-v10-content .form-detail .form-left .form-group .form-row.form-row-2,
		.form-v10-content .form-detail .form-left .form-group .form-row.form-row-3,
		.form-v10-content .form-detail .form-left .form-group .form-row.form-row-4,
		.form-v10-content .form-detail .form-right .form-group .form-row.form-row-1,
		.form-v10-content .form-detail .form-right .form-group .form-row.form-row-2
		{
		width: auto;
		padding: 0 30px;
	}
	.form-v10-content .form-detail .select-btn, .form-v10-content .form-detail .form-left .form-group .form-row.form-row-4 .select-btn,
		.form-v10-content .form-detail .form-right .form-group .form-row.form-row-2 .select-btn
		{
		right: 15%;
	}
	.form-v10-content .form-detail h2 {
		padding: 33px 30px 0px 30px;
	}
	.form-v10-content .form-detail .form-checkbox {
		padding: 0 30px;
	}
	.form-v10-content .form-detail .form-checkbox .checkmark {
		left: 30px;
	}
	.form-v10-content .form-detail .form-right .form-row-last {
		padding-left: 0;
		text-align: center;
		margin: 44px 0 30px;
	}
}

.message {
            font-size: 0.9em;
         
</style>
</head>
<body class="form-v10">
    <div class="page-content">
        <div class="form-v10-content">
            <form id="signupForm" action="/signup.members" method="post" class="form-detail">
                <div class="form-left">
                    <h2>필수 사항</h2>
                    <div class="form-group">
                        <!-- id -->
                        <div class="form-row form-row-1">
                            <label for="userid">아이디 입력</label> 
                            <input type="text" id="userid" name="userid" placeholder="input your ID" required>
                        </div>
                        <!-- id중복확인 -->
                        <div class="form-row form-row-5">
                            <button type="button" id="duplCheck" name="duplCheck">중복확인</button>
                        </div>
                    </div>

                    <div class="form-row">
                        <label for="password">비밀번호</label> 
                        <input type="password" id="password" name="password" placeholder="input your password" required>
                    </div>
                    <div class="form-row">
                        <label for="confirmPassword">비밀번호 확인</label> 
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="confirm your password" required>
                        <div id="passwordMessage" class="message"></div>
                    </div>
                    <div class="form-row">
                        <label for="name">이름</label> 
                        <input type="text" id="name" name="name" placeholder="input your name" required>
                    </div>
                    <div class="form-row">
                        <label for="phone">전화번호</label> 
                        <input type="tel" id="phone" name="phone" placeholder="010-0000-0000" required>
                    </div>
                    <div class="form-row">
                        <label for="email">이메일</label> 
                        <input type="email" id="email" name="email" placeholder="input your email" required>
                    </div>
                </div>

                <div class="form-right">
                    <h2>선택 사항</h2>
                    <div class="form-row" style="color:white;">
                        <label for="address">주소</label><br>
                        <input class="form-row form-row-1" type="text" id="postcode" name="postcode" placeholder="우편번호를 입력하세요" readonly>
                        <button class="form-row form-row-1" type="button" id="postcode-btn" style="background-color: #white" onclick="execDaumPostcode()">우편번호 찾기</button>
                    </div>
                    <div class="form-row">
                        <input type="text" id="address1" name="address1" placeholder="주소를 입력하세요" readonly>
                    </div>
                    <div class="form-row">
                        <input type="text" id="address2" name="address2" placeholder="상세 주소를 입력하세요">
                    </div>
                    
                    <div class="form-checkbox">
                        <label class="container"><p>
                                I do accept the <a href="#" class="text">Terms and Conditions</a> of your site.
                            </p> <input type="checkbox" name="checkbox"> <span class="checkmark"></span> </label>
                    </div>
                    <div class="form-row-last">
                        <input type="submit" name="register" class="register submit-btn" value="Register">
                    </div>
                </div>
            </form>
        </div>
    </div>

<script>
    // ID 중복 확인
    $("#duplCheck").on("click", function() {
    	
    	console.log($("#userid").val()); // 콘솔에서 값이 제대로 나오는지 확인

        if ($("#userid").val() == "") {
            alert("ID를 먼저 입력하세요.");
            return;
        }

        window.open("/idcheck.members?userid=" + $("#userid").val(), "idCheckWindow", "width=400,height=300,left=100,top=100,resizable=no,scrollbars=no,toolbar=no,menubar=no,location=no,status=no");
    });

    // 비밀번호 일치 확인
    document.addEventListener("DOMContentLoaded", function () {
    const password = document.getElementById("password");
    const confirmPassword = document.getElementById("confirmPassword");
    const passwordMessage = document.getElementById("passwordMessage");

    function checkPasswordMatch() {
        if (password.value && confirmPassword.value) {
            if (password.value === confirmPassword.value) {
                passwordMessage.textContent = "비밀번호가 일치합니다";
                passwordMessage.className = "message success";
            } else {
                passwordMessage.textContent = "비밀번호가 일치하지 않습니다";
                passwordMessage.className = "message error";
            }
        } else {
            passwordMessage.textContent = "";
        }
    }

    password.addEventListener("keyup", checkPasswordMatch);
    confirmPassword.addEventListener("keyup", checkPasswordMatch);
});


    // 유효성 검사
    const signupForm = document.getElementById("signupForm");
    signupForm.onsubmit = function(event) {
        event.preventDefault(); // 폼 제출 방지
        
        if (!validateForm()) {
            return false;
        }

        // 모든 검사를 통과하면 폼 제출
        signupForm.submit();
    };
    
    function validateForm() {
        const userid = document.getElementById("userid").value.trim();
        const password = document.getElementById("password").value.trim();
        const confirmPassword = document.getElementById("confirmPassword").value.trim();
        const name = document.getElementById("name").value.trim();
        const phone = document.getElementById("phone").value.trim();
        const email = document.getElementById("email").value.trim();

        if (!userid) {
            alert("ID는 필수 입력 사항입니다.");
            return false;
        }
        if (!password || !confirmPassword) {
            alert("패스워드는 필수 입력 사항입니다.");
            return false;
        }
        if (password !== confirmPassword) {
            alert("패스워드가 일치하지 않습니다.");
            return false;
        }
        if (!name) {
            alert("이름은 필수 입력 사항입니다.");
            return false;
        }
        if (!phone) {
            alert("전화번호는 필수 입력 사항입니다.");
            return false;
        }
        if (!email) {
            alert("이메일은 필수 입력 사항입니다.");
            return false;
        }

        const nameRegex = /^[가-힣]{2,5}$/;
        const pwRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;
        const phoneRegex = /^01[0|1|6|7|8|9][- ]?\d{3,4}[- ]?\d{4}$/;
        const emailRegex = /^[\w.-]+@[\w.-]+\.\w{2,}$/;

        if (!pwRegex.test(password)) {
            alert("비밀번호는 대문자, 소문자, 숫자, 특수문자를 포함하여 8자 이상으로 입력해주세요.");
            return false;
        }
        if (!nameRegex.test(name)) {
            alert("이름은 한글 2~5자로 입력해주세요.");
            return false;
        }
        if (!phoneRegex.test(phone)) {
            alert("전화번호 형식을 확인해주세요. 예: 010-1234-5678");
            return false;
        }
        if (!emailRegex.test(email)) {
            alert("이메일 형식을 확인해주세요.");
            return false;
        }

        return true;
    }

    // 주소 검색
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address1').value = data.roadAddress;
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>