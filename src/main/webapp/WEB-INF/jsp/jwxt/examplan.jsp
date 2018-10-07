<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>张天才科技</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Copyright" content="zfsoft">	
<link rel="icon" href="/jwglxt/logo/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/jwglxt/logo/favicon.ico" type="image/x-icon">
<style type="text/css">	
	.active{font-weight: bolder;}
	#navbar-tabs li{ margin-top: 2px;}
	#navbar-tabs li a{ border-top: 2px solid transparent;}
	#navbar-tabs li.active a{border-top: 2px solid #0770cd;}
</style>	
<!--jQuery核心框架库 -->
<script type="text/javascript" src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/js/other_jquery/jquery-1.12.4.min.js"></script>


<!--
jquery.ui 需要在bootstrap之前加载，解决冲突问题
http://blog.csdn.net/remote_roamer/article/details/14105999
-->

<!--Bootstrap布局框架-->
<link rel="stylesheet" type="text/css" href="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/plugins/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/css/zftal-ui.css">
<script type="text/javascript" src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/plugins/bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
<!--jQuery.chosen美化插件-->
<link rel="stylesheet" type="text/css" href="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/plugins/chosen/css/chosen-min.css">
<script type="text/javascript" src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/plugins/chosen/jquery.choosen.concat-min.js" charset="utf-8"></script>
<script type="text/javascript" src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/plugins/chosen/lang/zh_CN-min.js" charset="utf-8"></script>
<script type="text/javascript" src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/js/utils/jquery.utils.pinyin.min.js" charset="utf-8"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/js/html5shiv.min.js" charset="utf-8"></script>
<script type="text/javascript" src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/js/respond.min.js" charset="utf-8"></script>
<![endif]-->



	
	




	


<!--业务模块的properties初始化-->
<!--国际化js库 -->


</head>
<body>
<input type="hidden" id="pkey" name="pkey" value="">
	<!-- 头部 开始 -->
	<header class="navbar-inverse top2">
		<div class="container" id="navbar_container">
					<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
					<span class="sr-only"> 考场信息查询</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a href="#" id="topButton" class="navbar-brand" onclick="onClickMenu('/cjcx/cjcx_cxDgXscj.html','N305005')">
					
				</a>
				<script type="text/javascript">
					
				</script>
			</div>
		</div>
<!-- navbar-end  -->
		</div>
	</header>
	
	<!--头部 结束 -->
	<div style="width: 100%; padding: 0px; margin: 0px;" id="bodyContainer">
		<!-- requestMap中的参数为系统级别控制参数，请勿删除 -->
		
		<div class="container container-func sl_all_bg" id="yhgnPage" style="min-height: 585px;">
			<div id="innerContainer">
				<!-- 放置页面显示内容 -->
				
<!-- 功能操作 -->
<div class="row sl_add_btn">
	<div class="col-sm-12">
		<!-- 加载当前菜单栏目下操作N305005 -->
		<div class="btn-toolbar" role="toolbar" style="float:right;"><div class="btn-group" id="but_ancd"></div> </div>
		<!-- 加载当前菜单栏目下操作 -->
	</div>
</div> 
<!-- form -start  -->
        
<form id="searchForm" name="searchForm"  action="exam" method="get" class="form-horizontal sl_all_form" novalidate="novalidate">
<input type="hidden" name="jsxx" value="xs" id="jsxx">
<input type="hidden" id="sxxdm" name="sxxdm" value="11498">
<div class="row">		
  <div class="col-md-3 col-sm-6">
    <div class="form-group">
      <label for="" class="col-sm-4 control-label">学年</label>
      <div class="col-sm-8">
         <select name="year" id="year" class="form-control chosen-select" style="">
    
    <option value="2023">2023-2024</option>
    <option value="2022">2022-2023</option>
    <option value="2021">2021-2022</option>
    <option value="2020">2020-2021</option>
    <option value="2019">2019-2020</option>
    <option value="2018">2018-2019</option>
    <option value="2017">2017-2018</option>
    <option value="2016">2016-2017</option>
    <option value="2015">2015-2016</option>
    <option value="2014">2014-2015</option>
    <option value="2013">2013-2014</option>
    <option value="2012">2012-2013</option>
    <option value="2011">2011-2012</option>
    <option value="2010">2010-2011</option>
    <option value="2009">2009-2010</option>
    <option value="2008">2008-2009</option>
    <option value="2007">2007-2008</option>
    <option value="2006">2006-2007</option>
    <option value="2005">2005-2006</option>
    <option value="2004">2004-2005</option>
    <option value="2003">2003-2004</option>
    <option value="2002">2002-2003</option>
    <option value="2001">2001-2002</option>


</select>
<script type="text/javascript">
//点击按钮，让第二项选中
    //document.getElementById('').onclick=function(){
        document.getElementById('year').value="${year}";
   
</script>
    </div>
  </div>
  </div>
 <div class="col-md-3 col-sm-6">
    <div class="form-group">
      <label for="" class="col-sm-4 control-label">学期</label>
      <div class="col-sm-8">
        <select name="term" id="term" class="form-control chosen-select" style="">
    
    <option value="3" >1</option>
    <option value="12">2</option>
    <option value="16">3</option>


</select>
<script type="text/javascript">
//点击按钮，让第二项选中
    //document.getElementById('').onclick=function(){
        document.getElementById('term').value="${term}";
   
</script>
    </div>
  </div>
  	  
</div>
<div class="row sl_aff_btn" id="searchBox">
	  
		
		<div class="col-md-4 col-sm-5">
			<button type="submit" class="btn btn-primary btn-sm" id="search_go"> 查 询 </button>
		</div>
   
   
</div> 
</form>



<!-- form -end  -->
<!-- btn-start  -->

<!-- btn-end  -->
<!-- table-start  -->

	${result}
	

<!-- table-end  -->


			</div>
		</div>
	</div>
	<!-- footer -->
	

<!-- footer --> 
<div id="footerID" class="footer">
	<p>版权所有? Copyright 1999-2017  张天才科技　　中国.福建</p>
</div>
<!-- footer-end -->
	<!-- footer-end -->
	</body>
</html>