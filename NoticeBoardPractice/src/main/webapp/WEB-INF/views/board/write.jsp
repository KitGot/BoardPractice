<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        #formContainer {
            max-width: 650px;
            width : 500px;
            height : 400px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            margin: 20px 0;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input,
        textarea {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 12px;
        }

        button {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button[type="reset"] {
            background-color: red;
        }

        button:hover {
            background-color: #0056b3;
        }

        button[type="reset"]:hover {
            background-color: #621313;
        }
    </style>
</head>

<body>
    <div id="formContainer">
        <form id="form1" method="post" action="insert.do">
            <div>
                <label for="title">제목:</label>
                <input type="text" name="title" id="title" placeholder="제목을 입력하세요">
            </div>
            <div>
                <label for="content">내용:</label>
                <textarea name="content" id="content" rows="4" placeholder="내용을 입력하세요"></textarea>
            </div>
            <div>
                <label for="writer">이름:</label>
                <input name="writer" id="writer" placeholder="이름을 입력해주세요">
            </div>
            <div>
                <button type="button" id="btnSave">확인</button>
                <button type="reset">취소</button>
            </div>
        </form>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var btnSave = document.getElementById('btnSave');

            btnSave.addEventListener('click', function () {
                var title = document.getElementById('title').value;
                var content = document.getElementById('content').value;
                var writer = document.getElementById('writer').value;

                if (title === "") {
                    alert("제목을 입력하세요");
                    document.form1.title.focus();
                    return;
                }
                if (content === "") {
                    alert("내용을 입력하세요");
                    document.form1.content.focus();
                    return;
                }
                if (writer === "") {
                    alert("이름을 입력하세요");
                    document.form1.writer.focus();
                    return;
                }

                document.getElementById('form1').submit();
            });
        });
    </script>
</body>

</html>