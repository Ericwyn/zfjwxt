package z.talent.controller;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.Year;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.sun.org.apache.xalan.internal.xsltc.compiler.SourceLoader;


import z.talent.service.JwxtServiceImpl;
import z.talent.service.JwxtServiceInf;

@Controller
@SessionScope
@RequestMapping("jwxt")
public class JwxtController {
	
	//登录
		@GetMapping("")
		public String mainl(Model model) {
			//System.err.println("fff");
			return "jwxt/login";
		}
	
	@Resource(name="JwxtSer")
	JwxtServiceInf jwxtService;
	
	//登录
	@GetMapping("login")
	public String Login(Model model) {
		return "jwxt/login";
	}
	
	//验证是否登录成功，提交变淡页面
	@PostMapping("login")
	public String LoginVerify(Model model,HttpServletRequest httpServletRequest,@RequestParam("yhm")String yhm,@RequestParam("mm")String mm) {
		if(jwxtService.Login(yhm, mm,httpServletRequest).equals("ok")) {
			return "redirect:main";
		}
		model.addAttribute("result", "账号或密码有误，重新输入");
		return "jwxt/login";
	}
	
	//主页面
	@GetMapping("main")
	public String main(Model model) {
		return "jwxt/main";
	}
	
	
	
	@GetMapping("score")
	public String score(Model model,HttpServletRequest httpServletRequest,@RequestParam(value="year",required=false)String year,@RequestParam(value="term",required=false)String term) {
		if(year==null) {
			LocalDateTime localdatetime=LocalDateTime.now();
			int i = localdatetime.getYear();
			int m = localdatetime.getMonth().getValue();
			String y = ""+i;
			String t= "3";
			
			if(m>3&&m<8) {
				y=""+(i-1);
				t="12";
			}
			String reString = jwxtService.Score(y, t, httpServletRequest);
			if(reString.equals("fail")) {
				return "redirect:login";
			}
			model.addAttribute("year", y);
			model.addAttribute("years", y+"-"+(y+1));
			if(t.equals("3")) {
				model.addAttribute("term", "3");
				model.addAttribute("terms", "1");
			}
			else if(t.equals("12")){
				model.addAttribute("term", "12");
				model.addAttribute("terms", "2");
			}
			model.addAttribute("result", reString);
		}
		else {
			String reString = jwxtService.Score(year, term, httpServletRequest);
			if(reString.equals("fail")) {
				return "redirect:login";
			}
			model.addAttribute("year", year);
			model.addAttribute("years", year+"-"+(year+1));
			if(term.equals("3")) {
				model.addAttribute("term", "3");
				model.addAttribute("terms", "1");
			}
			else if(term.equals("12")){
				model.addAttribute("term", "12");
				model.addAttribute("terms", "2");
			}
			model.addAttribute("result", reString);
		}
		return "jwxt/score";
	}
	//平时分
	@GetMapping("study")
	public String study(Model model,HttpServletRequest httpServletRequest,@RequestParam(value="year",required=false)String year,@RequestParam(value="term",required=false)String term) {
		if(year==null) {
			LocalDateTime localdatetime=LocalDateTime.now();
			int i = localdatetime.getYear();
			int m = localdatetime.getMonth().getValue();
			String y = ""+i;
			String t= "3";
			
			if(m>3&&m<8) {
				y=""+(i-1);
				t="12";
			}
			String reString = jwxtService.DetailScore(y, t, httpServletRequest);
			if(reString.equals("fail")) {
				return "redirect:login";
			}
			model.addAttribute("year", y);
			model.addAttribute("years", y+"-"+(y+1));
			if(t.equals("3")) {
				model.addAttribute("term", "3");
				model.addAttribute("terms", "1");
			}
			else if(t.equals("12")){
				model.addAttribute("term", "12");
				model.addAttribute("terms", "2");
			}
			model.addAttribute("result", reString);
			//model.addAttribute("result", );
		}
		else {
			String reString = jwxtService.DetailScore(year, term, httpServletRequest);
			if(reString.equals("fail")) {
				return "redirect:login";
			}
			model.addAttribute("year", year);
			model.addAttribute("years", year+"-"+(year+1));
			if(term.equals("3")) {
				model.addAttribute("term", "3");
				model.addAttribute("terms", "1");
			}
			else if(term.equals("12")){
				model.addAttribute("term", "12");
				model.addAttribute("terms", "2");
			}
			model.addAttribute("result", reString);
			//model.addAttribute("result", jwxtService.DetailScore(year, term, httpServletRequest));
		}
		return "jwxt/detailscore";
	}
	
	
	@PostMapping("detailscore")
	public String detailscore(Model model,HttpServletRequest request,@RequestParam("xnm")String xnm,@RequestParam("xqm")String xqm,@RequestParam("jxb_id")String jxb_id,@RequestParam("xh_id")String xh_id,@RequestParam("scookie")String scookie) {
		
		String s = jwxtService.getDetail(xnm, xqm, xh_id, jxb_id, scookie);
		
		model.addAttribute("detail",s);
		
		
		return "result-score-detail";
	}
	
	
	@GetMapping("ptusystem")
	public String ptusystem(Model model,HttpServletRequest httpServletRequest,@RequestParam(value="year",required=false)String year,@RequestParam(value="term",required=false)String term) {
		
		return "ptxy/ptu_system";
	}
	//考场信息
	
	@GetMapping("exam")
	public String exam(Model model,HttpServletRequest httpServletRequest,@RequestParam(value="year",required=false)String year,@RequestParam(value="term",required=false)String term) {
		if(year==null) {
			LocalDateTime localdatetime=LocalDateTime.now();
			int i = localdatetime.getYear();
			int m = localdatetime.getMonth().getValue();
			String y = ""+i;
			String t= "3";
			
			if(m>3&&m<8) {
				y=""+(i-1);
				t="12";
			}
			String reString = jwxtService.ExamPlanResult(y, t, httpServletRequest);
			if(reString.equals("fail")) {
				return "redirect:login";
			}
			model.addAttribute("year", y);
			model.addAttribute("years", y+"-"+(y+1));
			if(t.equals("3")) {
				model.addAttribute("term", "3");
				model.addAttribute("terms", "1");
			}
			else if(t.equals("12")){
				model.addAttribute("term", "12");
				model.addAttribute("terms", "2");
			}
			model.addAttribute("result", reString);
			//model.addAttribute("result", ));
		}
		else {
			String reString = jwxtService.ExamPlanResult(year, term, httpServletRequest);
			if(reString.equals("fail")) {
				return "redirect:login";
			}
			model.addAttribute("year", year);
			model.addAttribute("years", year+"-"+(year+1));
			if(term.equals("3")) {
				model.addAttribute("term", "3");
				model.addAttribute("terms", "1");
			}
			else if(term.equals("12")){
				model.addAttribute("term", "12");
				model.addAttribute("terms", "2");
			}
			model.addAttribute("result", reString);
			//////model.addAttribute("result", );
		}
		return "jwxt/examplan";
	}
	/**
	@GetMapping("ptustuinformation")
	public String ptustuinformation(Model model,HttpServletRequest httpServletRequest) {
		String result = ptuService.StuInformationResult(httpServletRequest);
		if(result.equals("fail")) {
			return "redirect:ptulogin";
		}
		model.addAttribute("result",result );
		return "ptxy/stu_information";
	}
	**/
	
	//课表信息
	
		@GetMapping("myclass")
		public String myClass(Model model,HttpServletRequest httpServletRequest,@RequestParam(value="year",required=false)String year,@RequestParam(value="term",required=false)String term) {
			if(year==null) {
				LocalDateTime localdatetime=LocalDateTime.now();
				int i = localdatetime.getYear();
				int m = localdatetime.getMonth().getValue();
				String y = ""+i;
				String t= "3";
				
				if(m>3&&m<8) {
					y=""+(i-1);
					t="12";
				}
				model.addAttribute("year", y);
				model.addAttribute("years", y+"-"+(y+1));
				if(t.equals("3")) {
					model.addAttribute("term", "3");
					model.addAttribute("terms", "1");
				}
				else if(t.equals("12")){
					model.addAttribute("term", "12");
					model.addAttribute("terms", "2");
				}
				model.addAttribute("classresult", jwxtService.MyClass(y, t, httpServletRequest));
			}
			else {
				model.addAttribute("year", year);
				model.addAttribute("years", year+"-"+(year+1));
				if(term.equals("3")) {
					model.addAttribute("term", "3");
					model.addAttribute("terms", "1");
				}
				else if(term.equals("12")){
					model.addAttribute("term", "12");
					model.addAttribute("terms", "2");
				}
				model.addAttribute("classresult", jwxtService.MyClass(year, term, httpServletRequest));
			}
			return "jwxt/myclass";
		}
	
		//排名信息
		
			@GetMapping("rank")
			public String Rank(Model model,HttpServletRequest httpServletRequest,@RequestParam(value="tjlx",required=false)String tjlx,@RequestParam(value="year",required=false)String year,@RequestParam(value="term",required=false)String term) {
				if(year==null) {
					LocalDateTime localdatetime=LocalDateTime.now();
					int i = localdatetime.getYear();
					int m = localdatetime.getMonth().getValue();
					String y = ""+i;
					String t= "3";
					
					if(m>3&&m<8) {
						y=""+(i-1);
						t="12";
					}
					model.addAttribute("year", y);
					model.addAttribute("years", y+"-"+(y+1));
					if(t.equals("3")) {
						model.addAttribute("term", "3");
						model.addAttribute("terms", "1");
					}
					else if(t.equals("12")){
						model.addAttribute("term", "12");
						model.addAttribute("terms", "2");
					}
					model.addAttribute("result", jwxtService.Rank(y, t, tjlx,httpServletRequest));
				}
				else {
					model.addAttribute("year", year);
					model.addAttribute("years", year+"-"+(year+1));
					if(term.equals("3")) {
						model.addAttribute("term", "3");
						model.addAttribute("terms", "1");
					}
					else if(term.equals("12")){
						model.addAttribute("term", "12");
						model.addAttribute("terms", "2");
					}
					model.addAttribute("result", jwxtService.Rank(year, term, tjlx, httpServletRequest));
				}
				return "jwxt/rank";
			}
	
}
