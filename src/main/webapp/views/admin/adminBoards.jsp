<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>게시글 리스트</title>

        <!-- Font Awesome CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <!-- Google Fonts (Nunito) -->
        <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
        <!-- Bootstrap CSS CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/adminBoards.css">

        <!-- jQuery 추가 (AJAX 사용) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <style>
        </style>
      </head>

      <body>
        <div class="container-fluid p-0">
          <div class="row g-0" style="width: 100%;">
            <!-- 사이드바 영역 -->
            <div class="col-md-3 col-lg-2 p-0">
              <div class="sidebar">
                <div class="logo">
                  <a href="/dashboard.admin"> <img src="/assets/img/logoW.png" alt="Logo">
                  </a>
                </div>
                <ul class="sidebar-menu nav flex-column">
                  <li class="nav-item"><a class="nav-link" href="/dashboard.admin"> <i class="fa-solid fa-toolbox"></i>
                      <span class="ms-2">관리자 페이지</span>
                    </a></li>
                  <li class="nav-item"><a class="nav-link" href="/views/adminCustomerList.jsp"> <i
                        class="fa-solid fa-users"></i> <span class="ms-2">회원 리스트</span>
                    </a></li>
                  <li class="nav-item"><a class="nav-link active" href="/views/adminBoards.jsp"> <i
                        class="fa-solid fa-file-lines"></i> <span class="ms-2">게시글
                        리스트</span>
                    </a></li>
                </ul>
              </div>
            </div>
            <!-- 메인 콘텐츠 영역 -->
            <div class="col-md-9 col-lg-10">
              <div class="main-content">
                <div class="page-title">게시글 리스트</div>
                <div class="content-wrapper">
                  <!-- 신규 게시글 섹션 -->
                  <div class="new-posts">
                    <div class="new-posts-title">이번주 신규 게시글</div>
                    <div class="new-posts-grid">
                      <c:forEach items="${newBoardList}" var="board">
                        <div class="new-post-card">
                          <div class="new-post-header">
                            <div class="new-post-type ${board.isAdmin == 1 ? 'notice' : 'regular'}">
                              ${board.isAdmin == 1 ? '공지' : '일반'}</div>
                            <div class="new-post-views">
                              <i class="fa-regular fa-eye"></i> ${board.viewCount}
                            </div>
                          </div>
                          <div class="new-post-content">
                            <h3 class="new-post-title">${board.title}</h3>
                            <div class="new-post-author">
                              <i class="fa-regular fa-user"></i> ${board.writer}
                            </div>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                  <!-- 회원 닉네임 검색 영역 -->
                  <div class="search-container">
                    <form action="boardlist.admin" method="get">
                      <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="회원 닉네임 검색">
                      <button type="submit">검색</button>
                    </form>
                  </div>
                  <!-- 게시글 리스트 테이블 -->
                  <div class="table-container">
                    <c:choose>
                      <c:when test="${empty boardList}">
                        <div class="no-results">검색 결과가 없습니다.</div>
                      </c:when>
                      <c:otherwise>
                        <table id="member-table" class="table">
                          <thead>
                            <tr>
                              <th>게시글 종류</th>
                              <th>유저 닉네임</th>
                              <th>제목</th>
                              <th>내용</th>
                              <th>작성일</th>
                              <!-- 수정 250223::s -->
                              <th>조회수</th>
                              <!-- 수정 250223::e -->
                              <th>삭제</th>
                            </tr>
                          </thead>
                          <!-- 수정 250223::s -->
                          <tbody>
                            <c:forEach items="${boardList}" var="board">
                              <tr>
                                <td>${board.isAdmin == 1 ? '공지' : '일반'}</td>
                                <td>${board.writer}</td>
                                <td>${board.title}</td>
                                <td>${board.contents}</td>
                                <td>
                                  <fmt:formatDate value="${board.writeDate}" pattern="yyyy/MM/dd" />
                                </td>
                                <td>${board.viewCount}</td>
                                <!-- <td><button class="delete" data-seq="${board.seq}">delete</button></td> -->
                                <td>
                                  <button class="delete-btn" data-seq="${board.seq}">delete</button>
                                </td>
                              </tr>
                            </c:forEach>
                          </tbody>
                          <!-- 수정 250223::e -->
                        </table>
                      </c:otherwise>
                    </c:choose>
                    <!-- 페이지네이션 -->
                    <!-- 수정 250223::s -->
                    <div class="pagination">
                      <ul>
                        <c:if test="${needPrev}">
                          <li><a href="/boardlist.admin?cpage=${startNavi-1}">이전</a></li>
                        </c:if>

                        <c:forEach var="i" begin="${startNavi}" end="${endNavi}">
                          <li class="${i == cpage ? 'active' : ''}"><a href="/boardlist.admin?cpage=${i}">${i}</a></li>
                        </c:forEach>

                        <c:if test="${needNext}">
                          <li><a href="/boardlist.admin?cpage=${endNavi+1}">다음</a></li>
                        </c:if>
                      </ul>
                    </div>
                    <!-- 수정 250223::e -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 푸터 -->
        <footer class="sticky-footer">
          <div class="container">
            <div class="text-center">
              <span>Copyright &copy; Your Website 2021</span>
            </div>
          </div>
        </footer>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-cVKIPhGKtYv2/7R+FtM2ZLCVYQ7LNPV+Ze8FouO8nG5pq4nE1tvFq+0VYU73nMyg"
          crossorigin="anonymous"></script>
        <script>
          // 추가 스크립트가 필요하면 여기에 작성합니다.

          //게시글 삭제 
          $(document).ready(function () {
            $(".delete-btn").click(function () {
              if (!confirm("정말 삭제하시겠습니까?")) {
                return;
              }

              let seq = $(this).data("seq"); // 게시글 seq 값 가져오기
              let row = $(this).closest("tr"); // 현재 행 찾기

              $.ajax({
                url: "/deletepost.admin", // 삭제 요청을 보낼 서버 URL
                type: "POST",
                data: { seq: seq },
                success: function (response) {
                  alert("삭제 완료!"); // 삭제 성공 메시지
                  row.remove(); // 해당 행 삭제
                },
                error: function () {
                  alert("삭제 실패! 다시 시도해주세요.");
                }
              });
            });
          });
        </script>
      </body>

      </html>
