/*
 * Created on 2004-9-18
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.sys;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
/**
 ****************************************************
 *类名称：	Db<br>
 *类功能：	数据库操作 <br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Db {
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	private PreparedStatement pstmt;
	public static int error=0;

	/***************************************************
	*函数名称：	getCon()<br>
	*函数功能：	获取数据库连接<br>
	*返回值：  	无<br>
	*参数说明：	无<br>
	*创建：		白伟明	2004年9月22日
	****************************************************/
	public static synchronized Connection getCon()throws Exception{
		Context ctx;
		DataSource ds;
		try{
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OA");
			System.err.println();
			System.err.println("数据连接+"+(++error));
			return ds.getConnection();
		}catch(SQLException e){
			System.out.print(e);
			throw e;
		}
		catch(NamingException e){
			System.out.print(e);
			throw e;
		}
	}
	/***************************************************
	*函数名称：	getStmtread()<br>
	*函数功能：	获取数据库集合<br>
	*返回值：  	Statement
	*			stmt:返回数据库集合只用于SELECT语句<br>
	*参数说明：	无<br>
	*创建：		白伟明	2004年9月22日
	****************************************************/
	public Statement getStmtread(){
		try{
			con=getCon();
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		}catch(Exception e){
			System.out.println("getStmtread");
			System.out.println(e.getMessage());
		}
		return stmt;
	}
	/***************************************************
	*函数名称：	getRowCount()<br>
	*函数功能：	返回表的行数<br>
	*返回值：  	int count<br>
	*			count>0返回的行数<br>
	*			count=-1表名不存在或没有纪录<br>
	*参数说明：	String sql<br>
	*			sql 数据库中的表名
	*创建：		白伟明	2004年10月9日
	****************************************************/
	public int getRowCount(String sql){
		int count=0;;
		try{
			stmt=this.getStmtread();
			rs=stmt.executeQuery("SELECT COUNT(*) FROM "+sql);
			rs.getMetaData();
			if(rs.next()){
				count=rs.getInt(1);
			}else{
				count=-1;
			}
		}catch(Exception e){
			System.out.println("getRowCount");
			System.out.println(e.getMessage());
			count=-2;
		}finally{
			this.close();
		}
		return count;
	}
	/***************************************************
	*函数名称：	getStmt()<br>
	*函数功能：	获取数据库集合<br>
	*返回值：  	Statement
	*			stmt:返回数据库集合不能用于SELECT语句<br>
	*参数说明：	无<br>
	*创建：		白伟明	2004年9月22日
	****************************************************/
	public Statement getStmt(){
		try{
			con=getCon();
			stmt=con.createStatement();
		}catch(Exception e){
			System.out.println("getStmt");
			System.out.println(e.getMessage());
		}
		return stmt;
	}
	/***************************************************
	*函数名称：	IdtoName()<br>
	*函数功能：	根据员工ID获取员工姓名<br>
	*返回值：  	String
	*			String:返回员工姓名<br>
	*参数说明：	无<br>
	*创建：		白伟明	2004年11月6日
	****************************************************/
	public String IdtoName(int id){
		String name=null;
		try{
			stmt=this.getStmtread();
			rs=stmt.executeQuery("SELECT name FROM eminfo WHERE employeeid="+id);
			if(rs.next()){
				name=rs.getString(1);
				Str str=new Str();
				name=str.outStr(name);
			}else{
				name="被删除";
			}
			this.close();
		}catch(Exception e){
			System.out.println("IdtoName");
			System.out.println(e.getMessage());
		}
		return name;
	}
	/***************************************************
	*函数名称：	IdtoDeName()<br>
	*函数功能：	根据员工ID获取员工部门名称<br>
	*返回值：  	String
	*			String:返回员工部门名称<br>
	*参数说明：	无<br>
	*创建：		白伟明	2004年11月6日
	****************************************************/
	public String IdtoDeName(int id){
		String name=null;
		try{
			stmt=this.getStmtread();
			rs=stmt.executeQuery("SELECT name FROM department WHERE departmentid="+id);
			if(rs.next()){
				name=rs.getString(1);
				Str str=new Str();
				name=str.outStr(name);
			}else{
				name="无此部门";
			}
			this.close();
		}catch(Exception e){
			System.out.println("IdtoName");
			System.out.println(e.getMessage());
		}
		return name;
	}
	/***************************************************
	*函数名称：	IdtoDo()<br>
	*函数功能：	根据输入条件获取单字段一条数据<br>
	*返回值：  	String
	*			String:返回员工部门名称<br>
	*参数说明：	field 要查询的单字段名称<br>
	*			from 要查询的表名称<br>
	*创建：		白伟明	2004年11月6日
	****************************************************/
	public String IdtoDo(String field,String from){
		String name=null;
		try{
			stmt=this.getStmtread();
			rs=stmt.executeQuery("SELECT "+field+" FROM "+from);
			if(rs.next()){
				name=rs.getString(1);
				Str str=new Str();
				name=str.outStr(name);
			}
			this.close();
		}catch(Exception e){
			System.out.println("IdtoDo");
			System.out.println(e.getMessage());
		}
		return name;
	}	/***************************************************
	*函数名称：	getPstmt()<br>
	*函数功能：	获取数据库集合<br>
	*返回值：  	PreparedStatement
	*			pstmt:返回数据库预处理语句<br>
	*参数说明：	sql		类sql语句<br>
	*创建：		白伟明	2004年9月22日
	****************************************************/
	public PreparedStatement getPstmt(String sql){
		try{
			con=getCon();
			pstmt=con.prepareStatement(sql);
		}catch(Exception e){
			System.out.println("getPstmt");
			System.out.println(e.getMessage());
		}
		return pstmt;
	}
	/***************************************************
	*函数名称：close()<br>
	*函数功能：关闭数据库连接<br>
	*返回值：  void<br>
	*参数说明：无<br>
	*最或修改：白伟明
	*		   2004年9月4日
	****************************************************/
	public void close(){
		try{
			if(rs!=null)rs.close();
		}catch(Exception e){
		}
		try{
			if(stmt!=null)stmt.close();
		}catch(Exception e){
		}
		try{
			if(con!=null){
			con.close();
			con=null;
			System.err.println();
			System.err.println("数据连接-"+(--error));
			}
		}catch(Exception e){
			System.out.println("close");
			System.out.println(e.getMessage());
		}
	}
}