<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var btnDelete = document.getElementById('btnDelete');
        var btnUpdate = document.getElementById('btnUpdate');

        btnDelete.addEventListener('click', function() {
            if (confirm("삭제하시겠습니까?")) {
                document.getElementById('form1').action = "delete.do";
                document.getElementById('form1').submit();
            }
        });

        btnUpdate.addEventListener('click', function() {
            var title = document.getElementById('title').value;
            var content = document.getElementById('content').value;
            var writer = document.getElementById('writer').value;

            if (title === "" || content === "" || writer === "") {
                alert("제목, 내용, 이름을 모두 입력하세요");
                return;
            }

            document.getElementById('form1').action = "update.do";
            document.getElementById('form1').submit();
        });
    });
</script>

<head>
    <meta charset="UTF-8">
    <title>게시글 보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
		
        h2 {
            margin-bottom: 10px;
        }

        form {
            max-width: 650px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }

        div {
            margin-bottom: 10px;
        }

        input,
        textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }


        
        #btnDelete{
			background-color: red;	
			padding: 10px;
            margin-right: 5px;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
		}
		#btnUpdate{
			background-color: #007bff;
			padding: 10px;
            margin-right: 5px;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;	
		}

    </style>
</head>

<body>
    <form id="form1" method="post">
        <div>
            작성일자 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss" />
        </div>
        <div>
            조회수 : ${dto.viewcnt}
        </div>
        <div>
            제목 : <input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력해주세요">
        </div>
        <div>
            내용 : <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${dto.content}</textarea>
        </div>
        <div>
            작성자 : ${dto.writer}
        </div>
        <div>
            <input type="hidden" name="bno" value="${dto.bno}">
            <button type="button" id="btnUpdate">수정</button>
            <button type="button" id="btnDelete">삭제</button>
        </div>
    </form>
</body>

</html>