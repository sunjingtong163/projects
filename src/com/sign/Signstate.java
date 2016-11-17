/*
 * Created on 2004-9-22
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.sign;

import oa.sys.*;
import java.sql.*;
import java.io.*;

import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
/**
 ****************************************************
 *类名称：	Signstate<br>
 *类功能：	设置员工签到时间<br>
 *创建：	白伟明	2004年9月24日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Signstate extends HttpServlet{
	private Db db=null;
	private Str str=null;
	private int temp=0;
	private String up=null;
	private String down=null;
	private HttpSession session=null;
	private PrintWriter out=null;
	private ResultSet rs=null;
	private Statement stmt=null;
	private Statement stmtread=null;
	private PreparedStatement pstmt=null;
	private String sqlu="UPDATE signstate SET time=";
	private String sqli="INSERT INTO signstate values(?,?,?)";
	private String sqls="SELECT * FROM signstate WHERE signstateid=1 or signstateid=2";

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		out = response.getWriter();
		session=request.getSession();
		str=new Str();
		db=new Db();
		//取得时间
		up=request.getParameter("up");
		down=request.getParameter("down");
		up=str.inStr(up);
		down=str.inStr(down);
		stmtread=db.getStmtread();
		try {
			rs=stmtread.executeQuery(sqls);
			//不是第一次设置时间更形数据库
			if(rs.next()){
				rs.beforeFirst();
				while(rs.next()){
					if(rs.getInt(1)==1){
						sqlu="UPDATE signstate SET time='"+up+"' WHERE signstateid=1";
					}else if(rs.getInt(1)==2){
						sqlu="UPDATE signstate SET time='"+down+"' WHERE signstateid=2";
					}
				stmt=db.getStmt();
				stmt.executeUpdate(sqlu);
				}
				stmt.close();
				rs.close();
				stmtread.close();
			}else{
				//第一次设置时间添加数据库
				pstmt=db.getPstmt(sqli);
				pstmt.setInt(1,1);
				pstmt.setString(2,"上班");
				pstmt.setString(3,up);
				pstmt.execute();
				pstmt.setInt(1,2);
				pstmt.setString(2,"下班");
				pstmt.setString(3,down);
				pstmt.execute();
				pstmt.close();
			}
			db.close();
			session.setAttribute("daymsg","设置成功");
		} catch (SQLException e) {
			session.setAttribute("daymsg","设置失败请输入正确格式");
		}finally{
			RequestDispatcher dispatcher=request.getRequestDispatcher("signstate.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
