<%@	page import="z.talent.beans.PtuClassItemB"%>
<%@	page import="java.util.ArrayList"%>
<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8") ;			// 按中文接收
	String str = request.getParameter("class") ;		// 接收表单参数
	//String var = request.getParameter("var") ;		// 接收表单参数
%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>张天才科技--课表</title>
<style>
		body,html{
			background:#fff;
			margin:0 auto;
			width:100%;
			height:100%;
		}
		#header{
			padding-top:10px;
			font-size:15pt;
			text-align:center;
			background-color:#01DFA5;
			color:#fff;
			height:45px;
			width:100%;
		}
		.content{
			margin-left:15px;
			margin-right:15px;
			box-shadow:0px 0px 5px #ddd; 
			padding:5px;
			background:#fff;
			color:#ddd;
			font-size:9pt;
		}
		.numname{
			color:#4878ff;
			font-size:15pt;
		}
		.classname{
			font-size:13pt;
		}
		.item{
			padding:3px;
			box-shadow:0px 1px 1px #ddd; 
			background:#fff;
			color:#040404;
			font-size:9pt;
		}
		.title{
			color:#000;
			font-size:15pt;
		}
		.num{
			width:100%;
			border-bottom:1px solid #ddd;
			height:10%;
		}
		.numparent{
			float: left;
			display:inline-block;
			width:10%;
			height:100%;
		}
		.itemparent{
			float: left;
			display:inline-block;
			width:18%;
			height:100%;
			
		}
		.item1{
			border-left:1px solid #ddd;
			width:100%;
			border-bottom:1px solid #ddd;
			height:10%;
			overflow:hidden;
			font-size:10pt;
		}
		.item1-2{
			border-left:1px solid #ddd;
			border-top:1px solid #ddd;
			border-bottom:1px solid #ddd;
			width:100%;
			height:20%;
			overflow:hidden;
			font-size:10pt;
		}
		.item1-3{
			border-left:1px solid #ddd;
			border-top:2px solid #ddd;
			border-bottom:1px solid #ddd;
			width:100%;
			height:30%;
			overflow:hidden;
			font-size:10pt;
		}
		.item1-4{
			border-left:1px solid #ddd;
			width:100%;
			height:40%;
			overflow:hidden;
			font-size:10pt;
		}
	</style>
</head>
<body>
	<div id="header"><img width="35px" height="35px" src="https://yss-1253784481.cossh.myqcloud.com/lovepicture/90637d19cc9146bda74d88889f5721f3246x0w.jpg"/>课程表</div>
	<%
		ArrayList<PtuClassItemB> resultItems = (ArrayList<PtuClassItemB>)request.getAttribute("classresult");
		if(resultItems==null){
			return;
		}
	%>
	<%
		ArrayList<PtuClassItemB> arrayList1 =  new ArrayList<>();
		ArrayList<PtuClassItemB> arrayList2 =  new ArrayList<>();
		ArrayList<PtuClassItemB> arrayList3 =  new ArrayList<>();
		ArrayList<PtuClassItemB> arrayList4 =  new ArrayList<>();
		ArrayList<PtuClassItemB> arrayList5 =  new ArrayList<>();
		for(PtuClassItemB pb:resultItems){
			String currectday = pb.getXqjmc();
			
			if(currectday.equals("星期一")){
				arrayList1.add(pb);
				//System.out.print("xingqiyi");
			}
			else if(currectday.equals("星期二")){
				arrayList2.add(pb);
				//System.out.print("xingqi22222");
			}
			else if(currectday.equals("星期三")){
				arrayList3.add(pb);
				//System.out.print("xingqi33333yi");
			}
			else if(currectday.equals("星期四")){
				arrayList4.add(pb);
				//System.out.print("xingqiyi444");
			}
			else if(currectday.equals("星期五")){
				arrayList5.add(pb);
				//System.out.print("xingqiy55i");
			}
			else{
				
			}
		}
	%>
		<div class='numparent'>
	<%
		////////////////nummmmmmmmmmmmm
	
		int arrnum=0;
		int starti=1;
		
		while(starti<11){
	%>
		<div class='num'>
	<%=starti %>
		</div>
	
	<%
		starti++;
		}
	%>
	</div>
		<div class='itemparent'>
	<%
		///111111111111111
		arrnum=0;
		starti=1;
	%>
	
	<% 
	while(starti<11){
		String classnum="";
		int start=0;
		int end =15;
		if(arrnum<arrayList1.size()){
			classnum = arrayList1.get(arrnum).getJcs();
		}			
		String[] jcs = classnum.split("-");
		if(jcs.length>1){
			start = Integer.parseInt(jcs[0]);
			end = Integer.parseInt(jcs[1]);
		}
		
				if(start==starti){
					
					
					///int dou = start+1;
					
					
					
					
					//避免单双周 start
					int nextitem = arrnum+1;
					String nextclassnum = "";
					int startnext=0,endnext=0;
					if(nextitem<arrayList1.size()){
						nextclassnum = arrayList1.get(nextitem).getJcs();
					}			
					String[] jcsnext = nextclassnum.split("-");
					if(jcsnext.length>1){
						startnext = Integer.parseInt(jcsnext[0]);
						endnext = Integer.parseInt(jcsnext[1]);
					}
					String addstr = "";
					if(startnext==start){
						addstr=arrayList1.get(nextitem).getKcmc()+"<br>"+arrayList1.get(nextitem).getCdmc()+"&nbsp;"+arrayList1.get(nextitem).getZcd();
					}
					//分割代码code end
					
					
					int len=end-start;
					String inserthtml = arrayList1.get(arrnum).getKcmc()+"<br>"+arrayList1.get(arrnum).getCdmc()+"&nbsp;"+arrayList1.get(arrnum).getZcd();
					if(startnext==start){
						//addstr=arrayList5.get(nextitem).getKcmc()+"<br>"+arrayList5.get(nextitem).getCdmc()+"&nbsp;"+arrayList5.get(nextitem).getZcd();
						inserthtml="<small><small>"+inserthtml+"<br>"+addstr+"</small></small>";
					}
					String html = "";
					switch(len){
					case 0:
						html = "<div class='item1'>"+inserthtml+"</div>";
						break;
					case 1:
						html = "<div class='item1-2'>"+inserthtml+"</div>";
						break;
					case 2:
						html = "<div class='item1-3'>"+inserthtml+"</div>";
						break;
					case 3:
						html = "<div class='item1-4'>"+inserthtml+"</div>";
						break;
				}
				
	
	%>
	<%=html %>
	<%
		starti=end+1;
		if(arrnum<arrayList1.size()){
			arrnum++;
		}
			}
	else{
	%>
	
	<div class='item1'></div>
	
	<%
		starti++;
	}
		}
	%>
	</div>
	
	
		<div class='itemparent'>
	<%
		///22222222222222
		arrnum=0;
		starti=1;
	%>
	
	<% 
	while(starti<11){
		String classnum="";
		int start=0;
		int end =15;
		if(arrnum<arrayList2.size()){
			classnum = arrayList2.get(arrnum).getJcs();
		}			
		String[] jcs = classnum.split("-");
		if(jcs.length>1){
			start = Integer.parseInt(jcs[0]);
			end = Integer.parseInt(jcs[1]);
		}
				
				if(start==starti){
					
					
					//避免单双周 start
					int nextitem = arrnum+1;
					String nextclassnum = "";
					int startnext=0,endnext=0;
					if(nextitem<arrayList2.size()){
						nextclassnum = arrayList2.get(nextitem).getJcs();
					}			
					String[] jcsnext = nextclassnum.split("-");
					if(jcsnext.length>1){
						startnext = Integer.parseInt(jcsnext[0]);
						endnext = Integer.parseInt(jcsnext[1]);
					}
					String addstr = "";
					if(startnext==start){
						addstr=arrayList2.get(nextitem).getKcmc()+"<br>"+arrayList2.get(nextitem).getCdmc()+"&nbsp;"+arrayList2.get(nextitem).getZcd();
					}
					//分割代码code end
					
					
					int len=end-start;
					String inserthtml = arrayList2.get(arrnum).getKcmc()+"<br>"+arrayList2.get(arrnum).getCdmc()+"&nbsp;"+arrayList2.get(arrnum).getZcd();
					if(startnext==start){
						//addstr=arrayList5.get(nextitem).getKcmc()+"<br>"+arrayList5.get(nextitem).getCdmc()+"&nbsp;"+arrayList5.get(nextitem).getZcd();
						inserthtml="<small><small>"+inserthtml+"<br>"+addstr+"</small></small>";
					}
					String html = "";
					switch(len){
					case 0:
						html = "<div class='item1'>"+inserthtml+"</div>";
						break;
					case 1:
						html = "<div class='item1-2'>"+inserthtml+"</div>";
						break;
					case 2:
						html = "<div class='item1-3'>"+inserthtml+"</div>";
						break;
					case 3:
						html = "<div class='item1-4'>"+inserthtml+"</div>";
						break;
				}
				
	
	%>
	<%=html %>
	<%
		starti=end+1;
		if(arrnum<arrayList2.size()){
		arrnum++;
		}
			}
	else{
	%>
	
	<div class='item1'></div>
				
	<%
		starti++;
	}
		}
	%>
	</div>
	
	
	
	
		<div class='itemparent'>
	<%
		///333333333333333
		arrnum=0;
		starti=1;
	%>
	
	<% 
	while(starti<11){
		String classnum="";
		int start=0;
		int end =15;
		if(arrnum<arrayList3.size()){
			classnum = arrayList3.get(arrnum).getJcs();
		}			
		String[] jcs = classnum.split("-");
		if(jcs.length>1){
			start = Integer.parseInt(jcs[0]);
			end = Integer.parseInt(jcs[1]);
		}
				
				if(start==starti){
					
					//避免单双周 start
					int nextitem = arrnum+1;
					String nextclassnum="";
					int startnext=0,endnext=0;
					if(nextitem<arrayList3.size()){
						nextclassnum = arrayList3.get(nextitem).getJcs();
					}			
					String[] jcsnext = nextclassnum.split("-");
					if(jcsnext.length>1){
						startnext = Integer.parseInt(jcsnext[0]);
						endnext = Integer.parseInt(jcsnext[1]);
					}
					String addstr = "";
					if(startnext==start){
						addstr=arrayList3.get(nextitem).getKcmc()+"<br>"+arrayList3.get(nextitem).getCdmc()+"&nbsp;"+arrayList3.get(nextitem).getZcd();
					}
					//分割代码code end
					
					
					int len=end-start;
					String inserthtml = arrayList3.get(arrnum).getKcmc()+"<br>"+arrayList3.get(arrnum).getCdmc()+"&nbsp;"+arrayList3.get(arrnum).getZcd();
					if(startnext==start){
						//addstr=arrayList5.get(nextitem).getKcmc()+"<br>"+arrayList5.get(nextitem).getCdmc()+"&nbsp;"+arrayList5.get(nextitem).getZcd();
						inserthtml="<small><small>"+inserthtml+"<br>"+addstr+"</small></small>";
					}
					String html = "";
					switch(len){
					case 0:
						html = "<div class='item1'>"+inserthtml+"</div>";
						break;
					case 1:
						html = "<div class='item1-2'>"+inserthtml+"</div>";
						break;
					case 2:
						html = "<div class='item1-3'>"+inserthtml+"</div>";
						break;
					case 3:
						html = "<div class='item1-4'>"+inserthtml+"</div>";
						break;
				}
				
	
	%>
	<%=html %>
	<%
		starti=end+1;
		if(arrnum<arrayList3.size()){
		arrnum++;
		}
			}
	else{
	%>
		
	<div class='item1'></div>
	
	<%
		starti++;
	}
		}
	%>
	</div>
	
	
	
		<div class='itemparent'>
	<%
		///444444444444444
		arrnum=0;
		starti=1;
	%>
	
	<% 
	while(starti<11){
		String classnum="";
		int start=0;
		int end =15;
		if(arrnum<arrayList4.size()){
			classnum = arrayList4.get(arrnum).getJcs();
		}			
		String[] jcs = classnum.split("-");
		if(jcs.length>1){
			start = Integer.parseInt(jcs[0]);
			end = Integer.parseInt(jcs[1]);
		}
				
				if(start==starti){
					//避免单双周 start
					int nextitem = arrnum+1;
					String nextclassnum="";
					int startnext=0,endnext=0;
					if(nextitem<arrayList4.size()){
						nextclassnum = arrayList4.get(nextitem).getJcs();
					}			
					String[] jcsnext = nextclassnum.split("-");
					if(jcsnext.length>1){
						startnext = Integer.parseInt(jcsnext[0]);
						endnext = Integer.parseInt(jcsnext[1]);
					}
					String addstr = "";
					if(startnext==start){
						addstr=arrayList4.get(nextitem).getKcmc()+"<br>"+arrayList4.get(nextitem).getCdmc()+"&nbsp;"+arrayList4.get(nextitem).getZcd();
					}
					//分割代码code end
					int len=end-start;
					String inserthtml = arrayList4.get(arrnum).getKcmc()+"<br>"+arrayList4.get(arrnum).getCdmc()+"&nbsp;"+arrayList4.get(arrnum).getZcd();
					if(startnext==start){
						//addstr=arrayList5.get(nextitem).getKcmc()+"<br>"+arrayList5.get(nextitem).getCdmc()+"&nbsp;"+arrayList5.get(nextitem).getZcd();
						inserthtml="<small><small>"+inserthtml+"<br>"+addstr+"</small></small>";
					}
					String html = "";
					switch(len){
					case 0:
						html = "<div class='item1'>"+inserthtml+"</div>";
						break;
					case 1:
						html = "<div class='item1-2'>"+inserthtml+"</div>";
						break;
					case 2:
						html = "<div class='item1-3'>"+inserthtml+"</div>";
						break;
					case 3:
						html = "<div class='item1-4'>"+inserthtml+"</div>";
						break;
				}
				
	
	%>
	<%=html %>
	<%
		starti=end+1;
		if(arrnum<arrayList4.size()){
		arrnum++;
		}
			}
	else{
	%>
		
	<div class='item1'></div>
	
	<%
		starti++;
	}
		}
	%>
	</div>
	
	
	
		<div class='itemparent'>
	<%
		///555555555555
		arrnum=0;
		starti=1;
	%>
	
	<% 
	while(starti<11){
		String classnum="";
		int start=0;
		int end =15;
		if(arrnum<arrayList5.size()){
			classnum = arrayList5.get(arrnum).getJcs();
		}			
		String[] jcs = classnum.split("-");
		if(jcs.length>1){
			start = Integer.parseInt(jcs[0]);
			end = Integer.parseInt(jcs[1]);
		}
				
				if(start==starti){
					
					
					//避免单双周 start
					int nextitem = arrnum+1;
					String nextclassnum = "";
					int startnext=0,endnext=0;
					if(nextitem<arrayList5.size()){
						nextclassnum = arrayList5.get(nextitem).getJcs();
					}			
					String[] jcsnext = nextclassnum.split("-");
					if(jcsnext.length>1){
						startnext = Integer.parseInt(jcsnext[0]);
						endnext = Integer.parseInt(jcsnext[1]);
					}
					String addstr = "";
					if(startnext==start){
						addstr=arrayList5.get(nextitem).getKcmc()+"<br>"+arrayList5.get(nextitem).getCdmc()+"&nbsp;"+arrayList5.get(nextitem).getZcd();
					}
					//分割代码code end
					
					int len=end-start;
					String inserthtml = arrayList5.get(arrnum).getKcmc()+"<br>"+arrayList5.get(arrnum).getCdmc()+"&nbsp;"+arrayList5.get(arrnum).getZcd();
					
					if(startnext==start){
						//addstr=arrayList5.get(nextitem).getKcmc()+"<br>"+arrayList5.get(nextitem).getCdmc()+"&nbsp;"+arrayList5.get(nextitem).getZcd();
						inserthtml="<small><small>"+inserthtml+"<br>"+addstr+"</small></small>";
					}
					
					String html = "";
					switch(len){
					case 0:
						html = "<div class='item1'>"+inserthtml+"</div>";
						break;
					case 1:
						html = "<div class='item1-2'>"+inserthtml+"</div>";
						break;
					case 2:
						html = "<div class='item1-3'>"+inserthtml+"</div>";
						break;
					case 3:
						html = "<div class='item1-4'>"+inserthtml+"</div>";
						break;
				}
				
	
	%>
	<%=html %>
	<%
		starti=end+1;
		if(arrnum<arrayList5.size()){
		arrnum++;
		}
			}
	else{
	%>
	
	<div class='item1'></div>
	
	<%
		starti++;
	}
		}
	%>
	</div>
			


</body>
</html>