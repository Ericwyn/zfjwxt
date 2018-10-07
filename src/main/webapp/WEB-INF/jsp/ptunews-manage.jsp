<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>莆院新闻后台</title>
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
    <div class="navbar navbar-fixed-top" style="">
      <div class="navbar-inner"  style="">
        <div class="container-fluid"   style="width:100%;">
          <a class="btn btn-navbar" >
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">莆院新闻后台</a>
          
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
              <li class="nav-header"><i class="icon-wrench"></i> 管理</li>
	              <li><a href="reader.html">用户列表</a></li>
	              <li ><a href="warmtell">早安天气</a></li>
	              <li class="active"><a href="#">莆田学院新闻</a></li>
              <li class="nav-header"><i class="icon-signal"></i> 统计</li>
	              <li ><a href="stats.html">访问页面</a></li>
              <li class="nav-header"><i class="icon-user"></i> 功能</li>
              	  <li><a href="stats.html">添加管理员</a></li>
              	  <li><a href="ptunews/getnews">自动获取莆田学院新闻</a></li>	
            	
            </ul>
          </div>
        </div>
       

 

	
		
  		<div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>新闻 <small>所有新闻</small></h1>
				<a href="ptunews/addnews">添加新闻</a>
			</div>
			<table class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>标题</th>
						<th>原文链接</th>
						<th>类型</th>
					</tr>
				</thead>
				<tbody>
				
				
				<c:forEach items="${result}" var="item" >
   					
   					
   					
   					
   					<tr>
					<td>${item.title}</td>
					<td>${item.url}</td>
					<td>${item.type}</td>
					
					<td>
					
						<div >
						 	<form action="ptunews/news" method="get">
                            	<button name="uuid" type="submit"  value="${item.uuid}">查看</button>
                        	</form>
						</div>
					</td>
					
					<td>
					
						<div >
						 	<form action="ptunews/del" method="post">
                            	<button name="uuid" type="submit"  value="${item.uuid}">删除</button>
                        	</form>
						</div>
					</td>
				</tr>
   					
   					
   					
   					
   					
   					
   					
   					
				</c:forEach>
				</tbody>
			</table>
			
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