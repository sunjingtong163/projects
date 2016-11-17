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
 *类名称：	Sysr<br>
 *类功能：	系统日志（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Sysr {
	private int recorded;
	private String time;
	private String work;
	private int emid;

	/**
	 * 系统日志
	 */
	public Sysr() {
		super();
		recorded=0;
		time=new Time().getYMDHMS();
		work="";
		emid=0;
	}

	public void setRecorded(int recorded) {
		this.recorded = recorded;
	}
	public int getRecorded() {
		return recorded;
	}
	public void setString(String time) {
		this.time = time;
	}
	public String getString() {
		return time;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getWork() {
		return work;
	}
	public void setEmid(int emid) {
		this.emid = emid;
	}
	public int getEmid() {
		return emid;
	}
}
