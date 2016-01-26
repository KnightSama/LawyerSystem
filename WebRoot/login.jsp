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
<title>��ʦ�й���ϵͳ</title>
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
				$('.tip').html('�û��������ڣ�')
			})
			$(function() {
				$('body').alert({
					type : 'danger',
					title : 'ϵͳ��ʾ', //����
					content : '��Ǹ���û��������ڣ�', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			})
		</script>
	</s:if>
	<s:if test="#result =='fail'">
		<script type="text/javascript">
			$(function() {
				$('.tip').html('�������')
			})
			$(function() {
				$('body').alert({
					type : 'danger',
					title : 'ϵͳ��ʾ', //����
					content : '��Ǹ���������', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			})
		</script>
	</s:if>
</s:if>

<script>
	var code; //��ȫ�ֶ�����֤�� 
	//������֤��
	window.onload = function createCode() {
		code = "";
		var codeLength = 4;//��֤��ĳ���
		var checkCode = document.getElementById("code");
		var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
				'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//�����
		for ( var i = 0; i < codeLength; i++) {//ѭ������
			var index = Math.floor(Math.random() * 36);//ȡ���������������0~35��
			code += random[index];//��������ȡ��������ӵ�code��
		}
		checkCode.value = code;//��codeֵ������֤��
	}

	function flushCode() {
		code = "";
		var codeLength = 4;//��֤��ĳ���
		var checkCode = document.getElementById("code");
		var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
				'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//�����
		for ( var i = 0; i < codeLength; i++) {//ѭ������
			var index = Math.floor(Math.random() * 36);//ȡ���������������0~35��
			code += random[index];//��������ȡ��������ӵ�code��
		}
		checkCode.value = code;//��codeֵ������֤��
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
						$('.tip').html('�û��������벻��Ϊ�գ�')
					} else if ($('#input').val() == "") {
						$('.tip').html('��֤�벻��Ϊ�գ�')
					} else {
						var inputCode = document.getElementById("input").value
								.toUpperCase(); //ȡ���������֤�벢ת��Ϊ��д
						if (inputCode != code) { //���������֤�����������֤�벻һ��ʱ
						$('.tip').html('��֤�����')
							flushCode();//ˢ����֤��
							document.getElementById("input").value = "";
						}//����ı���
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
			<h1>��ʦ�й���ϵͳ</h1>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;�ţ�<input type="text" id="username"
					name="username" /> </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;�룺<input type="password"
					id="password" name="password" /> </label>
			</p>
			<p class="pcode">
				<label>��֤�룺<input type="text" id="input" maxlength="5"
					class="code" /><a>&nbsp;&nbsp;&nbsp;</a><input type="button" id="code"
					/><a>&nbsp;&nbsp;&nbsp;&nbsp;</a><a onclick="flushCode()" >��һ��</a></label>
			</p>
			<p class="tip">&nbsp;</p>
			<hr />
			<input type="button" value=" �� ¼ "
				class="btn btn-primary btn-large login" id="login" />
			&nbsp;&nbsp;&nbsp;<input type="button" value=" ȡ �� "
				class="btn btn-large" id="cancel" />
		</div>
	</form>
</body>
</html>