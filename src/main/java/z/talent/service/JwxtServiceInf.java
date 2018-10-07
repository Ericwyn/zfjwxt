package z.talent.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import okhttp3.FormBody;
import okhttp3.Request;
import okhttp3.Response;
import z.talent.beans.PtuClassItemB;
import z.talent.utils.okht;

public interface JwxtServiceInf {
	/**
	 * 
	 * @param stuid
	 * @param password
	 * @param httpServletRequest
	 * @return
	 * 	用于获取登录结果
	 */
	public String Login(String stuid,String password,HttpServletRequest httpServletRequest);
	
	/**
	 * 
	 * 
	 * @param yhm
	 * @param mm
	 * 	预加载获取cookie
	 */
	public  void  getCookie(String yhm,String mm);
	
	/**
	 * 获取rsa秘钥
	 * 
	 */
	public  void getPrivatekey(String yhm,String mm,String scookie,String stoken);
	/**
	 * 
	 * 开始模拟登录post
	 * 
	 */
	public  void getLoginResult(String privateKey,String yhm,String mm,String scookie,String stoken);
	
	/**
	 * 
	 * 
	 * @param year
	 * @param term
	 * @param httpServletRequest
	 * @return
	 * 	考试考场计划
	 */
	
	public String ExamPlanResult(String year,String term,HttpServletRequest httpServletRequest);
	
	
	public  void getExamPlan(String year,String term,HttpServletRequest httpServletRequest);

	/**
	 * 
	 * 	学业进度查询开始<不完全带，代码>
	 */
	public String StuInformationResult(HttpServletRequest httpServletRequest);
	
	public  void getStuInformation(HttpServletRequest httpServletRequest);
	
	
	public  void getStuBxClass(String  xh_id,String fid,HttpServletRequest httpServletRequest);
	
	
	/**
	 * 
	 *  	成绩查询-----------Strat--------------------;
	 */
	public String Score(String year,String term,HttpServletRequest httpServletRequest);
	/**
	 * 发起查询请求
	 * **/
	public  void getScore(String year,String term,HttpServletRequest httpServletRequest);
	
	
	
	
	/**
	 * 
	 *  	排名查询-----------Strat--------------------;
	 */
	public String Rank(String year,String term,String tjlx,HttpServletRequest httpServletRequest);
	/**
	 * 发起查询请求
	 * **/
	public  void getRank(String year,String term,String tjlx,HttpServletRequest httpServletRequest);
	
	/**
	 * 
	 * 	排名查询--------------End-----------
	 */
	
	/**
	 * 
	 *  	
	 */
	public String DetailScore(String year,String term,HttpServletRequest httpServletRequest);
	/**
	 * 发起查询请求
	 * **/
	public  void getDetailScore(String year,String term,HttpServletRequest httpServletRequest);
	
	/**
	 *  开始 我的课表查询
	 */
	public ArrayList<PtuClassItemB> MyClass(String year,String term,HttpServletRequest httpServletRequest);
	/**
	 * 个人课表
	 * @param year
	 * @param term
	 * @param request
	 */
	public void  getMyClass(String year,String term,HttpServletRequest request);
	
	//成绩明细展示
	public  String getDetail(String xnm,String xqm,String xh_id,String jxb_id,String scookie); 

	
	
	
}
