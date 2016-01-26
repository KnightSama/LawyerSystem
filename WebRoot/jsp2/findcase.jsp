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
		$('#caseID').tooltip({
			title : '�������'
		});
		$('#lawyerID').tooltip({
			title : '�참��ʦ'
		});
		$('#indicter').tooltip({
			title : 'ԭ��'
		});
		$('#indictee').tooltip({
			title : '����'
		});
		$('#caseProperty').tooltip({
			title : '��������'
		});
		$('#suitValue').tooltip({
			title : '���ϱ��'
		});
		$('#caseStartTime1').tooltip({
			title : '��������'
		});
		$('#caseStartTime2').tooltip({
			title : '��������'
		});
		$('#caseHandleTime1').tooltip({
			title : '��������'
		});
		$('#caseHandleTime2').tooltip({
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
			$('#caseID').val('');
			$('#lawyerID').val('');
			$('#indicter').val('');
			$('#indictee').val('');
			$('#suitValue').val('');
			$('#caseStartTime1').val('');
			$('#caseStartTime2').val('');
			$('#caseHandleTime1').val('');
			$('#caseHandleTime2').val('');
			var opts = document.getElementById("caseProperty");
			opts.options[5].selected = 'selected';
		})

	})
</script>

<script>
	function changePage(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "showcase";
		document.forms.form2.submit();
	}
	function lookV(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "printcase";
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
				document.forms.form2.action = "showcase";
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
				document.forms.form2.action = "showcase";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
	<s:if test="#result =='editfail'">
		<script type="text/javascript">
			$(function() {
				document.forms.form2.action = "showcase";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
</s:if>


<s:set name="caseID" value="#casefind.caseID"></s:set>
<s:set name="caseProperty" value="#casefind.caseProperty"></s:set>
<s:set name="lawyerID" value="#casefind.lawyerID"></s:set>
<s:set name="caseStartTime1" value="#casefind.caseStartTime"></s:set>
<s:set name="caseHandleTime1" value="#casefind.caseHandleTime"></s:set>
<s:set name="indicter" value="#casefind.indicter"></s:set>
<s:set name="indictee" value="#casefind.indictee"></s:set>
<s:set name="caseStartTime2" value="#casefind.thirdParty"></s:set>
<s:set name="suitValue" value="#casefind.suitValue"></s:set>
<s:set name="caseHandleTime2" value="#casefind.belongingsMaintain"></s:set>

<script type="text/javascript">
	$(function() {
		var opts = document.getElementById("caseProperty");
		var value = "${caseProperty}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}
	})
</script>


</head>
<body>
	<div></div>
	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>��������<b class="tip"></b>������ѯ
	</div>
	<form id="form1" action="findcase" method="post">
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<td colspan="6" class="auto-style2">&nbsp;����д��ѯ����(�粻��д�򷵻�ȫ����¼)
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>�������:</td>
					<td class="detail"><input id="caseID" name="caseID"
						value="${caseID}" />
					</td>
					<td>�참��ʦ���:</td>
					<td class="detail"><input id="lawyerID" name="lawyerID"
						value="${lawyerID}" />
					</td>
				</tr>
				<tr>
					<td>ԭ��:</td>
					<td class="detail"><input id="indicter" name="indicter"
						value="${indicter}" />
					</td>
					<td>����:</td>
					<td class="detail"><input id="indictee" name="indictee"
						value="${indictee}" />
					</td>
				</tr>
				<tr>
					<td class="detail">��������:</td>
					<td><select name="caseProperty" id="caseProperty">
							<option value="���°���">���°���</option>
							<option value="���°���">���°���</option>
							<option value="���ð���">���ð���</option>
							<option value="��������">��������</option>
							<option value="����">����</option>
							<option selected="selected"></option>
					</select></td>
					<td>���ϱ��:</td>
					<td class="detail"><input id="suitValue" name="suitValue"
						value="${suitValue}" /></td>
				</tr>
				<tr>
					<td>����ʱ��:</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" size="16" type="text"
								id="caseStartTime1" name="caseStartTime1"
								value="${caseStartTime1}" /><span class="add-on"><i
								class="icon-calendar"></i> </span>��<input id="caseStartTime2"
								class="span2 datepicker" size="16" type="text"
								name="caseStartTime2" value="${caseStartTime2}" /><span
								class="add-on"><i class="icon-calendar"></i> </span>
						</div>
					</td>
					<td>�᰸ʱ��:</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" size="16" type="text"
								id="caseHandleTime1" name="caseHandleTime1"
								value="${caseHandleTime1}" /><span class="add-on"><i
								class="icon-calendar"></i> </span>��<input id="caseHandleTime2"
								class="span2 datepicker" size="16" type="text"
								name="caseHandleTime2" value="${caseHandleTime2}" /><span
								class="add-on"><i class="icon-calendar"></i> </span>
						</div></td>
					<tr>
						<td colspan="6" align="right"><input class="btn btn-inverse"
							id="find" type="button" value="��ѯ" /> <input id="clear"
							class="btn btn-inverse" type="button" value="���" /></td>
					</tr>
			</tbody>
		</table>
	</form>


	<table class="table table-striped table-bordered table-condensed"
		id="list">
		<thead>
			<tr class="tr_detail">
				<td>�������</td>
				<td>�참��ʦ</td>
				<td>��������</td>
				<td>���ϱ��</td>
				<td>ԭ��</td>
				<td>����</td>
				<td>����ʱ��</td>
				<td>�᰸ʱ��</td>
				<td>����</td>
			</tr>
		</thead>
		<tbody>
			<s:set name="list" value="#resultlist" />
			<s:iterator id="resu" value="list">
				<tr>
					<td><s:property value="caseID" /> </a></td>
					<td><s:property value="lawyerID" />
					</td>
					<td><s:property value="caseProperty" />
					</td>
					<td><s:property value="suitValue" />
					</td>
					<td><s:property value="indicter" />
					</td>
					<td><s:property value="indictee" />
					</td>
					<td><s:property value="caseStartTime" />
					</td>
					<td><s:property value="caseHandleTime" />
					</td>
					<s:set name="stbtnm" value="caseID"></s:set>
					<td><a class="btn btn-mini btn-primary" id="${stbtnm}"
						onclick='lookV(this)'>�鿴</a> 
					</td>
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
