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

		$(".datepicker").datepicker();
	})

	
	function actionV(obj) {
			if ($('#name').val() == "") {
				var $parent = self.parent.$;
				$parent('body').alert({
					type : 'warning',
					title : 'ϵͳ��ʾ', //����
					content : '�ͻ�����Ϊ�գ�', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			} else {

			document.getElementById("checkbutton").value = obj.id;
			document.forms.form.action = "editclient";
			document.forms.form.submit();
			}
		}
</script>
<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />
	<s:if test="#result =='adderror'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'danger',
					title : 'ϵͳ��ʾ', //����
					content : 'ʧ�ܣ���������Ѵ��ڣ�', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			})
		</script>
	</s:if>

	<s:if test="#result =='nocase'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'danger',
					title : 'ϵͳ��ʾ', //����
					content : 'ʧ�ܣ�������Ų����ڣ�', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			})
		</script>
	</s:if>

	<s:if test="#result =='addsuccess'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'success',
					title : 'ϵͳ��ʾ', //����
					content : '��ӳɹ���', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			})
		</script>
	</s:if>
</s:if>
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
</head>
<body>
	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>�ͻ�����<b class="tip"></b>���¿ͻ�
	</div>

	<table class="table table-striped table-bordered table-condensed list">
		<form id="form" action="addclient" method="post">
			<thead>
				<tr>
					<td colspan="4"><b>�ͻ�������Ϣ</b>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="15%">�ͻ�����<font color="FF0000">*</font>
					</td>
					<td width="500" colspan="3"><input name="name" id="name"
						value="${name}" type="text" /></td>
				</tr>
				<tr>
					<td>��ذ���</td>
					<td><input name="caseID" value="${caseID}" type="text" />
					</td>
					<td>������ʦ</td>
					<td><input name="lawyerID" value="${lawyerID}" type="text" />
					</td>
				</tr>
				<tr>
					<td>��ϵ��ַ</td>
					<td><input name="address" value="${address}" type="text" />
					</td>
					<td>��ϵ�绰</td>
					<td><input name="phone" value="${phone}" type="text" />
					</td>
				</tr>
				<tr>
					<td>����</td>
					<td><input name="fax" value="${fax}" type="text" />
					</td>
					<td>��������</td>
					<td><input name="zip" value="${zip}" type="text" />
					</td>
				</tr>
				<tr>
					<td width="15%">��ע</td>
					<td width="500" colspan="3" height=""><textarea name="memo"
							style="width: 95%" rows="4" cols="5">${memo}</textarea></td>
				</tr>
			</tbody>
			<tfoot>

			</tfoot>
	</table>	
	<div style="text-align:center; ">
		<input class="btn btn-inverse" id="save" type="button"
			onclick='actionV(this)' value="����" /> <input class="btn btn-inverse"
			id="cancel" type="button" onclick='actionV(this)' value="ȡ��" /> <input
			type="hidden" id="checkbutton" name="buttonName"> <input
			type="hidden" id="clientID" name="clientID" value="${clientID}"><input
			type="hidden" id="loginDate" name="loginDate" value="${loginDate}">
	</div>
</body>
</form>
</html>

