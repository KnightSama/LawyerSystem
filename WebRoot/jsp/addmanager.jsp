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
								$('.tip2').html('�û��������벻��Ϊ�գ�')
							} else {
								if (document.getElementById("password").value == document
										.getElementById("password2").value) {
									$("form").submit();
								} else {
									$('.tip2').html('������������벻һ�£����������룡')
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
		<s:if test="#result =='error'">
		<script type="text/javascript">
		var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'warning',
					title : 'ϵͳ��ʾ', //����
					content : '��Ǹ���û����Ѵ��ڣ�', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			})
		</script>
	</s:if>
</s:if>
</head>
<body>
	<div></div>
	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>ϵͳ����<b class="tip"></b>��ӹ���Ա
	</div>
	<form action="addmanager" method="post">
		<div>
			<table class="tbform">
				<thead>
					<tr>
						<td colspan="6" class="auto-style2" style="text-align:center; ">&nbsp;�������û���������
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tdl" style="text-align:right; ">�˻���
							&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="td1" style="width: 820px;"><input id="username"
							size="60" class="ipt" name="username" />
						</td>
					</tr>
					<tr>
						<td class="tdl" style="text-align:right; ">����
							&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<div class="input-append">
								<input class="ipt" size="60" type="password" id="password"
									name="password" />
							</div>
						</td>
					</tr>

					<tr>
						<td class="tdl" style="text-align:right; ">ȷ������
							&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<div class="input-append">
								<input class="ipt" size="60" type="password" id="password2" />
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="6" style="text-align:center; "><input
							class="btn" id="find" type="button" value="�ύ" /> <input
							class="btn" id="clear" type="button" value="���" /></td>
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
