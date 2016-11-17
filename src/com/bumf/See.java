/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.bumf;

import oa.data.Bumf;
import oa.sys.*;
import oa.sys.Time;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	See<br>
 *类功能：	公文接收(附件)<br>
 *创建：	白伟明	2004年10月11日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class See extends HttpServlet{
	private int bumfid;
	private int sign;
	private int examine;
	private int accepter;
	private int sendter;
	private String axffix;
	private String content;
	private String title;
	private String time;
	private String sqls;
	private String submit;
	private ResultSet rs=null;
	private Statement stmt=null;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		Str str=new Str();
		Db db=new Db();
		Time times=new Time();
		Collection coll=new ArrayList();
		//查看公文
		sqls="SELECT * FROM bumf WHERE  sign="+1+" AND examine="+1+" ORDER BY bumfid";
		try{
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			while(rs.next()){
				bumfid=rs.getInt(1);
				sendter=rs.getInt(2);
				accepter=rs.getInt(3);
				title=rs.getString(4);
				time=rs.getString(5);
				content=rs.getString(6);
				axffix=rs.getString(7);
				examine=rs.getInt(8);
				sign=rs.getInt(9);
				content=str.outStr(content);
				axffix=str.outStr(axffix);
				Bumf bumf=new Bumf();
				bumf.setId(bumfid);
				bumf.setSendter(sendter);
				bumf.setAccepter(accepter);
				bumf.setTitle(title);
				bumf.setTime(time);
				bumf.setContent(content);
				bumf.setExamine(examine);
				bumf.setSign(sign);
				bumf.setAffix(axffix);
				coll.add(bumf);
			}
			request.setAttribute("msg",coll);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
			RequestDispatcher dispatcher=request.getRequestDispatcher("see.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}