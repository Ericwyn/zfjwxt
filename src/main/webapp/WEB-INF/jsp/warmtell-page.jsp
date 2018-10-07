<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台</title>
	<link href="https://yss-1253784481.cossh.myqcloud.com/css/bootstrap.css" rel="stylesheet">
	<link href="https://yss-1253784481.cossh.myqcloud.com/css/site.css" rel="stylesheet">
    <link href="https://yss-1253784481.cossh.myqcloud.com/css/bootstrap-responsive.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <style>
    	a
    	{
    	 color:#4878ff;
 
    	}
    </style>
</head>
<body>
    <div class="navbar navbar-fixed-top" style="background-color:#fff;">
      <div class="navbar-inner"  style="background-color:#fff;">
        <div class="container-fluid"   style="background-color:#4878ff;width:100%;">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">后台管理</a>
          
          <div class="nav-collapse">
            <ul class="nav">
			<li><a href="https://m.zhangtalent.cn">首页</a></li>
              
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header"><i></i> 管理</li>
	              <li><a href="reader.html">用户列表</a></li>
	              <li><a href="warmtell">早安天气</a></li>
	              <li><a href="borrow.html">...</a></li>
              <li class="nav-header"><i></i> 统计</li>
	              <li ><a href="stats.html">访问页面</a></li>
              <li class="nav-header"><i></i> 资料</li>
              	  <li><a href="stats.html">添加管理员</a></li>	
            	
            </ul>
          </div>
        </div>
       <div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>新建用户 <small>添加用户</small></h1>
			</div>
			<form class="form-horizontal" action="add" method="post">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="name">名字</label>
						<div class="controls">
							<input name="name" type="text" class="input-xlarge" id="name"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="phonenumber">电话号码</label>
						<div class="controls">
							<input name="phonenumber" type="text" class="input-xlarge" id="phonenumber"/>
						</div>
					</div>
                    <div class="control-group">
						<label class="control-label" for="star">星座</label>
						<div class="controls">
							<select   class="input-xlarge"  name="star" id="star">
							<option class="input-xlarge" value="aries">白羊座</option>
							<option class="input-xlarge" value="taurus">金牛座</option>
							<option class="input-xlarge" value="gemini">双子座</option>
							<option class="input-xlarge" value="cancer">巨蟹座</option>
							<option class="input-xlarge" value="leo">狮子座</option>
							<option class="input-xlarge" value="virgo">处女座</option>
							<option class="input-xlarge" value="libra">天秤座</option>
							<option class="input-xlarge" value="scorpio">天蝎座</option>
							<option class="input-xlarge" value="sagittarius">射手座</option>
							<option class="input-xlarge" value="capricorn">摩羯座</option>
							<option class="input-xlarge" value="aquarius">水瓶座</option>
							<option class="input-xlarge" value="pisces">双鱼座</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="city">城市</label>
						<div class="controls">
						<select   class="input-xlarge"  name="city" id="city">
							<option class="input-xlarge" value="101230407">莆田-城厢</option>
							<option class="input-xlarge" value="101210303">杭州嘉兴-海宁</option>
							
							<option class="input-xlarge" value="101240101">南昌</option>
							<option class="input-xlarge" value="04">没有你要的城市，请联张天才添加</option>
						</select>
						</div>
					</div>
                    <div class="control-group">
						<label class="control-label" for="goodword">自定义语句</label>
				
						<div class="controls">
							<input name="goodword" type="text" class="input-xlarge" id="goodword" value="今天天气{1}， 今日适宜{2}, 今日鼓励句{3}"/>
							<h3>{}内为可自定义语句</h3>
						</div>
						
					</div>
					<div class="form-actions">
						<input type="submit" class="btn btn-success btn-large" value="确定" /> <a class="btn" href="manage">取消</a>
					</div>					
				</fieldset>
			</form>
		  </div>
        </div>

      </div>


  

    </div>
</body>

	<script src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.js"></script>
	<script src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.flot.js"></script>
	<script src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.flot.resize.js"></script>
	<script src="https://yss-1253784481.cossh.myqcloud.com/js/bootstrap.min.js"></script>

</html>