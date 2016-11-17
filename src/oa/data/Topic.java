/*
 * Created on 2004-9-17
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.data;
import oa.sys.*;
/**
 ****************************************************
 *类名称：	Topic<br>
 *类功能：	议题（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Topic {
	private int id;
	private String title;
	private String time;
	private int emid;
	private String content;
	
	/**
	 * 议题
	 */
	public Topic() {
		super();
		id=0;
		title="";
		time=new Time().getYMD();
		emid=0;
		content="";
	}

	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setTitle(String title){
		this.title=title;
	}
	public String getTitle(){
		return title;
	}
	public void setTime(String time){
		this.time=time;
	}
	public String getTime(){
		return time;
	}
	public void setEmid(int emid){
		this.emid=emid;
	}
	public int getEmid(){
		return emid;
	}
	public void setContent(String content){
		this.content=content;
	}
	public String getContent(){
		return content;
	}

}
