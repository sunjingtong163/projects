/*
 * Created on 2004-9-22
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.sign;

import oa.sys.*;
import oa.sys.Time;
import oa.data.Sign;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Admin<br>
 *类功能：	员工签到状态<br>
 *创建：	白伟明	2004年10月5日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class View extends HttpServlet{
	private ResultSet rs=null;
	private Statement stmt=null;
	private String sqls=null;
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		Db db=new Db();
		Time time=new Time();
		//获取签到表
		stmt=db.getStmtread();
		try {
			Collection coll=new ArrayList();
			stmt=db.getStmtread();
			rs=stmt.executeQuery("SELECT * FROM sign");
			while(rs.next()){
				Sign sign=new Sign();
				sign.setId(rs.getInt(1));
				sign.setTime(rs.getString(2));
				sign.setEmid(rs.getInt(3));
				sign.setLate(rs.getInt(4));
				sign.setQuit(rs.getInt(5));
				sign.setLeave(rs.getInt(6));
				sign.setWork(rs.getInt(7));
				sign.setSignstateid(rs.getInt(8));
				coll.add(sign);
			}
			request.setAttribute("msg",coll);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally{
			db.close();
			RequestDispatcher dispatcher=request.getRequestDispatcher("view.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
