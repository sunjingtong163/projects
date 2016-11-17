/*
 * Created on 2004-9-18
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
*/
package com.login;

import oa.sys.*;
import oa.data.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Em<br>
 *类功能：	验证员工登录<br>
 *创建：	白伟明	2004年9月28日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Em extends HttpServlet{
	private boolean flag=true;
	private String state;
	private String job;
	private String dep;
	private int stateid;
	private String addr;
	private int jobid;
	private String tel;
	private String post;
	private int deid;
	private String learn;
	private String birthday;
	private int sex;
	private String name;
	private int id=0;	
	private String password,sqls,sqls1;
	private RequestDispatcher dispatcher;
	private Statement stmt=null;
	private ResultSet rs=null;
	private Eminfo eminfo=null;
	private UserList list=null;
	private PrintWriter out = null;
	private HttpSession session=null;

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		out = response.getWriter();
		session=request.getSession();
		//获取数据
		id=Integer.parseInt((String)request.getParameter("id"));
		password=request.getParameter("password");
		sqls="SELECT * FROM password WHERE employeeid="+id+" AND password='"+password+"'";
		Db db=new Db();
		Str str=new Str();
		//验证
		try{
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			if(rs.next()){
				db.close();
				//验证成功则获取基本信息
				sqls1="SELECT * FROM eminfo WHERE employeeid="+id;
				stmt=db.getStmtread();
				rs=stmt.executeQuery(sqls1);
				//有基本信息则增加在线列表
				if(rs.next()){
					id=rs.getInt(1);
					name=rs.getString(2);
					sex=rs.getInt(3);
					birthday=rs.getString(4);
					learn=rs.getString(5);
					post=rs.getString(6);
					deid=rs.getInt(7);
					jobid=rs.getInt(8);
					tel=rs.getString(9);
					addr=rs.getString(10);
					stateid=rs.getInt(11);
					db.close();
					dep=db.IdtoDo("Name","department WHERE departmentid="+deid);
					job=db.IdtoDo("Name","job WHERE jobid="+jobid);
					state=db.IdtoDo("Name","emstate WHERE stateid="+stateid);
					//字符转换*/
					name=str.outStr(name);
					birthday=birthday.substring(0,10);
					dep=str.outStr(dep);
					job=str.outStr(job);
					state=str.outStr(state);
					learn=str.outStr(learn);
					post=str.outStr(post);
					tel=str.outStr(tel);
					addr=str.outStr(addr);
					Eminfo eminfo=new Eminfo();
					eminfo.setId(id);
					eminfo.setName(name);
					eminfo.setSex(sex);
					eminfo.setBirthday(birthday);
					eminfo.setLearn(learn);
					eminfo.setPost(post);
					eminfo.setDepartment(dep);
					eminfo.setJob(job);
					eminfo.setTel(tel);
					eminfo.setAddr(addr);
					eminfo.setState(state);
					//判断是否有人在线
					list=UserList.getInstance();
					Vector  vc=list.getList();
					flag=true;
					if(!vc.isEmpty()&&vc!=null){
					Enumeration em=vc.elements();
						while(em.hasMoreElements()){
							Eminfo emin=(Eminfo)em.nextElement();
							if(emin.getId()==eminfo.getId()){
								//在线
								flag=false;
							}
						}
					}else{
						flag=true;
					}
					if(flag){
						UserTrace usertrace=new UserTrace();
						usertrace.setId(eminfo.getId());
						list.addUser(eminfo);
						session.setAttribute("list",usertrace);
						session.setAttribute("id",new Integer(eminfo.getId()).toString());
						out.print("<script>parent.location.href='login_ok.htm';</script>");
					}else{
						session.setAttribute("error","该用户名正在使用");
						dispatcher=request.getRequestDispatcher("/error/errorpage.jsp");
						dispatcher.forward(request,response);
					}
				}//增加在线列表
			}else{
				//验证失败
				session.setAttribute("error","用户名或密码错误");
				dispatcher=request.getRequestDispatcher("/error/errorpage.jsp");
				dispatcher.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}





 

 