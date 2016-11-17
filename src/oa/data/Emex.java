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
 *类名称：	Emex<br>
 *类功能：	优秀员工（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Emex {
	private int id;
	private int emid;
	private String time;
	private int levelid;
	private int deid;

	/**
	 * 优秀员工
	 */
	public Emex() {
		super();
		id=0;
		emid=0;
		time=new Time().getYMD();
		levelid=0;
		deid=0;
	}

	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setEmid(int emid){
		this.emid=emid;
	}
	public int getEmid(){
		return emid;
	}
	public void setTime(String time){
		this.time=time;
	}
	public String getTime(){
		return time;
	}
	public void setLevelid(int levelid){
		this.levelid=levelid;
	}
	public int getLevelid(){
		return levelid;
	}
	public void setDeid(int deid){
		this.deid=deid;
	}
	public int getDeid(){
		return deid;
	}
}
