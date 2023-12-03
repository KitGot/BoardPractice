<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>전체 게시글 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        #btnWrite {
            display: inline-block;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #btnWrite:hover {
            background-color: #218838;
        }

        .pagination {
            margin: 20px 0;
            display: flex;
            justify-content: center;
        }

        .pagination a {
            color: #007bff;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 4px;
        }

        .pagination a.active {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>

<body>
    <h1><b>토론 일지 작성</b></h1>
    <button type="button" id="btnWrite">새로 글쓰기</button>

    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>이름</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="row" items="${list}">
            <tr>
                <td>${row.bno}</td>
                <td><a href="view.do?bno=${row.bno}">${row.title}</a></td>
                <td>${row.writer}</td>
                <td>
                    <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
                </td>
                <td>${row.viewcnt}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="pagination">
        <c:forEach var="pageNum" begin="1" end="${totalPages}">
            <a href="list.do?page=${pageNum}" class="${pageNum == currentPage ? 'active' : ''}">
                ${pageNum}
            </a>
        </c:forEach>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var btnWrite = document.getElementById('btnWrite');

            if (btnWrite) {
                btnWrite.addEventListener('click', function () {
                    window.location.href = 'write.do';
                });
            }
        });
    </script>
</body>

</html>