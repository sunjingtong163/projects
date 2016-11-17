/*
 * Created on 2004-9-17
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.data;

/**
 ****************************************************
 *类名称：	Password<br>
 *类功能：	激活账号（类型）<br>
 *创建：	白伟明	2004年10月11日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Password {
	private int id;
	private String password;
	private String time;

	/**
	 * 优秀员工等级
	 */
	public Password() {
		super();
		id=0;
		password="";
		time="";
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword() {
		return password;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTime() {
		return time;
	}
}
