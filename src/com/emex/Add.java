/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.emex;

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
 *类功能：	增加优秀员工信息<br>
 *创建：	白伟明	2004年10月6日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Add extends HttpServlet{
	private String sqlse;
	private int deid;
	private String sqlsd;
	private HttpSession session=null;
	private ResultSet rs=null;
	private Statement stmt=null;
	private String title,content,sqli,sqls;
	private int temp=0,id,emid;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		Str str=new Str();
		Db db=new Db();
		Time time=new Time();
		PrintWriter out=response.getWriter();
		session=request.getSession();
		try{
			id=Integer.parseInt((String)session.getAttribute("id"));
			emid=Integer.parseInt((String)request.getParameter("emid"));
		}catch(Exception e){
		}
		if(emid==id){
			emid=-1;
		}
		sqlsd="SELECT departmentid FROM eminfo WHERE employeeid="+emid;
		sqls="SELECT * FROM eminfo WHERE employeeid="+emid;
		sqlse="SELECT * FROM emexcellence WHERE time>='"+time.getYMD()+"' AND employeeid="+emid;
		try {
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqlsd);
			//查找被提名人部门id
			if(rs.next()){
				deid=rs.getInt(1);
				sqli="INSERT INTO emexcellence(employeeid,time,departmentid) VALUES('"+emid+"','"+time.getYMD()+"','"+deid+"')";
			}
			db.close();
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			//查找别提名人是否存在
			if(rs.next()){
				db.close();
				stmt=db.getStmtread();
				rs=stmt.executeQuery(sqlse);
				//判断被提名人本月是否被重复提名
				if(!rs.next()){
					db.close();
					stmt=db.getStmt();
					temp=stmt.executeUpdate(sqli);
					//判断提名是否成功
					if(temp>0){
						request.setAttribute("msg","提名成功");
					}else{
						request.setAttribute("msg","提名失败");
					}
					db.close();
				}else{
					request.setAttribute("msg","该员工已被提名");
					db.close();
				}
			}else{
				request.setAttribute("msg","员工不存在");
				db.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			RequestDispatcher dispatcher=request.getRequestDispatcher("add.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
