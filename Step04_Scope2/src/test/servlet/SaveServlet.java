package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/test/save")
public class SaveServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String nick=req.getParameter("nick");
		/*
		 *servlet 에서는 HttpSession 객체가 기본 객체로 제공되지 않기 때문에
		 *HttpSession 객체가 필요하다면 HttpServletRequest 객체의 .getSession()
		 *메소드를 이용해서 HttpSession 객체의 참조값을 얻어낼수있다. 
		 */
		HttpSession session = req.getSession();
		//HttpSession 객체에 "nick" 이라는 키값으로 입력한 nick 저장하기
		session.setAttribute("nick",nick);
		//60초 동안 어떤 요청도 하지않으면 자동으로 삭제 되도록 설정(설정하지 않으면 기본 30분)
		session.setMaxInactiveInterval(60);
		
		//응답
		PrintWriter pw=resp.getWriter();
		pw.println("nick save ok");
		pw.close();
		}
}