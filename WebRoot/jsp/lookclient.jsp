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
		��ǰλ��<b class="tip"></b>�ͻ�����<b class="tip"></b>�ͻ��鿴
	</div>

	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
				<td colspan="4"><b>�ͻ�������Ϣ</b>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="15%">�ͻ����</td>
				<td width="500" colspan="3" height="">${clientID}</td>
			</tr>
			<tr>
				<td width="15%">�ͻ�����</font>
				</td>
				<td width="500">${name}</td>
				<td width="500">�Ǽ�����</font>
				</td>
				<td width="500">${loginDate}</td>
			</tr>
			<tr>
				<td>��ذ���</td>
				<td>${caseID}</td>

					<td>������ʦ</td>
					<td>${lawyerID}</td>
			</tr>
			<tr>
				<td>��ϵ��ַ</td>
				<td>${address}</td>

					<td>��ϵ�绰</td>
					<td>${phone}</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${fax}</td>
				<td>��������</td>
				<td>${zip}</td>
			</tr>
			<tr>
				<td width="15%">��ע</td>
				<td width="500" colspan="3" height="">${memo}</td>
			</tr>
		</tbody>
		<tfoot>

		</tfoot>
	</table>
	<form id="form" method="post">
		<div style="text-align:center; ">
			<input class="btn btn-inverse" id="save" type="button"
				onclick='editV(this)' value="�༭" /> <input class="btn btn-inverse"
				id="cancel" type="button" onclick='backV(this)' value="����" /> <input
				type="hidden" id="checkbutton" name="buttonName" value="${clientID}"><input
				type="hidden" id="topage" name="topage" value="${topage}"><input
					type="hidden" id="showMany" name="showMany" value="${showMany}">
		</div>
	</form>
</body>
</html>
