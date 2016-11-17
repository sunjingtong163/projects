/*
 * Created on 2004-9-21
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.sys;
import oa.data.*;
import java.util.*;
/**
 ****************************************************
 *类名称：	UserList<br>
 *类功能：	用户列表操作<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class UserList {
	private Vector container;
	private static UserList instance=new UserList();

	/***************************************************
	*函数名称：UserList()<br>
	*函数功能：利用private调用构造函数,
	*		   防止被外界产生新的instance对象<br>
	*返回值：  无<br>
	*参数说明：无<br>
	*最后修改：白伟明
	*		   2004年8月13日
	****************************************************/
	private UserList(){
		container=new Vector();
	}

	/***************************************************
	*函数名称：getInstance()<br>
	*函数功能：外界使用新的instance对象<br>
	*返回值：  UserList<br>
	*参数说明：无<br>
	*最后修改：白伟明
	*		   2004年8月13日
	****************************************************/
	public static UserList getInstance(){
		return instance;
	}

	/***************************************************
	*函数名称：addUser()<br>
	*函数功能：增加用户列表<br>
	*返回值：  void<br>
	*参数说明：user<br>
	*最后修改：白伟明
	*		   2004年8月13日
	****************************************************/
	public void addUser (Eminfo user){
		if(user!=null){
			container.addElement(user);
		}
	}

	/***************************************************
	*函数名称：getList()<br>
	*函数功能：获取用户列表<br>
	*返回值：  Vector<br>
	*参数说明：无<br>
	*最后修改：白伟明
	*		   2004年8月13日
	****************************************************/
	public Vector getList(){
		return container;
	}

	/***************************************************
	*函数名称：removeUser()<br>
	*函数功能：移除用户列表<br>
	*返回值：  int id 用户列表中不存在输入id<br>
	*参数说明：id<br>
	*最后修改：白伟明
	*		   2004年8月13日
	****************************************************/
	public int removeUser(int id){
		for(int i=0;i<container.size();i++){
			Eminfo user=(Eminfo)container.elementAt(i);
				if(user.getId()==id){
					container.removeElementAt(i);
				}
		}
		return id;
	}
}
