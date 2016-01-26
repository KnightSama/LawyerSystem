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
	href="Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
<script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="Scripts/tip.js"></script>
<script>
	function changePage(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "showorder";
		document.forms.form2.submit();
	}
	function deleteV(obj) {
		var $parent = self.parent.$;
		$parent('body').alert({
			type : 'info',
			title : 'ϵͳ��ʾ', //����
			content : 'ȷ��Ҫɾ��������¼��?', //��ʾ������Ϣ
			modal : true, //ģʽ�����ص�
			draggable : false,
			buttons : [ {
				id : 'yes',
				name : 'ȷ��',
				callback : function() {
					document.getElementById("checkbutton").value = obj.id;
					document.forms.form2.action = "deleteorder";
					document.forms.form2.submit();
				}
			}, {
				id : 'no',
				name : 'ȡ��',
				callback : function() {
				}
			} ]
		})
	}
</script>
<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />
	<s:if test="#result =='success'">
		<script type="text/javascript">
			$(function() {
				$('#list').show();
			})
		</script>
	</s:if>
	<s:if test="#result =='fail'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'warning',
					title : 'ϵͳ��ʾ', //����
					content : '��Ǹ��û���ҵ����ϵĽ����', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			})
		</script>
	</s:if>
	<s:if test="#result =='deletesuccess'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'success',
					title : 'ϵͳ��ʾ', //����
					content : 'ɾ���ɹ���', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
				document.forms.form2.action = "showorder";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
</s:if>
</head>
<body>
	<div></div>
	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>����<b class="tip"></b>ԤԼ����
	</div>
	<table class="table table-striped table-bordered table-condensed"
		id="list">
		<thead>
			<tr class="tr_detail">
				<td>����</td>
				<td>����</td>
				<td>�绰</td>
				<td>��ַ</td>
				<td>����</td>
			</tr>
		</thead>
		<tbody>
			<s:set name="list" value="#resultlist" />
			<s:iterator id="resu" value="list">
				<tr>
					<td><s:property value="name" /> </a></td>
					<td><s:property value="theme" />
					</td>
					<td><s:property value="phone" />
					</td>
					<td><s:property value="address" />
					</td>
					<s:set name="stbtnm" value="uid"></s:set>
					<td><a class="btn btn-mini btn-danger" id="${stbtnm}"
						onclick='deleteV(this)'>ɾ��</a></td>
				</tr>
			</s:iterator>
			<tr class="tr_pagenumber">
				<form id="form2" method="post">
					<td colspan="100">��<s:property value="#pageNum" />ҳ&nbsp;&nbsp;��<s:property
							value="#resultNum" />����¼&nbsp;&nbsp;<a
						class="badge badge-inverse" id="firstpage"
						onclick='changePage(this)'>��ҳ</a>&nbsp; <a
						class="badge badge-inverse" id="prepage"
						onclick='changePage(this)'>��һҳ</a>&nbsp; <a
						class="badge badge-warning">&nbsp;&nbsp;&nbsp;&nbsp;��<s:property
								value="#nowPage" />ҳ&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp; <a
						class="badge badge-inverse" id="nextpage"
						onclick='changePage(this)'>��һҳ</a>&nbsp; <a
						class="badge badge-inverse" id="lastpage"
						onclick='changePage(this)'>βҳ</a>&nbsp;&nbsp;&nbsp;&nbsp; ��ת��<input
						id="topage" name="topage" style="width:30px;">ҳ&nbsp;&nbsp
						<a class="badge badge-inverse" id="jump"
						onclick='changePage(this)'>��ת</a>&nbsp;&nbsp;&nbsp;&nbsp; ÿҳ��ʾ<input
						id="showMany" name="showMany" style="width:30px;">����¼&nbsp;&nbsp
					<a class="badge badge-inverse" id="refresh"
						onclick='changePage(this)'>ˢ��</a> <input type="hidden"
						id="checkbutton" name="buttonName">
					</td>
				</form>
			</tr>
		</tbody>
	</table>

</body>
</html>
