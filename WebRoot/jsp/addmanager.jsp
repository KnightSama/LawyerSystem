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
<title></title>
<link rel="stylesheet" type="text/css" href="../Styles/formui.css" />
<link rel="stylesheet" type="text/css" href="../Styles/base.css" />
<link rel="stylesheet" type="text/css" href="../Styles/admin-all.css" />
<link rel="stylesheet" type="text/css" href="../Styles/chur.css" />
<script type="text/javascript" src="../Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="../Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="../Scripts/tb.js"></script>
<script type="text/javascript" src="../Scripts/acc.js"></script>
<script type="text/javascript" src="../Scripts/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript" src="../Scripts/chur-alert.1.0.js"></script>
<script type="text/javascript">
	$(function() {
		$('#find')
				.click(
						function() {
							if ($('#username').val() == ""
									|| $('#password').val() == ""
									|| $('#password2').val() == "") {
								$('.tip2').html('用户名或密码不可为空！')
							} else {
								if (document.getElementById("password").value == document
										.getElementById("password2").value) {
									$("form").submit();
								} else {
									$('.tip2').html('两次输入的密码不一致，请重新输入！')
									$('#password').val('');
									$('#password2').val('');
								}
							}
						});
		$('#clear').click(function() {
			$('#username').val('');
			$('#password').val('');
			$('#password2').val('');
		})
	})
</script>


<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />
	<s:if test="#result =='success'">
		<script type="text/javascript">
		var $parent = self.parent.$; 
			$(function() {
				$parent('body').alert({
					type : 'success',
					title : '系统提示', //标题
					content : '添加成功！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		</script>
	</s:if>
		<s:if test="#result =='error'">
		<script type="text/javascript">
		var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'warning',
					title : '系统提示', //标题
					content : '抱歉，用户名已存在！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		</script>
	</s:if>
</s:if>
</head>
<body>
	<div></div>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>系统管理<b class="tip"></b>添加管理员
	</div>
	<form action="addmanager" method="post">
		<div>
			<table class="tbform">
				<thead>
					<tr>
						<td colspan="6" class="auto-style2" style="text-align:center; ">&nbsp;请输入用户名与密码
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tdl" style="text-align:right; ">账户名
							&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="td1" style="width: 820px;"><input id="username"
							size="60" class="ipt" name="username" />
						</td>
					</tr>
					<tr>
						<td class="tdl" style="text-align:right; ">密码
							&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<div class="input-append">
								<input class="ipt" size="60" type="password" id="password"
									name="password" />
							</div>
						</td>
					</tr>

					<tr>
						<td class="tdl" style="text-align:right; ">确认密码
							&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<div class="input-append">
								<input class="ipt" size="60" type="password" id="password2" />
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="6" style="text-align:center; "><input
							class="btn" id="find" type="button" value="提交" /> <input
							class="btn" id="clear" type="button" value="清空" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<div>
		<p class="tip2" style="text-align:center; color:red">&nbsp;</p>
	</div>
</body>
</html>
