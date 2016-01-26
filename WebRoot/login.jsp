<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>律师行管理系统</title>
<link rel="stylesheet" type="text/css" href="Styles/base.css" />
<link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
<link rel="stylesheet" type="text/css" href="Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="Styles/chur.css" />
<script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript" src="Scripts/jquery.spritely-0.6.js"></script>
<script type="text/javascript" src="Scripts/chur.min.js"></script>
<script type="text/javascript" src="Scripts/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript" src="Scripts/chur-alert.1.0.js"></script>
<link rel="stylesheet" type="text/css" href="Styles/login.css" />
		<style type="text/css">
			#code
			{
				font-family:Arial;
				font-style:italic;
				font-weight:bold;
				border:0;
				letter-spacing:2px;
				font-size:18px;
				color:blue;
			}
		</style>
<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />
	<s:if test="#result =='nouser'">
		<script type="text/javascript">
			$(function() {
				$('.tip').html('用户名不存在！')
			})
			$(function() {
				$('body').alert({
					type : 'danger',
					title : '系统提示', //标题
					content : '抱歉，用户名不存在！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		</script>
	</s:if>
	<s:if test="#result =='fail'">
		<script type="text/javascript">
			$(function() {
				$('.tip').html('密码错误！')
			})
			$(function() {
				$('body').alert({
					type : 'danger',
					title : '系统提示', //标题
					content : '抱歉，密码错误！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		</script>
	</s:if>
</s:if>

<script>
	var code; //在全局定义验证码 
	//产生验证码
	window.onload = function createCode() {
		code = "";
		var codeLength = 4;//验证码的长度
		var checkCode = document.getElementById("code");
		var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
				'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数
		for ( var i = 0; i < codeLength; i++) {//循环操作
			var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35）
			code += random[index];//根据索引取得随机数加到code上
		}
		checkCode.value = code;//把code值赋给验证码
	}

	function flushCode() {
		code = "";
		var codeLength = 4;//验证码的长度
		var checkCode = document.getElementById("code");
		var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
				'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数
		for ( var i = 0; i < codeLength; i++) {//循环操作
			var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35）
			code += random[index];//根据索引取得随机数加到code上
		}
		checkCode.value = code;//把code值赋给验证码
	}


	$(function() {
		$('#clouds').pan({
			fps : 20,
			speed : 0.7,
			dir : 'right',
			depth : 10
		});
		$('#login').click(
				function() {
					if ($('#username').val() == ""
							|| $('#password').val() == "") {
						$('.tip').html('用户名或密码不可为空！')
					} else if ($('#input').val() == "") {
						$('.tip').html('验证码不可为空！')
					} else {
						var inputCode = document.getElementById("input").value
								.toUpperCase(); //取得输入的验证码并转化为大写
						if (inputCode != code) { //若输入的验证码与产生的验证码不一致时
						$('.tip').html('验证码错误！')
							flushCode();//刷新验证码
							document.getElementById("input").value = "";
						}//清空文本框
						else {
							$("form").submit();
						}
					}
				})
		$('#cancel').click(function() {
			$('#username').val('');
			$('#password').val('');
		})
	})
</script>
</head>
<body>
	<div id="clouds" class="stage"></div>
	<div class="loginmain"></div>
	<form action="login" method="post">
		<div class="row-fluid">
			<h1>律师行管理系统</h1>
			<p>
				<label>帐&nbsp;&nbsp;&nbsp;号：<input type="text" id="username"
					name="username" /> </label>
			</p>
			<p>
				<label>密&nbsp;&nbsp;&nbsp;码：<input type="password"
					id="password" name="password" /> </label>
			</p>
			<p class="pcode">
				<label>验证码：<input type="text" id="input" maxlength="5"
					class="code" /><a>&nbsp;&nbsp;&nbsp;</a><input type="button" id="code"
					/><a>&nbsp;&nbsp;&nbsp;&nbsp;</a><a onclick="flushCode()" >换一张</a></label>
			</p>
			<p class="tip">&nbsp;</p>
			<hr />
			<input type="button" value=" 登 录 "
				class="btn btn-primary btn-large login" id="login" />
			&nbsp;&nbsp;&nbsp;<input type="button" value=" 取 消 "
				class="btn btn-large" id="cancel" />
		</div>
	</form>
</body>
</html>