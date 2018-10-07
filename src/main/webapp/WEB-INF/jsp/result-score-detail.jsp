<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>分数明细</title>

<style>

hmtl,body{
		background:#fff;
		width:100%;
		height:100%;
		text-align:center;
		margin:0 auto;
	}
	table{
		height:100%;
		width:100%;
	}
	div{
		color:#5a5a5a;
		text-align:left;
		margin-left:1%;
		display:block;
		width:98%;
		box-shadow:0px 0px 5px #ddd;
	}
	p{
		display:block;
		height:0px;
	}
	.brand
    	{
    	 color:#68c7f9;
 		 text-decoration:none;
    	}
    	a
    	{
    	 color:#000;
 		 text-decoration:none;
    	}
</style>

</head>
<body>

    

         
          
          <div style="width:100%;position:relative;bottom:0;padding-top:15px;padding-bottom:15px;"><a class="brand" href="#">成绩查询---明细</a><br><small style="color:#ddd;">张天才科技</small></div>
          

    <div style="width:98%;height:1px;background:#ddd;"></div>
	<br>

				${detail}
			
					
</body>

</html>


