<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        $(function () {
            $('.modal').show();
			
			$(".datepicker").datepicker();
        })
        
        function editV(obj) {
		document.forms.form.action = "jumpeditclient";
		document.forms.form.submit();
	}
	function backV(obj) {
		document.forms.form.action = "showclient";
		document.forms.form.submit();
	}
    </script>
    
 <s:set name="clientID" value="#client.clientID"></s:set>
<s:set name="loginDate" value="#client.loginDate"></s:set>
<s:set name="name" value="#client.name"></s:set>
<s:set name="caseID" value="#client.caseID"></s:set>
<s:set name="lawyerID" value="#client.lawyerID"></s:set>
<s:set name="address" value="#client.address"></s:set>
<s:set name="phone" value="#client.phone"></s:set>
<s:set name="fax" value="#client.fax"></s:set>
<s:set name="zip" value="#client.zip"></s:set>
<s:set name="memo" value="#client.memo"></s:set>

<s:set name="topage" value="#topage"></s:set>
<s:set name="showMany" value="#showMany"></s:set>
</head>
<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>客户管理<b class="tip"></b>客户查看
	</div>

	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
				<td colspan="4"><b>客户基本信息</b>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="15%">客户编号</td>
				<td width="500" colspan="3" height="">${clientID}</td>
			</tr>
			<tr>
				<td width="15%">客户姓名</font>
				</td>
				<td width="500">${name}</td>
				<td width="500">登记日期</font>
				</td>
				<td width="500">${loginDate}</td>
			</tr>
			<tr>
				<td>相关案件</td>
				<td>${caseID}</td>

					<td>负责律师</td>
					<td>${lawyerID}</td>
			</tr>
			<tr>
				<td>联系地址</td>
				<td>${address}</td>

					<td>联系电话</td>
					<td>${phone}</td>
			</tr>
			<tr>
				<td>传真</td>
				<td>${fax}</td>
				<td>邮政编码</td>
				<td>${zip}</td>
			</tr>
			<tr>
				<td width="15%">备注</td>
				<td width="500" colspan="3" height="">${memo}</td>
			</tr>
		</tbody>
		<tfoot>

		</tfoot>
	</table>
	<form id="form" method="post">
		<div style="text-align:center; ">
			<input class="btn btn-inverse" id="save" type="button"
				onclick='editV(this)' value="编辑" /> <input class="btn btn-inverse"
				id="cancel" type="button" onclick='backV(this)' value="返回" /> <input
				type="hidden" id="checkbutton" name="buttonName" value="${clientID}"><input
				type="hidden" id="topage" name="topage" value="${topage}"><input
					type="hidden" id="showMany" name="showMany" value="${showMany}">
		</div>
	</form>
</body>
</html>
