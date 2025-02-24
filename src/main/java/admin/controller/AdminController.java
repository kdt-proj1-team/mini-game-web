<<<<<<< HEAD
package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.dao.AdminDAO;
import auth.dao.UsersDAO;
import board.dao.BoardDAO;
import board.dto.BoardDTO;
import utils.Statics;


@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		response.setContentType("application/json; charset=UTF-8"); // ✅ UTF-8 설정
		response.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		AdminDAO dao = AdminDAO.getInstance();
		UsersDAO udao = UsersDAO.getInstance();
		BoardDAO bdao = BoardDAO.getInstance();
		Gson g = new Gson();

		System.out.println("클라이언트 요청 : " + cmd);

		if (cmd.equals("/dashboard.admin")) {

			try {
				int todayVisit = dao.getTodayVisit();
				int todayPost = dao.getTodayPost();
				int todayPlayGame = dao.getTodayPlayGame();
				int onlineUser = dao.getOnlineUser();

				request.setAttribute("todayVisit", todayVisit);
				request.setAttribute("todayPost", todayPost);
				request.setAttribute("todayPlayGame", todayPlayGame);
				request.setAttribute("onlineUser", onlineUser);

				request.getRequestDispatcher("/views/admin/adminDashBoard.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (cmd.equals("/customerlist.admin")) {

		} else if (cmd.equals("/boardlist.admin")) {
			// 현재페이지
			String searchKeyword = request.getParameter("searchKeyword");
			String scpage = (String) (request.getParameter("cpage"));

			// 현재 페이지 유효성 검사.
			if (scpage == null) {
				scpage = "1";
			}

			int cpage = Integer.parseInt(scpage);
			if (cpage < 1) {
				cpage = 1;
			}

			try {
				  int recordTotalCount;
			      List<BoardDTO> boardList;
				
		        // 검색어가 있는 경우와 없는 경우를 구분하여 처리
		        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
		            recordTotalCount = bdao.getSearchRecordCount(searchKeyword);
		        } else {
		            recordTotalCount = bdao.getRecordTotalBoardListCount();
		        }

		        // 페이지 계산
		        int pageTotalCount = (recordTotalCount + Statics.recordCountPerPage - 1) / Statics.recordCountPerPage;
		        
				if (recordTotalCount % Statics.recordCountPerPage > 0) {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage + 1;
				} else {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage;
				}        
				
				// 현재 페이지 범위 조정
		        if (cpage > pageTotalCount) {
		            cpage = pageTotalCount;
		        }

				if (cpage < 1) {
					cpage = 1;
				} else if (cpage > pageTotalCount) {
					cpage = pageTotalCount;
				}
				request.getSession().setAttribute("last_cpage", cpage);

				// 네이게이션 시작번호
				int start = cpage * Statics.recordCountPerPage - (Statics.recordCountPerPage - 1);
				// 네이게이션 끝번호
				int end = cpage * Statics.recordCountPerPage;
				
				
		        // 검색 또는 전체 목록 가져오기
		        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
		            boardList = bdao.searchBoardListByWriter(start, end, searchKeyword);
		        } else {
		            boardList = bdao.selectFromTotalBoardList(start, end);
		        }


				List<BoardDTO> newBoardList = bdao.getNewBoardList();

				int startNavi = (cpage - 1) / Statics.naviCountPerPage * Statics.naviCountPerPage + 1;
				int endNavi = startNavi + Statics.naviCountPerPage - 1;

				// endNavi 값은 페이지 전체 개수보다 클수없음!
				if (endNavi > pageTotalCount) {
					endNavi = pageTotalCount;
				}
				// 이전
				boolean needPrev = true;
				// 다음
				boolean needNext = true;

				if (startNavi == 1) {
					needPrev = false;
				} else if (endNavi == pageTotalCount) {
					needNext = false;
				}
				request.setAttribute("boardList", boardList);
				request.setAttribute("newBoardList", newBoardList);
				request.setAttribute("cpage", cpage);
				request.setAttribute("startNavi", startNavi);
				request.setAttribute("endNavi", endNavi);
				request.setAttribute("needPrev", needPrev);
				request.setAttribute("needNext", needNext);

				request.getRequestDispatcher("/views/admin/adminBoards.jsp").forward(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else if (cmd.equals("/deletepost.admin")) {
			
			 try {
			        int seq = Integer.parseInt(request.getParameter("seq"));
			        System.out.println(seq);
			        int result = bdao.deleteBySeq(seq); // 게시글 삭제

			        if (result > 0) {
			            response.setStatus(HttpServletResponse.SC_OK); // 200 OK
			        } else {
			            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 오류
			        }

			    } catch (Exception e) {
			        e.printStackTrace();
			        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 오류
       }
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

=======
package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.dao.AdminDAO;
import auth.dao.UsersDAO;
import board.dao.BoardDAO;
import board.dto.BoardDTO;
import utils.Statics;


@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		response.setContentType("application/json; charset=UTF-8"); // ✅ UTF-8 설정
		response.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		AdminDAO dao = AdminDAO.getInstance();
		UsersDAO udao = UsersDAO.getInstance();
		BoardDAO bdao = BoardDAO.getInstance();
		Gson g = new Gson();

		System.out.println("클라이언트 요청 : " + cmd);

		if (cmd.equals("/dashboard.admin")) {

			try {
				int todayVisit = dao.getTodayVisit();
				int todayPost = dao.getTodayPost();
				int todayPlayGame = dao.getTodayPlayGame();
				int onlineUser = dao.getOnlineUser();

				request.setAttribute("todayVisit", todayVisit);
				request.setAttribute("todayPost", todayPost);
				request.setAttribute("todayPlayGame", todayPlayGame);
				request.setAttribute("onlineUser", onlineUser);

				request.getRequestDispatcher("/views/admin/adminDashBoard.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (cmd.equals("/customerlist.admin")) {

		} else if (cmd.equals("/boardlist.admin")) {
			// 현재페이지
			String searchKeyword = request.getParameter("searchKeyword");
			String scpage = (String) (request.getParameter("cpage"));

			// 현재 페이지 유효성 검사.
			if (scpage == null) {
				scpage = "1";
			}

			int cpage = Integer.parseInt(scpage);
			if (cpage < 1) {
				cpage = 1;
			}

			try {
				  int recordTotalCount;
			      List<BoardDTO> boardList;
				
		        // 검색어가 있는 경우와 없는 경우를 구분하여 처리
		        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
		            recordTotalCount = bdao.getSearchRecordCount(searchKeyword);
		        } else {
		            recordTotalCount = bdao.getRecordTotalBoardListCount();
		        }

		        // 페이지 계산
		        int pageTotalCount = (recordTotalCount + Statics.recordCountPerPage - 1) / Statics.recordCountPerPage;
		        
				if (recordTotalCount % Statics.recordCountPerPage > 0) {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage + 1;
				} else {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage;
				}        
				
				// 현재 페이지 범위 조정
		        if (cpage > pageTotalCount) {
		            cpage = pageTotalCount;
		        }

				if (cpage < 1) {
					cpage = 1;
				} else if (cpage > pageTotalCount) {
					cpage = pageTotalCount;
				}
				request.getSession().setAttribute("last_cpage", cpage);

				// 네이게이션 시작번호
				int start = cpage * Statics.recordCountPerPage - (Statics.recordCountPerPage - 1);
				// 네이게이션 끝번호
				int end = cpage * Statics.recordCountPerPage;
				
				
		        // 검색 또는 전체 목록 가져오기
		        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
		            boardList = bdao.searchBoardListByWriter(start, end, searchKeyword);
		        } else {
		            boardList = bdao.selectFromTotalBoardList(start, end);
		        }


				List<BoardDTO> newBoardList = bdao.getNewBoardList();

				int startNavi = (cpage - 1) / Statics.naviCountPerPage * Statics.naviCountPerPage + 1;
				int endNavi = startNavi + Statics.naviCountPerPage - 1;

				// endNavi 값은 페이지 전체 개수보다 클수없음!
				if (endNavi > pageTotalCount) {
					endNavi = pageTotalCount;
				}
				// 이전
				boolean needPrev = true;
				// 다음
				boolean needNext = true;

				if (startNavi == 1) {
					needPrev = false;
				} else if (endNavi == pageTotalCount) {
					needNext = false;
				}
				request.setAttribute("boardList", boardList);
				request.setAttribute("newBoardList", newBoardList);
				request.setAttribute("cpage", cpage);
				request.setAttribute("startNavi", startNavi);
				request.setAttribute("endNavi", endNavi);
				request.setAttribute("needPrev", needPrev);
				request.setAttribute("needNext", needNext);

				request.getRequestDispatcher("/views/admin/adminBoards.jsp").forward(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else if (cmd.equals("/deletepost.admin")) {
			
			 try {
			        int seq = Integer.parseInt(request.getParameter("seq"));
			        System.out.println(seq);
			        int result = bdao.deleteBySeq(seq); // 게시글 삭제

			        if (result > 0) {
			            response.setStatus(HttpServletResponse.SC_OK); // 200 OK
			        } else {
			            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 오류
			        }

			    } catch (Exception e) {
			        e.printStackTrace();
			        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 오류
       }
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

>>>>>>> a0eddcb (update faq)
}