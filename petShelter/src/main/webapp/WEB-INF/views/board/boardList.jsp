<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .content {
            background-color: #ffffff;
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .innerOuter {
            border: 1px solid #e9ecef;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
        }
        #boardList {
            text-align: center;
        }
        #boardList>tbody>tr:hover {
            cursor: pointer;
            background-color: #f1f1f1;
        }
        #pagingArea {
            width: fit-content;
            margin: 20px auto;
        }
        #categoryNo {
		    padding: 0.5rem;
		    font-size: 1rem;
		    border: 1px solid #6c757d;
		    border-radius: 4px;
		    background-color: while;
		    
		}
        #searchForm {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        #searchForm>* {
            margin: 5px;
        }
        .select {
            width: 20%;
        }
        .text {
            width: 50%;
        }
        .searchBtn {
            width: 20%;
        }
    </style>
</head>
<body>
    
    <%@include file="../common/header.jsp" %>

    <div class="content">
        <div class="innerOuter">
            <h2 class="text-center">게시판</h2>
            <%-- <c:if test="${not empty loginUser}"> --%>
                <a class="btn btn-secondary mb-3 float-right" href="insert.bo">글쓰기</a>
            <%-- </c:if> --%>
            <br><br>
            <div class="category-area">
                <select id="categoryNo">
                    <option value="0">전체</option>
                    <option value="1">자랑</option>
                    <option value="2">질문</option>
                    <option value="3">자유</option>
                </select>
            </div>
            <table id="boardList" class="table table-hover table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>첨부파일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty list}">
                            <tr>
                                <td colspan='6' class="text-center">조회된 게시글이 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${list}" var="b">
                                <tr>
                                    <td>${b.boardNo}</td>
                                    <td>${b.boardTitle}</td>
                                    <td>${b.boardWriter}</td>
                                    <td>${b.count}</td>
                                    <td>${b.createDate}</td>
                                    <td>
                                        <c:if test="${not empty b.fileNo}">
                                            ★
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${pi.currentPage eq 1}">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage-1}">Previous</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${p}">${p}</a></li>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${pi.currentPage eq pi.maxPage}">
                            <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage+1}">Next</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <form id="searchForm" action="" method="get">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

    <script>
        $(function() {
            $("#boardList tbody>tr").click(function() {
                var bno = $(this).children().first().text();
                location.href = "/boot/board/detail.bo?boardNo=" + bno;
            });
        });
    </script>

</body>
</html>
