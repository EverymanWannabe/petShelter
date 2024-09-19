<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 작성</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
            vertical-align: top;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"], textarea {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
        }
        .back-link a {
            color: #007bff;
            text-decoration: none;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>게시물 작성</h1>
        
        <form action="${pageContext.request.contextPath}/insert.bo" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td><label for="boardTitle">제목:</label></td>
                    <td><input type="text" id="boardTitle" name="boardTitle" required /></td>
                </tr>
                <tr>
                    <td><label for="memberNo">회원번호:</label></td>
                    <td><input type="number" id="memberNo" name="memberNo" required /></td>
                </tr>
                <tr>
                    <td><label for="categoryNo">카테고리번호:</label></td>
                    <td><input type="number" id="categoryNo" name="categoryNo" required /></td>
                </tr>
                <tr>
                    <td><label for="boardContent">내용:</label></td>
                    <td><textarea id="boardContent" name="boardContent" rows="10" required></textarea></td>
                </tr>
                <tr>
                    <td><label for="fileNo">파일번호:</label></td>
                    <td><input type="number" id="fileNo" name="fileNo" /></td>
                </tr>
                <tr>
                    <td><label for="fileUpload">파일 업로드:</label></td>
                    <td><input type="file" id="fileUpload" name="upfile" /></td>
                </tr>
            </table>
            <input type="submit" value="작성하기" />
        </form>
        
        <p class="back-link"><a href="${pageContext.request.contextPath}/board/list.bo">게시물 목록으로 돌아가기</a></p>
    </div>
</body>
</html>
