/*
 * Created on 2004-9-18
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.sys;
/**
 ****************************************************
 *类名称：	Str<br>
 *类功能：	字符串转换操作<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Str {
	/**
	 * 
	 */
	public Str() {
		super();
	}

	/***************************************************
	*函数名称：chStr()<br>
	*函数功能：返回中文字符串<br>
	*返回值：  String<br>
	*参数说明：str<br>
	*最后修改：白伟明
	*		   2004年8月17日
	****************************************************/
	public String chStr(String str){
		if(str==null){
			str="";
		}else{
			try{
				str=(new String(str.getBytes("iso-8859-1"),"GB2312")).trim();
			}catch(Exception e){
				System.out.println("chStr");
				System.out.println(e.getMessage());
			}
		}
		return str;
	}
	/***************************************************
	*函数名称：inStr()<br>
	*函数功能：做编码一次转换,入库时防止sql攻击<br>
	*返回值：  String<br>
	*参数说明：str<br>
	*最后修改：白伟明
	*		   2004年8月17日
	****************************************************/
	public String inStr(String str){
		if(str==null){
			str="";
		}else{
			try{
				str=str.replace('\'',(char)1).trim();
			}catch(Exception e){
				System.out.println("inStr");
				System.out.println(e.getMessage());
			}
		}
		return str;
	}

	/***************************************************
	*函数名称：outStr()<br>
	*函数功能：做编码二次转换,出库时防止Exception<br>
	*返回值：  String
	*		   返回中文字符串<br>
	*参数说明：str<br>
	*最后修改：白伟明
	*		   2004年8月17日
	****************************************************/
	public String outStr(String str){
		if(str==null){
			str="";
		}else{
			try{
				str=str.replace((char)1,'\'').trim();
			}catch(Exception e){
				System.out.println("outStr");
				System.out.println(e.getMessage());
			}
		}
		return str;
	}

}
