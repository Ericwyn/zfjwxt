<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"  content="initial-scale=1;width=device-width;"> 
<script type="text/javascript" src="http://yss-1253784481.cossh.myqcloud.com/js/wangEditor.min.js"></script>
<title>添加新闻</title>
    
   
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
	 		overflow:scroll;
            border: 1px solid #ccc;
        }
    .text {
            border: 1px solid #ccc;
            height: 400px;
        }
    </style>
</head>
<body>
<h3 style="color:#4878ff;">添加新闻</h3>
		<form id="form" style="margin-top:15px;" enctype="multipart/form-data" method="post" action="addnews">
		<input class="texttextarea"  name="title" placeholder="标题"/>
		<br>
		<label class="control-label" for="type">类型</label>
						<div class="controls">
							<input   class="input-xlarge"  name="type" id="type"/>
						</div>
		<input id="content" type="hidden" class="texttextarea"  name="content" placeholder="内容"/>
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
    
        var editor = new E('#div1', '#richhtml')  // 两个参数也可以传入 elem 对象，class 选择器
  
        editor.customConfig.debug = 1
        editor.customConfig.uploadFileName = 'img'
        editor.customConfig.uploadImgServer = '/admin/upload'
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.create()
        document.getElementById('submit').onclick=function(){
        	 document.getElementById('content').value = editor.txt.html()
        	 document.getElementById('form').submit()
		}

        
    </script>
</body>
</html>
</html>