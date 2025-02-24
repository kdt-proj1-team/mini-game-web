<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="auth.dto.UsersDTO"%>
<%@ page import="games.dto.GameRecordDTO"%>
<%@ page import="java.util.List, java.util.Map, board.dto.BoardDTO"%>

<%
    
    UsersDTO loginUser = (UsersDTO) session.getAttribute("loginUser");
    if (loginUser == null) {
        response.sendRedirect("views/auth/login.jsp"); // 로그인 안 되어 있으면 로그인 페이지로 리디렉션
        return;
    }
    
    GameRecordDTO gameRecord = (GameRecordDTO) request.getAttribute("gameRecord");
    if (gameRecord == null) {
        // 게임이 없을 때, 어떻게 처리할 지 의논하기 
        //return;
    }
    
    List<BoardDTO> userBoardList = (List<BoardDTO>) request.getAttribute("userBoardList");
    System.out.println(userBoardList);
    if (userBoardList == null) {
        // 게시물이 없을 때, 어떻게 처리할 지 의논하기 
        //return;
    }
    
    Map<String, Integer> highestScores = (Map<String, Integer>) request.getAttribute("highestScores");
    pageContext.setAttribute("highestScores", highestScores);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/assets/css/mypage.css">

</head>
<body>

	<div class="container1">
		<div class="title">My Page</div>
		<!-- 좌측 사이드 바 아이콘 버튼 -->
		<div class="menu">
			<i class="fa-solid fa-gamepad" id="gameicon" style="color: #ffffff;"></i>
			<i class="fa-solid fa-clipboard-list" id="boardicon" style="color: #ffffff;"></i>
		</div>
		<div class="nickname" name="nickname"><%= loginUser.getNickname() %></div>
		<div class="id" name="id"><%= loginUser.getId() %></div>
		<div class="line1"></div>
		<div class="email" name="email">
			<i class="fa-solid fa-at"></i><%= loginUser.getEmail() %></div>
		<div class="phonenum" name="phonenum">
			<i class="fa-solid fa-phone"></i><%= loginUser.getPhone() %></div>
		<div class="line2"></div>
		<c:if test="${not empty gameRecord}">
			<div class="gamepoint1">게임포인트</div>
			<div class="gamepoint2"><%= gameRecord.getRecord() %></div>
			<div class="playtime1">총 플레이 시간</div>
			<div class="playtime2"><%= gameRecord.getPlayTime() %></div>
		</c:if>
		<c:if test="${empty gameRecord}">
			<div class="gamepoint1">게임포인트</div>
			<div class="gamepoint2">0</div>
			<div class="playtime1">총 플레이 시간</div>
			<div class="playtime2">0</div>
		</c:if>
		<div class="line3"></div>
		<div class="favourite">My FAVOURITE(수정예정)</div>
		<div class="gamebox1">&nbsp;&nbsp;크로스 로드</div>
		<div class="score1">score : 10</div>
		<div class="rank1">rank : 8</div>
		<div class="gamebox2">&nbsp;&nbsp;고기굽기 게임</div>
		<div class="score2">score : 10</div>
		<div class="rank2">rank : 8</div>
		<a href="/views/mypage/pwcheck.jsp">
			<button class="modify">수정하기</button>
		</a> <a href="/index.jsp">
			<button class="main">메인화면</button>
		</a>

		<!-- <script>
        $(".modify").on("click",()=>{
        	 window.open("pwcheck.jsp", "_blank", "width=600,height=400,top=250,left=500");
        })
        </script>
 -->
	</div>

	<!-- mypage.jsp -->
	<div class="container2">
		<div class="subtitle">내 커뮤니티 활동내역</div>

	<!-- <a class="my-post" href="/mypost.mypage">
        <button>내가 쓴 게시물</button>
    </a>
    <a class="my-reply" href="/myreply.mypage">
        <button>내가 쓴 댓글</button>
    </a> -->

		<!-- 게시글 목록 -->
<!-- JSP에서 데이터를 JavaScript 배열로 초기화 -->

<!-- 테이블 및 페이지 버튼 영역 -->
<div class="scroll-container">
    <table>
        <thead>
            <tr>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody id="postBody">
            <!-- JavaScript로 데이터 출력 -->
        </tbody>
    </table>
</div>

<div id="pagination"></div>

<script>
	const userBoardList = [
	    <c:forEach var="post" items="${userBoardList}" varStatus="status">
	        {
	            title: "${fn:escapeXml(post.title)}",
	            writeDate: "${post.writeDate.toString()}",
	            viewCount: "${post.viewCount.toString()}"
	        }<c:if test="${!status.last}">,</c:if>
	    </c:forEach>
	];

	const itemsPerPage = 10;
    let currentPage = 1;

    function displayPosts(page) {
        const startIndex = (page - 1) * itemsPerPage;
        const endIndex = page * itemsPerPage;
        const currentPosts = userBoardList.slice(startIndex, endIndex);
		console.log(currentPosts);
        const postBody = document.getElementById('postBody');
        postBody.innerHTML = '';

        for (let i = 0; i < currentPosts.length; i++) {
            const post = currentPosts[i]; // 각 포스트 데이터 가져오기
            const row = document.createElement('tr');

            // 개별 <td> 요소 생성
            const titleTd = document.createElement('td');
            const dateTd = document.createElement('td');
            const viewTd = document.createElement('td');

            // 올바른 innerHTML 속성 사용
            titleTd.innerHTML = post.title;
            dateTd.innerHTML = post.writeDate;
            viewTd.innerHTML = post.viewCount;

            // <tr>에 <td> 추가
            row.appendChild(titleTd);
            row.appendChild(dateTd);
            row.appendChild(viewTd);

            // 최종적으로 <tbody>에 추가
            postBody.appendChild(row);
        }


        renderPagination();
    }

    function renderPagination() {
        const pagination = document.getElementById('pagination');
        pagination.innerHTML = '';

        const totalPages = Math.ceil(userBoardList.length / itemsPerPage);

        for(let i = 1; i <= totalPages; i++) {
            const button = document.createElement('button');
            button.textContent = i;
            button.onclick = () => {
                currentPage = i;
                displayPosts(currentPage);
            };

            if(i === currentPage) {
                button.disabled = true;
            }

            pagination.appendChild(button);
        }
    }

    // 최초 페이지 로딩 시
    document.addEventListener('DOMContentLoaded', () => {
    	console.log(userBoardList);
        displayPosts(currentPage);
    });
</script>



		

	</div>
	<div class="subtitle">내 게임 순위</div>
	<%-- 게임 ID 및 이미지명 리스트 설정 --%>
	<c:set var="gameIds" value="4001,4002,4003,4004,4005,4006" />
	<c:set var="gameImages"
		value="barbecue.jpeg,rhythm.png,zombie.jpeg,snake.jpeg,crossroad.jpeg,chamchamcham.jpeg" />
	<c:set var="gameNames"
		value="Barbecue Game,Rhythm Game,Zombibe Crush,스네이크 게임,크로스 로드,참참참!" />

	<div class="container3">
		<%-- 게임 정보 반복 출력 --%>
		<c:forEach var="index" begin="0" end="5">
			<c:set var="gameId" value="${fn:split(gameIds, ',')[index]}" />
			<c:set var="gameImage" value="${fn:split(gameImages, ',')[index]}" />
			<c:set var="gameName" value="${fn:split(gameNames, ',')[index]}" />

			<div class="game${index + 1}">
				<div class="gameimg">
					<img src="/assets/img/${gameImage}" alt="${gameName}">
				</div>
				<div class="myrank">${gameName}</div>
				<c:choose>
					<c:when test="${empty highestScores[gameId]}">
						<div class="rank">
							<span>게임 기록이 존재하지 않습니다</span> <span> <c:out
									value="${highestScores[gameId]}" />
							</span>

						</div>
						<a href="/games/${gameId}">
							<button>게임으로 이동</button>
						</a>

					</c:when>
					<c:otherwise>
						<div class="rank">
							<i class="fa-solid fa-ranking-star" style="color: #ffffff;"></i>
							${highestScores[gameId]}등
						</div>
						<div class="myscore">
							<i class="fa-solid fa-star" style="color: #ffffff;"></i>
							${highestScores[gameId]}점
						</div>

					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</div>

	<script> 
				$("#gameicon").on("click", () => {
				    $(".container2").css("display", "none");
				    $(".container3").css("display", "block");
				});
				
				$("#boardicon").on("click", () => {
				    $(".container2").css("display", "block");
				    $(".container3").css("display", "none");
				
				    // 게시글 정보 불러오기
				  
				});
			</script>
</body>
</html>