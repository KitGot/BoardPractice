<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <form class="login-form" action="login.do">
        <h2>Login</h2>
        <label for="username">ID:</label>
        <input type="text" id="id" name="id" placeholder="Enter your ID">
		<br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password">

        <button id="login-button" type="submit">Login</button>
        <button id="signup-button" type="button">Sign Up</button>
    </form>
</body>






<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #fff; /* 배경색을 흰색으로 설정 */
}

.login-form {
    width: 300px;
    margin: 100px auto;
    padding: 20px;
    background-color: #fff; /* 폼 배경색을 흰색으로 설정 */
    border: 1px solid #ccc;
    border-radius: 5px;
}

h2 {
    color: #000; /* 글씨색을 검정색으로 설정 */
}

label {
    display: block;
    margin-bottom: 8px;
    color: #000; /* 글씨색을 검정색으로 설정 */
}

input {
    width: 100%;
    padding: 8px;
    margin-bottom: 16px;
    box-sizing: border-box;
}

#login-button {
    background-color: #007bff; /* 로그인 버튼 배경색을 파란색으로 설정 */
    color: #fff; /* 글씨색을 흰색으로 설정 */
    padding: 10px;
    width: 100%;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

#signup-button {
    color: #007bff; /* 글씨색을 파란색으로 설정 */
    background-color: transparent;
    border: none;
    cursor: pointer;
}
</style>
</html>