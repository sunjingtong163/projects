/*
 * Created on 2004-9-22
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.sign;

import oa.sys.*;
import oa.sys.Time;
import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	State<br>
 *类功能：	员工签到<br>
 *创建：	白伟明	2004年10月4日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Sign extends HttpServlet{
	private String sqli;
	private int temp;
	private String id;
	private int signstateid;
	private int h,m,s;
	private int late,quit;
	private String up;
	private String down;
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
		//获取签到人
		id=(String)session.getAttribute("id");
		//获取签到时间
		up=(String)request.getParameter("up");
		down=(String)request.getParameter("down");
		if(up!=null&&up!=""){
			quit=0;
			try {
				sqls="SELECT signstateid FROM signstate WHERE time = '"+up+"' ";
				stmt=db.getStmtread();
				rs=stmt.executeQuery(sqls);
				if(rs.next()){
					signstateid=rs.getInt(1);
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally{
				db.close();
			}
			h=time.getMinH(up);
			m=time.getMinM(up);
			s=time.getMinS(up);
			if(h>0){
				//没有迟到
				late=0;
			}else if(h==0){
				if(m>0){
					late=0;
				}else if(m==0){
					if(s>0){
						late=0;
					}else{
						late=1;
					}
				}else{
					late=1;
				}
			}else{
				late=1;
			}
		}
		if(down!=null&&down!=""){
			late=0;
			try {
				sqls="SELECT signstateid FROM signstate WHERE time = '"+down+"'";
				stmt=db.getStmtread();
				rs=stmt.executeQuery(sqls);
				if(rs.next()){
					signstateid=rs.getInt(1);
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally{
				db.close();
			}
			h=time.getMinH(down);
			m=time.getMinM(down);
			s=time.getMinS(down);
			if(h<0){
				//没有早退
				quit=0;
			}else if(h==0){
				if(m<0){
					quit=0;
				}else if(m==0){
					if(s<=0){
						quit=0;
					}else{
						quit=1;
					}
				}else{
					quit=1;
				}
			}else{
				quit=1;
			}
		}
		sqli="INSERT sign(time,employeeid,late,quit,leave,work,signstateid) VALUES('"+new Time().getYMDHMS()+"',"
			+id+","+late+","+quit+","+0+","+0+","+signstateid+")";
			out.print(sqli);
	  	try {
	  		sqls="SELECT * FROM sign WHERE employeeid="+id+" AND signstateid="+
	  				signstateid+" AND time >='"+new Time().getYMD()+"'";
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			if(!rs.next()){
				db.close();
				stmt=db.getStmt();
				temp=stmt.executeUpdate(sqli);
				if(temp>0){
					request.setAttribute("msg","以签到");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
			RequestDispatcher dispatcher=request.getRequestDispatcher("state");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
