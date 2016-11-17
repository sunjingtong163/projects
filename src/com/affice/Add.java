/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.affice;

import oa.sys.*;
import oa.sys.Time;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Add<br>
 *类功能：	增加公告信息<br>
 *创建：	白伟明	2004年10月5日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Add extends HttpServlet{
	private HttpSession session=null;
	private ResultSet rs=null;
	private Statement stmt=null;
	private String title,content,sqli,sqls;
	private int temp=0,id;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		Str str=new Str();
		Db db=new Db();
		Time time=new Time();
		PrintWriter out=response.getWriter();
		session=request.getSession();
		id=Integer.parseInt((String)session.getAttribute("id"));
		title=request.getParameter("title");
		content=request.getParameter("content");
		title=str.inStr(title);
		content=str.inStr(content);
		sqli="INSERT INTO affice(title,time,employeeid,content) VALUES('"+title+"','"+time.getYMD()+"',"+id+",'"+content+"')";
		sqls="SELECT * FROM affice WHERE time='"+time.getYMD()+"'";
		try {
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			if(!rs.next()){
				db.close();
				stmt=db.getStmt();
				temp=stmt.executeUpdate(sqli);
				if(temp>0){
					request.setAttribute("msg","发布成功");
				}else{
					request.setAttribute("msg","发布失败");
				}
			}else{
				request.setAttribute("msg","今日已经发布公告，不能再发布");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
			RequestDispatcher dispatcher=request.getRequestDispatcher("add.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
