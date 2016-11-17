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
 *类名称：	Info<br>
 *类功能：	信息收发（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Info {
	private int id;
	private String title;
	private String time;
	private int sendter;
	private int accepter;
	private String content;
	private int news;

	/**
	 * 信息收发
	 */
	public Info() {
		super();
		id=0;
		title="";
		time=new Time().getYMDHMS();
		sendter=0;
		accepter=0;
		content="";
		news=0;
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTime() {
		return time;
	}
	public void setSendter(int sendter) {
		this.sendter = sendter;
	}
	public int getSendter() {
		return sendter;
	}
	public void setAccepter(int accepter) {
		this.accepter = accepter;
	}
	public int getAccepter() {
		return accepter;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	public void setNews(int news) {
		this.news= news;
	}
	public int getNews() {
		return news;
	}
}
