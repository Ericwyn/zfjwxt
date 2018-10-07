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


<script type="text/javascript">
	//浏览器版本验证
	var broswer = broswer();
	if(broswer.msie==true||broswer.safari==true||broswer.mozilla==true||broswer.chrome==true){
		if(broswer.msie==true&&broswer.version<9){
		   window.location.href = _path+"/xtgl/init_cxBrowser.html";
		}
	}else{
		 window.location.href = _path+"/xtgl/init_cxBrowser.html";
	}
</script>
<script type="text/javascript">
var _path 				= "/jwglxt";
var _systemPath 		= "/jwglxt";
var _stylePath 			= "http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2";
var _reportPath 		= "http://172.16.1.203/WebReport";
var _refreshInterval	= "10";
var _localeKey 			= "zh_CN";
</script>
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


<!--业务框架前端脚本国际化库-->
<script type="text/javascript" src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/js/zftal/lang/jquery.zftal_zh_CN-min.js"></script>


	
	





<script type="text/javascript">
	//\u6d4f\u89c8\u5668\u7248\u672c\u9a8c\u8bc1
	var broswer = broswer();
	if(broswer.msie==true||broswer.safari==true||broswer.mozilla==true||broswer.chrome==true){
		if(broswer.msie==true&&broswer.version<9){
		   window.location.href = _path+"/xtgl/init_cxBrowser.html";
		}
	}else{
		 window.location.href = _path+"/xtgl/init_cxBrowser.html";
	}
</script>
	

</head>
<body class="body-container">
	<!-- 放置页面显示内容 -->
	

<!-- top -->
<div class="navbar navbar-default navbar-static-top top1">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand logo_2" href="#"><img src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/images/logo_jw_w.png" style="margin-top:-3px">
			<span id="xtmc">教学综合信息服务平台</span>
			</a>
		</div>
	</div>
	
</div>



<!-- 主体 -->

			
			
			<div class="index_wdyy">
				<h3><span>我的应用</span></h3>
				<ul class="list-unstyled mCustomScrollbar _mCS_1 mCS_no_scrollbar" id="index_wdyy" style="height: 100%;">
					
<li class="col-md-4 col-sm-4 col-xs-6"><a  href="study" target="_blank" title="平时分"><img src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/images/jw_ico/ico_but26.png" alt="平时分"><h5>平时分</h5></a></li>
<li class="col-md-4 col-sm-4 col-xs-6"><a  href="exam" target="_blank" title="考试信息查询"><img src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/images/jw_ico/ico_but26.png" alt="考试信息查询"><h5>考试信息查询</h5></a></li>					
<li style="display:none;" class="col-md-4 col-sm-4 col-xs-6"><a  href="schedule" target="_blank" title="学生学业情况查询"><img src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/images/jw_ico/ico_but28.png" alt="学生学业情况查询"><h5>学生学业情况查询</h5></a></li>
<li class="col-md-4 col-sm-4 col-xs-6"><a  href="myclass" target="_blank" title="我的课表"><img src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/images/jw_ico/ico_but13.png" alt="我的课表"><h5>我的课表</h5></a></li>
<li style="display:none;" class="col-md-4 col-sm-4 col-xs-6"><a  href="schoolclass" target="_blank" title="全校课表"><img src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/images/jw_ico/ico_but14.png" alt="全校课表"><h5>全校课表</h5></a></li>
<li class="col-md-4 col-sm-4 col-xs-6"><a  href="rank" target="_blank" title="排名"><img src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/images/jw_ico/ico_but41.png" alt="排名"><h5>排名</h5></a></li>
<li class="col-md-4 col-sm-4 col-xs-6"><a  href="score" target="_blank" title="学生成绩查询"><img src="http://ptu-1253784481.cosgz.myqcloud.com/zftal-ui-v5-1.0.2/assets/images/jw_ico/ico_but31.png" alt="学生成绩查询"><h5>学生成绩查询</h5></a></li></ul>
				
			</div>
			</body>
</html>