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
<link rel="stylesheet" type="text/css"
	href="../Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../Styles/admin-all.css" />
<script type="text/javascript" src="../Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="../Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript">
	$(function() {
		$('.modal').show();
	})
	function actionV(obj) {
		if ($('#password').val() == "" || $('#authority').val() == "") {
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'warning',
					title : '系统提示', //标题
					content : '必填项不可为空！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		} else {
			document.getElementById("checkbutton").value = obj.id;
			document.forms.form.action = "editmanager";
			document.forms.form.submit();
		}
	}
</script>
<s:set name="opassword" value="#resultlist.password"></s:set>
<s:set name="oauthority" value="#resultlist.authority"></s:set>
<s:set name="ousername" value="#resultlist.username"></s:set>
</head>
<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>系统管理<b class="tip"></b>管理员编辑
	</div>
	<form id="form" method="post">
		<table class="table table-striped table-bordered table-condensed list">
			<thead>
				<tr>
					<td colspan="4" style="text-align:center; "><b>管理员基本信息</b>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>管理员名</td>
					<td><s:property value="#resultlist.username" />
					</td>
					<td width="15%">密码<font color="FF0000">*</font>
					</td>
					<td width="500"><input id="password" name="password"
						value="${opassword}" type="text" /></td>
				</tr>
				<tr>
					<td width="500">创建日期</td>
					<td width="500" colspan="1"><s:property
							value="#resultlist.createdata" />
					</td>
					<td>权限<font color="FF0000">*</font>
					</td>
					<td><input id="authority" name="authority"
						value="${oauthority}" type="text" />
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" style="text-align:center; "><input
						class="btn btn-inverse" id="save" type="button"
						onclick='actionV(this)' value="保存" /> <input
						class="btn btn-inverse" id="cancel" type="button"
						onclick='actionV(this)' value="取消" /> <input type="hidden"
						id="checkbutton" name="buttonName"> <input type="hidden"
						id="checkuser" name="username" value="${ousername}">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>
