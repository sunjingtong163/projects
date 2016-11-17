/*
 * Created on 2004-9-22
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.sign;

import oa.sys.*;
import oa.sys.Time;
import oa.data.Signstate;
import oa.data.Sign;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	State<br>
 *类功能：	获取员工作息时间<br>
 *创建：	白伟明	2004年10月4日<br>
 *修改：	白伟明	2004年10月5日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class State extends HttpServlet{
	private int signstateid;
	private int quit;
	private int late;
	private int employeeid;
	private String time;
	private String describestate;
	private int id;
	private Db db=null;
	private Str str=null;
	private Time day=new Time();
	private int temp=0;
	private String up=null;
	private String down=null;
	private HttpSession session=null;
	private PrintWriter out=null;
	private ResultSet rs=null;
	private Statement stmt=null;
	private String sqls="SELECT * FROM signstate WHERE signstateid=1 or signstateid=2";
	private String sqls1="";
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		out = response.getWriter();
		session=request.getSession();
		str=new Str();
		db=new Db();
		//在数据库取得作息时间
		try {
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			Collection coll=new ArrayList();
			while(rs.next()){
				id=rs.getInt(1);
				describestate=rs.getString(2);
				time=rs.getString(3);
				Signstate ss=new Signstate();
				describestate=str.outStr(describestate);
				ss.setId(id);
				ss.setDescribestate(describestate);
				ss.setTime(time);
				coll.add(ss);
			}
			request.setAttribute("msg",coll);
			request.setAttribute("advmsg","注意：签到只能操作一次");
		} catch (SQLException e) {
			request.setAttribute("advmsg","签到失败，请予管理员联系");
		}finally{
			db.close();
		}
		//根据session,在数据库取得签到人的签到状态
		try{
			id=Integer.parseInt((String)session.getAttribute("id"));
			sqls1="SELECT * FROM sign WHERE employeeid="+id+" AND time >= '"+day.getYMD()+"'";
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls1);
			Collection coll=new ArrayList();
			while(rs.next()){
				id=rs.getInt(1);
				time=rs.getString(2);
				employeeid=rs.getInt(3);
				late=rs.getInt(4);
				quit=rs.getInt(5);
				signstateid=rs.getInt(8);
				Sign sign=new Sign();
				sign.setId(id);
				sign.setTime(time);
				sign.setEmid(employeeid);
				sign.setLate(late);
				sign.setQuit(quit);
				sign.setSignstateid(signstateid);
				out.print(id);
				coll.add(sign);				
			}
			request.setAttribute("singmsg",coll);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
			RequestDispatcher dispatcher=request.getRequestDispatcher("sign.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
