/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.bumf;

import oa.sys.*;
import oa.sys.Time;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Complete<br>
 *类功能：	公文处理(附件)<br>
 *创建：	白伟明	2004年10月9日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Complete extends HttpServlet{
	private int examine;
	private String bumf;
	private String sqlu;
	private String submit;
	private String sqli;
	private HttpSession session=null;
	private ResultSet rs=null;
	private Statement stmt=null;
	private int temp,id,bumfid;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		Str str=new Str();
		Db db=new Db();
		Time time=new Time();
		//获取处理人id
		try{
			id=Integer.parseInt((String)session.getAttribute("id"));
		}catch(Exception e){
			id=0;
		//	e.printStackTrace();
		//	request.setAttribute("ok","您的网页已过期请重新登录");
		}
		//获取基本信息
		try{
			bumfid=Integer.parseInt((String)request.getParameter("bumfid"));
		}catch(Exception e){
			e.printStackTrace();
		}
		bumf=request.getParameter("bumf");
		submit=request.getParameter("Submit");
		if(submit.equals("处理完成")){
			examine=1;
		}else{
			examine=0;
		}
		out.print(examine);
		if(examine==0){
			//保存
			sqlu="UPDATE bumf SET time='"+time.getYMDHMS()+"',content='"+bumf+"',examine="+examine+" WHERE bumfid="+bumfid;
			try{
				stmt=db.getStmt();
				temp=stmt.executeUpdate(sqlu);
				if(temp>0){
					request.setAttribute("ok","操作成功");
				}else{
					request.setAttribute("ok","操作失败");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				db.close();
			}
		}else{
			//发送
			sqlu="UPDATE bumf SET time='"+time.getYMDHMS()+"',content='"+bumf+"',examine="+examine+"  WHERE bumfid="+bumfid;
			try{
				stmt=db.getStmt();
				temp=stmt.executeUpdate(sqlu);
				if(temp>0){
					request.setAttribute("ok","操作成功");
				}else{
					request.setAttribute("ok","操作失败");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				db.close();
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("accept");
		dispatcher.forward(request,response);
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}