<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"  content="initial-scale=1;width=device-width;"> 
<script type="text/javascript" src="https://yss-1253784481.cossh.myqcloud.com/js/wangEditor.min.js"></script>
<title>欢迎投稿</title>
    
   
    <style>
    html,body{
		width:100%;
		height:100%;
		text-align:left;
		margin:0 auto;
	}
	
	.edita{
		margin-left:5px;
		padding-top:5px;
		padding-left:10px;
		border-radius:3px;
		color:#fff;
		background:#56FF91;
		width:60px;
		height:35px;
		display:inline-block;
		text-decoration:none;
	}
	.adda{	
		text-align:center;
		margin:15px;
		border-radius:3px;
		color:#fff;
		background:#56FF91;
		width:125px;
		height:35px;
		display:inline-block;
		text-decoration:none;
	}
	
   .textinput:hover{
    	color:#fff;
    	background:#4878ff;
 	    font-size:11pt;	
		margin-top:20px;
		height:35px;
		width:90%;
		border:1px solid #4878ff;
	}
	.textinput{
		color:#000;
		background:#FFF;
		font-size:11pt;
		margin-top:20px;
		height:35px;
		width:90%;
		border:1px solid #154444;
	}
	.textinput:focus{
		color:#fff;
		font-size:11pt;
		margin-top:20px;
		height:35px;
		width:90%;
		border:1px solid #154444;
	}
	.texttextarea{
 	   	font-size:11pt;	
		margin-top:10px;
		height:35px;
		width:95%;
		
	}
	.texttextarea:hover{
		font-size:11pt;
		margin-top:10px;
		height:35px;
		width:95%;
		
	}
	.texttextarea:focus{
		font-size:11pt;
		margin-top:10px;
		height:35px;
		width:95%;
	
	}
	.imginput{
		opacity:0;
		position:absolute;
		right:0;
		top:0;
		margin:5px;
		height:100px;
		width:100px;
		border:0px solid #4878ff;
	}
	.imginput:hover{
		opacity:0;
		position:absolute;
		right:0;
		bottom:0;
		margin:5px;
		height:100px;
		width:100px;
		border:0px solid #4878ff;
	}
	.imginput:focus{
		opacity:0;
		position:absolute;
		right:0;
		top:0;
		margin:5px;
		height:100px;
		width:100px;
		border:0px solid #4878ff;
	}
	.hiddenimgspan{
		width:100px;
		position:relative;
		overflow:hidden;
		display: inline-block;
		
	}
	 .toolbar {
	 		
            border: 1px solid #ccc;
        }
    .text {overflow:scroll;
            border: 1px solid #ccc;
            height: 400px;
        }
				input{
			color:68c7f9;
		    height:35px;
			width:80%;
			margin-top:3%;
			background-color:transparent;
			border-width:0px;
			color:68c7f9;
			
		}
		.edita{
			padding-top:3px;
			text-decoration:none;
			color:#56FF91;
			font-family: pictos;  
		    height:25px;
			width:15%;
			display:inline-block;
			box-shadow:0px 0px 50px #ddd;
			border:1px solid #56FF91;
			border-radius:5px;
		
	}
    </style>
</head>
<body>
<h3 style="color:#4878ff;">欢迎投稿</h3>
		<form id="form" style="margin-top:15px;" enctype="multipart/form-data" method="post" action="addnews">
		<input   name="title" placeholder="标题"/>
		 <div style="width:75%;height:1px;background:#ddd;"></div>
		<br>
		
						
							<input placeholder="上传者(或学号)"   name="type" id="type"/>
						 <div style="width:75%;height:1px;background:#ddd;"></div>
						</div>
		<input id="content" type="hidden"   name="content" placeholder="内容"/>
		<br>
		
		<div id="div1" class="toolbar">
    	</div>
    	<div id="richhtml" class="text"> <!--可使用 min-height 实现编辑区域自动增加高度-->
    
    	</div>
		
		
		</form>
		<div style="z-index:99999;position:fixed;bottom:0px;width:100%;">
			<button style="width:100%;background:#56FF91;border:0px;color:#fff;height:50px;font-size:13pt;"  type="button" id="submit">提交</button>
		</div>

    <script type="text/javascript">
    		var E = window.wangEditor
    
        var editor = new E('#richhtml')  // 两个参数也可以传入 elem 对象，class 选择器
        editor.customConfig.debug = 0
        editor.customConfig.uploadFileName = 'img'
        editor.customConfig.uploadImgMaxSize = 6 * 1024 * 1024
        editor.customConfig.uploadImgServer = '/act/upload'
        editor.customConfig.customAlert = function (info) {
            // info 是需要提示的内容
            alert('提示：' + info)
        }
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.create()
        document.getElementById('submit').onclick=function(){
        	 document.getElementById('content').value = editor.txt.html()
        	 document.getElementById('form').submit()
		}

        
    </script>
</body>
</html>