/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.emex;

import oa.sys.*;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Del<br>
 *类功能：	删除优秀员工<br>
 *创建：	白伟明	2004年10月6日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Del extends HttpServlet{
	private HttpSession session=null;
	private Statement stmt=null;
	private ResultSet rs=null;
	private String sqld;
	private int temp=0,id=0;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		Db db=new Db();
		PrintWriter out=response.getWriter();
		session=request.getSession();
		try{
		id=Integer.parseInt((String)request.getParameter("emexid"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		sqld="DELETE FROM emexcellence WHERE excellenceid="+id;
		stmt=db.getStmtread();
		try {
				//删除部门
				stmt=db.getStmt();
				temp=stmt.executeUpdate(sqld);
				if(temp>0){
					request.setAttribute("msg","删除成功");
				}else{
					request.setAttribute("msg","删除失败");
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
			RequestDispatcher dispatcher=request.getRequestDispatcher("view");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
