package com.carrot.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carrot.dao.MembersDAO;

/**
 * Servlet implementation class UseridCheckServelt
 */
@WebServlet("/useridCheck.do")
public class UseridCheckServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UseridCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("usercheck");
      String userid = request.getParameter("userid");
       MembersDAO mdao = MembersDAO.getInstance();
      int result = mdao.checkDuplicateId(userid);
      request.setAttribute("userid", userid);
      request.setAttribute("result", result);
       
       RequestDispatcher rd = request.getRequestDispatcher("/views/member/useridCheck.jsp");
       rd.forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
   }

}
