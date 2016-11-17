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
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Admin<br>
 *类功能：	验证管理员登录<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Admin extends HttpServlet{
	private String path=null;
	private String name=null;
	private String password=null;
	private String error=null;
	private Eminfo admin=null;
	private Files file=null;
	private UserList list=null;
	private PrintWriter out = null;
	private HttpSession session=null;

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		out = response.getWriter();
		out.print("<body>");
		//获取数据
		name=request.getParameter("name");
		password=request.getParameter("password");
		path=getServletContext().getRealPath("/");
		file=new  Files(path);
		admin=new Eminfo();
		error=file.getError();
		//如果属性文件有错误则输出
		if(error!=null){
			error=file.getError();
		}else{
			//属性文正常则验证管理员,增加在线列表
			if(name.trim().equals(file.getName().trim())&&password.trim().equals(file.getPassword().trim())){
				session=request.getSession();
				UserTrace usertrace=new UserTrace();
				list=UserList.getInstance();
				admin.setName(name);
				admin.setId(-1);
				list.addUser(admin);
				//设置监听
				usertrace.setId(admin.getId());
				session.setAttribute("list",usertrace);				
				session.setAttribute("id",new Integer(admin.getId()).toString());
				out.print("<script>parent.location.href='login_ok.htm';</script>");
			}else{
				out.print("<script>history.go(-1);</script>");
			}
		}
		out.print("</body>");
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}





 

 