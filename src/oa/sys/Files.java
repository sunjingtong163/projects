/*
 * Created on 2004-9-18
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.sys;

import java.io.*;
import java.util.*;
/**
 ****************************************************
 *类名称：	Files<br>
 *类功能：	获取文件操作<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Files {
	Properties prop=new Properties();
	private String name=null;
	private String password=null;
	private String error=null;
	/***************************************************
	*函数名称：	Files()<br>
	*函数功能：	获取属性文件<br>
	*返回值：  	无<br>
	*参数说明：	path	文件路径<br>
	*创建：		白伟明	2004年9月22日
	****************************************************/
	public Files(String path){
		try{
			File file=new File(path+"WEB-INF\\admin.properties");
			if(file.canRead()){
				FileInputStream infile=new FileInputStream(file);
				prop.load(infile);
				name=prop.getProperty("name");
				password=prop.getProperty("password");
				prop.clear();
				infile.close();
			}else{
				error=file.getPath()+"没找到文件";
			}
		}catch(Exception e){
		}
	}
	public String getName(){
		return name;
	}
	public String getPassword(){
		return password;
	}
	public String getError(){
		return error;
	}
}
