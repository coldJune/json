<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>json|struts2+ajax返回数据</title>
</head>
<body>
	<div id="div_json">
		<h5>录入数据</h5>
		<br>
		<form action="#" method="post">
			<label for="name">姓名：</label><input type="text" name="name">
			<label for="age">年龄：</label><input type="text" name="age">
			<label for="position">职务：</label><input type="text" name="position">
			<input type="button" onclick="btn()" value="提交结果">
		</form>
		
		<br>
		<h5>显示结果</h5>
		<br>
		<ul>
			<li>姓名：<span id="s_name"></span></li>
			<li>年龄：<span id="s_age"></span></li>
			<li>职务：<span id="s_position"></span></li>
		</ul>
	</div>
	
	<script type="text/javascript" src="webjars/jquery/2.1.4/jquery.js"></script>
	<script type="text/javascript">
		function btn(){
			//var $btn=$("input.btn");//获取按钮元素
			//给按钮绑定点击事件
		//	$btn.bind("click",function(){
				$.ajax({
					type:"post",
					url:"executeAjaxJsonAction",//需要用来处理ajax请求的action，executeAjax为处理的方法，JsonAction为action名
					data:{
						name:$("input[name=name]").val(),
						age:$("input[name=age]").val(),
						position:$("input[name=position]").val()
						},
					dataType:"json",//设置需要返回的数据类型
					success:function(data){
						alert(data)
						var d=eval("("+data+")");//将数据转换为json类型
						
						$("#s_name").text(""+d.name+"");
						$("#s_age").text(""+d.age+"");
						$("#s_position").text(""+d.position+"");
						},
					error:function(){
						alert("系统异常，请稍后重试");
						}
					});
				//});
		}
		//$(document).ready(function(){
			//btn();
		//	});
	</script>
</body>
</html>