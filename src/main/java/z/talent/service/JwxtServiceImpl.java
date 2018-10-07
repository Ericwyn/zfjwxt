package z.talent.service;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.interfaces.RSAPublicKey;
import java.util.ArrayList;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import okhttp3.FormBody;
import okhttp3.Request;
import okhttp3.Response;
import z.talent.beans.PtuClassItemB;
import z.talent.utils.base64tohex;
import z.talent.utils.okht;



@Service("JwxtSer")
@Component
@Transactional
@Scope("prototype")
public class JwxtServiceImpl implements JwxtServiceInf {

	String cookie;
	String privateKey;
	String result,prestring;
	HttpSession httpSession ;
	ArrayList<PtuClassItemB> arrayLists = new ArrayList<PtuClassItemB>();
	
	//取得配置文件ip
	static final String getIp() {
		Properties p=new Properties();
        try {
        	InputStream is=JwxtServiceImpl.class.getClassLoader().getResourceAsStream("settings.properties");
			p.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return p.isEmpty()?"1":p.getProperty("address").toString();
	}
	
	public String Login(String stuid, String password, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		httpSession = httpServletRequest.getSession();
		getCookie(stuid, password);
		String data = result;
		result = null;
		return data;
	}

	public void getCookie(String yhm, String mm) {
		// TODO Auto-generated method stub
		Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/xtgl/login_slogin.html").addHeader("Connection", "close").addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").get().build();
		Response arg1;
		try {
			arg1 = okht.okHttpClient.newCall(re).execute();
			if(arg1.isSuccessful()) {
				String scookie = arg1.header("set-cookie");
				String data = arg1.body().string();
				Document document = Jsoup.parse(data);
				Element ele = document.getElementById("csrftoken");
				String token = ele.attr("value");
				arg1.close();
				getPrivatekey(yhm, mm, scookie,token);	
			}
		else{
				result = "fail";
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "fail";
		}
	}

	public void getPrivatekey(String yhm, String mm, String scookie, String stoken) {
		// TODO Auto-generated method stub
		Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/xtgl/login_getPublicKey.html").addHeader("Connection", "close").addHeader("Referer", "http://"+getIp()+"/jwglxt/xtgl/login_slogin.html").addHeader("Cookie", scookie).addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").get().build();
		Response arg1;
		try {
			arg1 = okht.okHttpClient.newCall(re).execute();
			if (arg1.isSuccessful()) {
				privateKey = arg1.body().string();
				arg1.close();
				//System.err.println(privateKey);
				getLoginResult(privateKey, yhm, mm, scookie,stoken);
			}
			else {
				result = "fail";
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "fail";
		}
	}

	public void getLoginResult(String privateKey, String yhm, String mm, String scookie, String stoken) {
		// TODO Auto-generated method stub
		try {
			/**
			 * 开始进行Rsa加密post密码
			 */
			JSONObject jsonObject = new JSONObject(privateKey);
			String eString = jsonObject.getString("modulus");
			String hex =  new BigInteger(z.talent.utils.base64tohex.b64tohex(eString), 16).toString();
			String m =  new BigInteger(z.talent.utils.base64tohex.b64tohex("AQAB"), 16).toString();
			RSAPublicKey rsaPublicKey = base64tohex.getPublicKey(hex, m);
			String emm = null;
			emm = base64tohex.encryptByPublicKey(mm, rsaPublicKey);
			emm = base64tohex.hex2b64(emm);
			///System.err.println(emm);
			FormBody.Builder formBody=new FormBody.Builder();
			formBody.add("csrftoken", stoken);
			formBody.add("yhm", yhm);
			formBody.add("mm", emm);
			formBody.add("mm", emm);
			
			Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/xtgl/login_slogin.html").addHeader("Connection", "close").addHeader("Cookie", scookie).addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").post(formBody.build()).build();
			Response arg1 = okht.okHttpClient.newCall(re).execute();
			if(arg1.isRedirect()) {
				httpSession.setAttribute("jsession", scookie);
				httpSession.setAttribute("yhm", yhm);
				result = "ok";
				arg1.close();	
			}
			else {
				result = "fail";
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result = "fail";
			e.printStackTrace();
		}
	}

	public String ExamPlanResult(String year, String term, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		getExamPlan(year, term, httpServletRequest);
		String data = result;
		result = null;
		return data;
	}

	public void getExamPlan(String year, String term, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		httpSession = httpServletRequest.getSession();
		if(httpSession.getAttribute("jsession")==null) {
			result = "fail";
		}
		else {
			try {
				String scookie = (String)httpSession.getAttribute("jsession");
				String res = "";
				
				FormBody.Builder formBody=new FormBody.Builder();
				if(year==null) {
					year="";
				}
				if(term==null) {
					term = "";
				}
				formBody.add("xnm", year);
				formBody.add("xqm", term);
				formBody.add("_search", "false");
				formBody.add("queryModel.showCount", "1000");
				formBody.add("queryModel.currentPage", "1");
				formBody.add("queryModel.sortName", "");
				formBody.add("queryModel.sortOrder", "desc");
				
				Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/kwgl/kscx_cxXsksxxIndex.html?doType=query&gnmkdm=N358105").addHeader("Connection", "close").addHeader("Cookie", scookie).addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").post(formBody.build()).build();
				Response arg1 = okht.okHttpClient.newCall(re).execute();
				if (arg1.isSuccessful()) {
					String source = arg1.body().string();
					String s = source;
					if(arg1.code()==302) 
					{
						result = "fail";
						return;
					}
					
					else {
						JSONObject jsonObject0 = new JSONObject(s);
						JSONArray jsonArray = jsonObject0.getJSONArray("items");
						if(jsonArray.length()<1) 
						{
							StringBuffer detail = new StringBuffer(); 
							result = "暂时还没有任何数据，请耐心等候...";
							return;
						}
						StringBuffer detail = new StringBuffer(); 
						
						detail.append("<div><p style='font-size:15pt;color:#000;display:block;'>姓名:"+jsonArray.getJSONObject(0).getString("xm")+"</p>");
						detail.append("<p style='font-size:15pt;color:#000;display:block;'>学年:"+jsonArray.getJSONObject(0).getString("xnmc")+"</p>");
						detail.append("<p style='font-size:15pt;color:#000;display:block;'>专业:"+jsonArray.getJSONObject(0).getString("zymc")+"</p>");
						detail.append("<p style='font-size:15pt;color:#000;display:block;'>班级:"+jsonArray.getJSONObject(0).getString("bj")+"</p>");
						detail.append("<p style='margin-top:20px;font-size:15pt;color:#000;display:block;'>学号:"+jsonArray.getJSONObject(0).getString("xh")+"</p><br></div>");
						
						for(int i=0; i<jsonArray.length();i++)
						{
							detail.append("<div><p style='font-size:17pt;color:#000;display:block;'>"+jsonArray.getJSONObject(i).getString("kcmc")+"</p>");
						
							detail.append( "<p style='font-size:15pt;color:#38C03E;display:block;'>考场:"+jsonArray.getJSONObject(i).getString("cdmc")+"</p>");
							
							//echo $result['items'][$i]['kcmc']."<br>";
							detail.append( "考试时间:"+jsonArray.getJSONObject(i).getString("kssj"));
							detail.append( "<br></div>");
						}
						result = detail.toString();
						arg1.close();
					}
				}
				else {
					result = "fail";
				}
			}
			catch (Exception e) {
				result = "fail";
			}			
		}
	}

	@Override
	public String StuInformationResult(HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		getStuInformation(httpServletRequest);
		String data = result;
		result = null;
		return data;
	}

	@Override
	public void getStuInformation(HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		httpSession = httpServletRequest.getSession();
		if(httpSession.getAttribute("jsession")==null) {
			result = "fail";
			//System.err.println("faill");
		}
		else {

			String scookie = (String)httpSession.getAttribute("jsession");
			String res = "";
			Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/xsxy/xsxyqk_cxXsxyqkIndex.html?gnmkdm=N105515&layout=default").addHeader("Connection", "close").addHeader("Cookie", scookie).addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").get().build();
			try {
				Response arg1=okht.okHttpClient.newCall(re).execute();
				if(arg1.isSuccessful()) {
					String source = arg1.body().string();
					String s = source;
					if(arg1.code()==302) 
					{
						result = "fail";
						return;
					}
						prestring="";
						Document document = Jsoup.parse(source);
						Pattern pattern = Pattern.compile("xfyqjd_id='(.*?)'");
						Matcher matcher = pattern.matcher(source);
						String fid = "";
						while (matcher.find()) {
							String haha = matcher.group(1);
							
							if(haha.equals("")) {
								
							}
							else {
								if(haha.length()>8) {
									fid = haha;
									
									break;
								}
								
							}
							
						}
						Pattern pattern1 = Pattern.compile("<ul id='ul"+fid+"'>(.*?)</ul>",Pattern.DOTALL);
						Matcher matcher1 = pattern1.matcher(source);
						String content = "";
						while (matcher1.find()) {
							String haha = matcher1.group(1);
					
							if(haha.equals("")) {
								continue;
							}
							else {
								content = matcher1.group(1).replaceAll("\\n", "").replaceAll("\\+", "").replaceAll("\"", "");
								break;
							}
							
						}			
						prestring = document.getElementById("alertBox").html()+content;
						String xh_id = document.getElementById("xh_id").attr("value");
						getStuBxClass(xh_id,fid,httpServletRequest);
						arg1.close();
				}
				else {
					result = "fail";
				}
			}
			catch (Exception e) {
				result = "fail";
				// TODO: handle exception
			}	
		}
	}

	@Override
	public void getStuBxClass(String xh_id, String fid, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		httpSession = httpServletRequest.getSession();
		if(httpSession.getAttribute("jsession")==null) {
			result = "fail";
			
		}
		else {
				String scookie = (String)httpSession.getAttribute("jsession");
				String res = "";
				FormBody.Builder formBody=new FormBody.Builder();
				formBody.add("xfyqjd_id", fid);
				formBody.add("xh_id", xh_id);
				Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/xsxy/xsxyqk_cxJxzxjhxfyqKcxx.html?gnmkdm=N105515").addHeader("Referer", "http://"+getIp()+"/jwglxt/xsxy/xsxyqk_cxXsxyqkIndex.html?gnmkdm=N105515&layout=default").addHeader("Connection", "close").addHeader("Cookie", scookie).addHeader("Accept", "application/json, text/javascript, */*; q=0.01").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").post(formBody.build()).build();
			try {
				Response arg1=okht.okHttpClient.newCall(re).execute();
				if(arg1.isSuccessful()) {
					String source = arg1.body().string();
					String s = source;
					if(arg1.code()==302) 
					{
						result = "fail";
						return;
					}
					JSONArray jsonArray = new JSONArray(source);
					if(jsonArray.length()<1) 
					{
						StringBuffer detail = new StringBuffer(); 
						if(fid.length()<13) {
							getStuBxClass(xh_id, fid+"-0", httpServletRequest);
						}
						else {
							result = "暂时还没有任何数据，请耐心等候...";
						}
						return;
					}
					StringBuffer detail = new StringBuffer(); 
					for(int i=0; i<jsonArray.length();i++)
					{   if(jsonArray.getJSONObject(i).has("CJ")) {
								detail.append("<div><p style='font-size:17pt;color:#000;display:block;'>"+jsonArray.getJSONObject(i).getString("KCMC")+"</p>");
								detail.append( "<p style='font-size:15pt;color:#38C03E;display:block;'>成绩"+jsonArray.getJSONObject(i).getString("CJ")+"</p>");
							
								detail.append( "<p style='font-size:15pt;color:#38C03E;display:block;'>绩点"+jsonArray.getJSONObject(i).getInt("JD")+"</p>");
								int jd = jsonArray.getJSONObject(i).getInt("JD");
							if(jd>0) {
								detail.append( "<p style='font-size:15pt;color:#38C03E;display:block;'>通过</p>");
							}
							else {
								detail.append( "<p style='font-size:15pt;color:red;display:block;'>未通过，在修</p>");
							}
						}
						else {
								detail.append("<div><p style='font-size:17pt;color:#000;display:block;'>"+jsonArray.getJSONObject(i).getString("KCMC")+"</p>");
				
						}
								detail.append( "<p style='font-size:15pt;color:#38C03E;display:block;时间'>"+jsonArray.getJSONObject(i).getString("JYXDXNMC")+"</p>");
								detail.append( "<p style='font-size:15pt;color:#38C03E;display:block;'>学分"+jsonArray.getJSONObject(i).getString("XF")+"</p>");
								detail.append( "<br></div>");
					}		
						result = prestring+"<br>"+detail.toString();
						arg1.close();
				}
				else {
					result = "fail";
				}	
			}
			catch (Exception e) {
				result = "fail";
				// TODO: handle exception
			}	
		}
	}

	@Override
	public String Score(String year, String term, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		getScore(year, term, httpServletRequest);
		String data = result;
		result = null;
		return data;
	}

	@Override
	public void getScore(String year, String term, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		httpSession = httpServletRequest.getSession();
		if(httpSession.getAttribute("jsession")==null) {
			result = "fail";
		}
		else {
			try {
					String scookie = (String)httpSession.getAttribute("jsession");
					String yhm = (String)httpSession.getAttribute("yhm");
					String res = "";
					
					FormBody.Builder formBody=new FormBody.Builder();
					formBody.add("xnm", year);
					formBody.add("xqm", term);
					formBody.add("_search", "false");
					formBody.add("queryModel.showCount", "1000");
					formBody.add("queryModel.currentPage", "1");
					formBody.add("queryModel.sortName", "");
					formBody.add("queryModel.sortOrder", "desc");
					
					Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/cjcx/cjcx_cxDgXscj.html?doType=query&gnmkdm=N305005").addHeader("Connection", "close").addHeader("Cookie", scookie).addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").post(formBody.build()).build();
					
					Response arg1=okht.okHttpClient.newCall(re).execute();
					if(arg1.isSuccessful()) {
							String source = arg1.body().string();
							String s = source;
							//System.err.println(s);
							if(!s.substring(0,1).equals("{")) 
							{
								result = "fail";
								//System.err.println(s);
								return;
							}
							
							else {
								JSONObject jsonObject0 = new JSONObject(s);
								JSONArray jsonArray = jsonObject0.getJSONArray("items");
								if(jsonArray.length()<1) 
								{
									StringBuffer detail = new StringBuffer(); 
									result = "暂时还没有任何数据，请耐心等候...";
									return;
								}
								StringBuffer detail = new StringBuffer(); 
								
								detail.append("<div><p style='font-size:15pt;color:#000;display:block;'>姓名:"+jsonArray.getJSONObject(0).getString("xm")+"</p>");
								detail.append("<p style='font-size:15pt;color:#000;display:block;'>学年:"+year+"</p>");
								detail.append("<p style='font-size:15pt;color:#000;display:block;'>学院:"+jsonArray.getJSONObject(0).getString("jgmc")+"</p>");
								detail.append("<p style='font-size:15pt;color:#000;display:block;'>班级:"+jsonArray.getJSONObject(0).getString("bj")+"</p>");
								detail.append("<p style='margin-top:20px;font-size:15pt;color:#000;display:block;'>学号:"+jsonArray.getJSONObject(0).getString("xh")+"</p><br></div>");
								
								for(int i=0; i<jsonArray.length();i++)
								{
									detail.append("<div><p style='font-size:17pt;color:#000;display:block;'>"+jsonArray.getJSONObject(i).getString("kcmc")+"</p>");
									detail.append( "<p style='font-size:15pt;color:#38C03E;display:block;'>成绩："+jsonArray.getJSONObject(i).getString("cj")+"</p>");
									detail.append( "学分:"+jsonArray.getJSONObject(i).getString("xf")+"&nbsp;|&nbsp;");
									detail.append( "绩点:"+jsonArray.getJSONObject(i).getString("jd")+"&nbsp;|&nbsp;");
									detail.append( jsonArray.getJSONObject(i).getString("ksxz") +"<br></div>");
								}
								result = detail.toString();
								arg1.close();
							}
					}
					else {
						//System.err.println(arg1.code());
						result = "fail";
					}
				} catch (Exception e) {
					result = "fail";
				
				}				
		}
	}

	@Override
	public String Rank(String year, String term, String tjlx, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		getRank(year, term, tjlx,httpServletRequest);
		String data = result;
		result = null;
		return data;
	}

	@Override
	public void getRank(String year, String term, String tjlx, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		httpSession = httpServletRequest.getSession();
		if(httpSession.getAttribute("jsession")==null) {
			result = "fail";
		}
		else {
			try {
					String scookie = (String)httpSession.getAttribute("jsession");
					String yhm = (String)httpSession.getAttribute("yhm");
					String res = "";
					FormBody.Builder formBody=new FormBody.Builder();
					
					formBody.add("xnm", year);
					formBody.add("xqm", term);
					
					formBody.add("jg_id", "");
					formBody.add("njdm_id", "");
					formBody.add("zyh_id", "");
					formBody.add("bh_id", "");
					formBody.add("xh", yhm);
					formBody.add("tjlx", tjlx);
					formBody.add("tjkssj", "");
					formBody.add("tjjssj", "");
					formBody.add("_search", "false");
					formBody.add("queryModel.showCount", "1000");
					formBody.add("queryModel.currentPage", "1");
					formBody.add("queryModel.sortName", "");
					formBody.add("queryModel.sortOrder", "desc");
					Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/cjpmtj/cjpmtj_cxCjpmtjIndex.html?doType=query&gnmkdm=N305005").addHeader("Connection", "close").addHeader("Cookie", scookie).addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").post(formBody.build()).build();

					Response arg1=okht.okHttpClient.newCall(re).execute();
					if(arg1.isSuccessful()) {
							String source = arg1.body().string();
							String s = source;
							//System.err.println(s);
							if(!s.substring(0,1).equals("{")) 
							{
								result = "fail";
								//System.err.println(s);
								return;
							}
							
							else {
								JSONObject jsonObject0 = new JSONObject(s);
								JSONArray jsonArray = jsonObject0.getJSONArray("items");
								if(jsonArray.length()<1) 
								{
									StringBuffer detail = new StringBuffer(); 
									result = "暂时还没有任何数据，请耐心等候...";
									return;
								}
								StringBuffer detail = new StringBuffer(); 
								
								detail.append("<div><p style='font-size:15pt;color:#000;display:block;'>姓名:"+jsonArray.getJSONObject(0).getString("XM")+"</p>");
								detail.append("<p style='font-size:15pt;color:#000;display:block;'>学年:"+year+"</p>");
								detail.append("<p style='font-size:15pt;color:#000;display:block;'>学院:"+jsonArray.getJSONObject(0).getString("JGMC")+"</p>");
								detail.append("<p style='font-size:15pt;color:#000;display:block;'>班级:"+jsonArray.getJSONObject(0).getString("BJ")+"</p>");
								detail.append("<p style='margin-top:20px;font-size:15pt;color:#000;display:block;'>学号:"+jsonArray.getJSONObject(0).getString("XH")+"</p><br></div>");
								
								for(int i=0; i<jsonArray.length();i++)
								{
									detail.append("<div>");
									detail.append( "<p style='font-size:15pt;color:#38C03E;display:block;'>平均排名："+jsonArray.getJSONObject(i).getString("PJCJPM")+"</p>");
									detail.append( "平均成绩:"+jsonArray.getJSONObject(i).getString("PJCJ")+"&nbsp;|&nbsp;");
									//echo $result['items'][$i]['kcmc']."<br>";
									detail.append( "加权成绩:"+jsonArray.getJSONObject(i).getString("JQCJ")+"&nbsp;|&nbsp;");
									detail.append( "加权排名:"+jsonArray.getJSONObject(i).getString("PM")+"&nbsp;|&nbsp;");
									detail.append( "<br></div>");
								}
								
								result = detail.toString();
								arg1.close();
							}
					}
					else {
						//System.err.println(arg1.code());
						result = "fail";
					}
				} catch (Exception e) {
					result = "fail";
					//System.err.println(e.toString());
					// TODO: handle exception
				}			
		}
	}

	@Override
	public String DetailScore(String year, String term, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		getDetailScore(year, term, httpServletRequest);
		String data = result;
		result = null;
		return data;
	}

	@Override
	public void getDetailScore(String year, String term, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		httpSession = httpServletRequest.getSession();
		if(httpSession.getAttribute("jsession")==null) {
			result = "fail";
		}
		else {
			try {
					String scookie = (String)httpSession.getAttribute("jsession");
					String yhm = (String)httpSession.getAttribute("yhm");
					String res = "";
					
					FormBody.Builder formBody=new FormBody.Builder();
					
					formBody.add("xnm", year);
					formBody.add("xqm", term);
					formBody.add("_search", "false");
					formBody.add("queryModel.showCount", "1000");
					formBody.add("queryModel.currentPage", "1");
					formBody.add("queryModel.sortName", "");
					formBody.add("queryModel.sortOrder", "desc");
					
					Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/cjcx/cjcx_cxDgXscj.html?doType=query&gnmkdm=N305005").addHeader("Connection", "close").addHeader("Cookie", scookie).addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").post(formBody.build()).build();
					Response arg1=okht.okHttpClient.newCall(re).execute();
					if (arg1.isSuccessful()) {
						String source = arg1.body().string();
						String s = source;
						if(!s.substring(0,1).equals("{")) 
						{
							result = "fail";
							return;
						}
						else {
							JSONObject jsonObject0 = new JSONObject(s);
							JSONArray jsonArray = jsonObject0.getJSONArray("items");
							if(jsonArray.length()<1) 
							{
								StringBuffer detail = new StringBuffer(); 
								result = "暂时还没有任何数据，请耐心等候...";
								return;
							}
							StringBuffer detail = new StringBuffer(); 
							
							detail.append("<div><p style='font-size:15pt;color:#000;display:block;'>姓名:"+jsonArray.getJSONObject(0).getString("xm")+"</p>");
							detail.append("<p style='font-size:15pt;color:#000;display:block;'>学年:"+year+"</p>");
							detail.append("<p style='font-size:15pt;color:#000;display:block;'>学院:"+jsonArray.getJSONObject(0).getString("jgmc")+"</p>");
							detail.append("<p style='font-size:15pt;color:#000;display:block;'>班级:"+jsonArray.getJSONObject(0).getString("bj")+"</p>");
							detail.append("<p style='margin-top:20px;font-size:15pt;color:#000;display:block;'>学号:"+jsonArray.getJSONObject(0).getString("xh")+"</p><br></div>");
							for(int i=0; i<jsonArray.length();i++)
							{
								detail.append("<div><p style='font-size:17pt;color:#000;display:block;'>"+jsonArray.getJSONObject(i).getString("kcmc")+"</p>");
						
								detail.append( "<p style='font-size:15pt;color:#38C03E;display:block;'>成绩："+jsonArray.getJSONObject(i).getString("cj")+"</p>");			
								//echo $result['items'][$i]['kcmc']."<br>";
								detail.append( "学分:"+jsonArray.getJSONObject(i).getString("xf")+"&nbsp;|&nbsp;");
								detail.append( "绩点:"+jsonArray.getJSONObject(i).getString("jd")+"&nbsp;|&nbsp;");
								detail.append( jsonArray.getJSONObject(i).getString("ksxz") +"<br>"
										+ "<form action=\"detailscore\" method=\"post\">"
										+ "<input type=\"hidden\" name = \"xnm\" value=\""
										+ jsonArray.getJSONObject(i).getString("xnm")
										+ "\">"
										+ "<input type=\"hidden\" name = \"xqm\" value=\""
										+ jsonArray.getJSONObject(i).getString("xqm")
										+ "\">"
										+ "<input type=\"hidden\" name = \"xh_id\" value=\""
										+ jsonArray.getJSONObject(i).getString("xh_id")
										+ "\">"
										+ "<input type=\"hidden\" name = \"jxb_id\" value=\""
										+ jsonArray.getJSONObject(i).getString("jxb_id")
										+ "\">"
										+ "<input type=\"hidden\" name = \"scookie\" value=\""
										+ scookie
										+ "\">"
										+ "<input type=\"submit\" name = \"go\" value=\"查分数明细\" style=\"color:#4878ff;background-color:transparent;border:0px;\">"
										+ ""
										+ "</form>"
										+ "</div>");
							}		
							arg1.close();
							result = detail.toString();
						}
					}		
					else {
						result="fail";
					}
				} catch (Exception e) {
					result = "fail";
					// TODO: handle exception
				}			
		}
	}

	@Override
	public ArrayList<PtuClassItemB> MyClass(String year, String term, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		getMyClass(year, term, httpServletRequest);
		ArrayList<PtuClassItemB> data = arrayLists;
		arrayLists = null;
		//System.err.println(data.size());
		return data;
	}

	@Override
	public void getMyClass(String year, String term, HttpServletRequest request) {
		// TODO Auto-generated method stub
		httpSession = request.getSession();
		if(httpSession.getAttribute("jsession")==null) {
			System.err.println("failtosession");;
			
			return;
		}
		try {
			String scookie = (String)httpSession.getAttribute("jsession");
			String yhm = (String)httpSession.getAttribute("yhm");
			FormBody.Builder formBody=new FormBody.Builder();
			formBody.add("xnm", year);
			formBody.add("xqm", term);
			Request re=new Request.Builder().url("http://"+getIp()+"/jwglxt/kbcx/xskbcx_cxXsKb.html?gnmkdm=N2151").addHeader("Cookie", scookie).post(formBody.build()).build();
			Response arg1=okht.okHttpClient.newCall(re).execute();
			if (arg1.isSuccessful()) {
				String source = arg1.body().string();
				String s = source;
				//System.err.println(s);
				if(!s.substring(0,1).equals("{")) 
				{
					System.err.println("nojson");;
					return;
				}
				else {
					JSONObject jsonObject0 = new JSONObject(s);
					if(jsonObject0.has("kbList")) {
						System.err.println("have kb");
					}
					else {
						System.err.println("Nohas");
					}
					JSONArray jsonArray1 = jsonObject0.getJSONArray("kbList");
					if(jsonArray1.length()<1) 
					{
						StringBuffer detail = new StringBuffer(); 
						System.err.println("bbbbb:have no data");
						return;
					}		
					else {
						ArrayList<PtuClassItemB> arrayList = new ArrayList<>();
						for(int offset=0;offset<jsonArray1.length();offset++) {
							JSONObject reitem = (JSONObject)jsonArray1.get(offset);
							String cdmc= reitem.getString("cdmc");
							String xqjmc= reitem.getString("xqjmc");
							String kcmc= reitem.getString("kcmc");
							String jcs= reitem.getString("jcs");
							//String uuid= bh_id;
							String zcd= reitem.getString("zcd");
							PtuClassItemB ptuClassItemB = new PtuClassItemB(0, cdmc, xqjmc, kcmc, jcs, "", zcd);
							arrayList.add(ptuClassItemB);
							
						}
						arrayLists = arrayList;
						//System.err.println("sss"+arrayLists.size());
						return;
					}
					
				}
			}	
			else {
				System.err.println("网络请求fail");
				//arrayList = null;
			}
		} catch (Exception e) {
			//arrayList = null;
			System.err.println("myclass:"+e.toString());
			// TODO: handle exception
		}
	}

	@Override
	public String getDetail(String xnm, String xqm, String xh_id, String jxb_id, String scookie) {
		// TODO Auto-generated method stub
		FormBody.Builder formBody=new FormBody.Builder();
		formBody.add("xnm", xnm);
		formBody.add("xqm", xqm);
		formBody.add("xh_id", xh_id);
		formBody.add("jxb_id", jxb_id);
		formBody.add("_search", "false");
		formBody.add("queryModel.sortOrder", "asc");
		Request re=new Request.Builder().url("http://172.16.1.201/jwglxt/cjcx/cjcx_cxXsXmcjList.html?gnmkdm=N305005&su="+xh_id).addHeader("Referer", "http://172.16.1.201/jwglxt/cjcx/cjcx_cxDgXsxmcj.html?gnmkdm=N305005").addHeader("Cookie", scookie).addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8").addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36").post(formBody.build()).build();
		try {
			Response arg1=okht.okHttpClient.newCall(re).execute();
			if(arg1.isSuccessful()) {
				String source = arg1.body().string();
				String detail = "";
				//System.err.println(source);
				if(!source.startsWith("{")) {
					result = "fail";
				}
				else {
					JSONObject jsonObject0 = new JSONObject(source);
					JSONArray jsonArray = jsonObject0.getJSONArray("items");
					if (jsonArray.length()<1) {
						result = "none";
					}
					else {
						for(int i=0; i<jsonArray.length();i++)
						{
							detail = detail + "<div><pre style='background:#;font-size:17pt;color:#000;display:block;box-shadow:0px 0px 50px #ddd;height:0px;'>";
							detail = detail + jsonArray.getJSONObject(i).getString("xmblmc")+""+"</pre><br>";
							detail = detail + jsonArray.getJSONObject(i).getString("xmcj")+""+"</div>";
						}
						result = detail;
					}
				}
				arg1.close();
			}
			else {
				result="fail";
			}
		} catch (Exception e) {
			result="fail";
			// TODO: handle exception
		}
		return result;	
	}

}
