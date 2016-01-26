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
<script type="text/javascript" src="../Scripts/tip.js"></script>
<script type="text/javascript">
	$(function() {
		$(".datepicker").datepicker();
		$('#list').hide();
		$('#username').tooltip({
			title : '����Ա��'
		});
		$('#startime').tooltip({
			title : '��ʼ����'
		});
		$('#endtime').tooltip({
			title : '��������'
		});
	})
</script>
<script type="text/javascript">
	$(function() {
		$('#find').click(function() {
			$("#form1").submit();
		})

		$('#clear').click(function() {
			$('#username').val('');
			$('#startime').val('');
			$('#endtime').val('');
		})

	})
</script>
<script>
	function changePage(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "showmanager";
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
					document.forms.form2.action = "deletemanager";
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
	function editV(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "jumpeditmanager";
		document.forms.form2.submit();
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
				document.forms.form2.action = "showmanager";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
	<s:if test="#result =='editsuccess'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'success',
					title : 'ϵͳ��ʾ', //����
					content : '�༭�ɹ���', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
				document.forms.form2.action = "showmanager";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
	<s:if test="#result =='editfail'">
		<script type="text/javascript">
		$(function() {
				document.forms.form2.action = "showmanager";
				document.forms.form2.submit();
				})
		</script>
	</s:if>
</s:if>
</head>
<body>
	<div></div>
	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>ϵͳ����<b class="tip"></b>�鿴����Ա
	</div>
	<table class="table table-striped table-bordered table-condensed">
		<form id="form1" action="findmanager" method="post">
			<thead>
				<tr>
					<td colspan="6" class="auto-style2">&nbsp;����д��ѯ����(�粻��д�򷵻�ȫ����¼)
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>����Ա��:</td>
					<td class="detail"><input id="username" name="username" /></td>
					<td>��������:</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" size="16" type="text"
								id="startime" name="startTime" /><span class="add-on"><i
								class="icon-calendar"></i> </span>��<input id="endtime"
								class="span2 datepicker" size="16" type="text" name="endTime" /><span
								class="add-on"><i class="icon-calendar"></i> </span>
						</div></td>
				</tr>
				<tr>
					<td colspan="6" align="right"><input class="btn btn-inverse"
						id="find" type="button" value="��ѯ" /> <input
						class="btn btn-inverse" id="clear" type="button" value="���" />
					</td>
				</tr>
			</tbody>
		</form>
	</table>


	<table class="table table-striped table-bordered table-condensed"
		id="list">
		<thead>
			<tr class="tr_detail">
				<td>����Ա��</td>
				<td>����</td>
				<td>����ʱ��</td>
				<td>Ȩ��</td>
				<td>����</td>
			</tr>
		</thead>
		<tbody>
			<s:set name="list" value="#resultlist" />
			<s:iterator id="resu" value="list">
				<tr>
					<td><s:property value="username" /> </a>
					</td>
					<td><s:property value="password" /></td>
					<td><s:property value="createdata" /></td>
					<td><s:property value="authority" /></td>
					<s:set name="stbtnm" value="username"></s:set>
					<td><a class="btn btn-mini btn-danger" id="${stbtnm}"
						onclick='editV(this)'>�༭</a> <a class="btn btn-mini btn-danger"
						id="${stbtnm}" onclick='deleteV(this)'>ɾ��</a></td>
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
						id="checkbutton" name="buttonName"></td>
				</form>
			</tr>
		</tbody>
	</table>

</body>
</html>

