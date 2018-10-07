<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>莆院新闻-展示</title>
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
         
          <a class="brand" href="#">莆院新闻</a>
          <div style="height:100%;position:relative;bottom:0;"><p>@张天才科技<p></div>
          
          
        </div>
      </div>
    </div>
	<h3>${title}</h3>
    <p>${content}</p>
  </body>

	<script src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.js"></script>
	<script src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.flot.js"></script>
	<script src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.flot.resize.js"></script>
	<script src="https://yss-1253784481.cossh.myqcloud.com/js/bootstrap.min.js"></script>

</html>