/*
 * Created on 2004-10-12
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.sys;

import javax.servlet.http.HttpSessionBindingEvent;
/**
 ****************************************************
 *类名称：	UserTrace<br>
 *类功能：	用户再线方案<br>
 *创建：	白伟明	2004年10月12日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class UserTrace
	implements javax.servlet.http.HttpSessionBindingListener {
	private int id;
	private UserList container = UserList.getInstance();
	
	public UserTrace(){
		id=0;
	}
	/***************************************************
	*函数名称：setId()<br>
	*函数功能：设置在线监听<br>
	*返回值：  无<br>
	*参数说明：int id<br>
	*最后修改：白伟明
	*		   2004年10月12日
	****************************************************/
	public void setId(int id) {
		this.id = id;
	}
	/***************************************************
	*函数名称：getId()<br>
	*函数功能：获取在线监听<br>
	*返回值：  int id<br>
	*参数说明：无<br>
	*最后修改：白伟明
	*		   2004年10月12日
	****************************************************/
	public int getId() {
		return this.id;
	}
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpSessionBindingListener#valueBound(javax.servlet.http.HttpSessionBindingEvent)
	 */
	public void valueBound(HttpSessionBindingEvent arg0) {
		System.out.println(new Time().getYMDHMS()+"	上线	"+this.id);
		}
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpSessionBindingListener#valueUnbound(javax.servlet.http.HttpSessionBindingEvent)
	 */
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		System.out.println(new Time().getYMDHMS()+"	下线	"+this.id);
		if (id != -1) {
			container.removeUser(id);
		}
	}

}
