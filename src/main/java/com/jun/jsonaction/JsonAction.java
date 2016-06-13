package com.jun.jsonaction;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;


public class JsonAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8427981143843561412L;
	private HttpServletRequest request;
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	
	public String executeAjax(){
		try {
			String name =ServletActionContext.getRequest().getParameter("name");
			int age=Integer.parseInt(request.getParameter("age"));
			String  position=request.getParameter("position");
			System.out.println(name);
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("name", name);
			map.put("age", age);
			map.put("position", position);
			
			JSONObject json = JSONObject.fromObject(map);
			System.out.println(json);
			result =json.toString();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return SUCCESS;
	}

	

}
