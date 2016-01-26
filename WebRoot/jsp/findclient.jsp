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
    <link rel="stylesheet" type="text/css" href="../Styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/admin-all.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script type="text/javascript" src="../Scripts/tip.js"></script>
    <script type="text/javascript">
	$(function() {
		$(".datepicker").datepicker();

		$('#list').hide();
		$('#caseID').tooltip({
			title : '��ذ���'
		});
		$('#lawyerID').tooltip({
			title : '������ʦ'
		});
		$('#name').tooltip({
			title : '�ͻ�����'
		});
		$('#loginDateEnd').tooltip({
			title : '��������'
		});
		$('#loginDateStart').tooltip({
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
			$('#name').val('');
			$('#loginDateEnd').val('');
			$('#loginDateStart').val('');
		})

	})
</script>

<script>
	function changePage(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "showclient";
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
					document.forms.form2.action = "deleteclient";
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
		document.forms.form2.action = "jumpeditclient";
		document.forms.form2.submit();
	}
	function lookV(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "lookclient";
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
				document.forms.form2.action = "showclient";
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
				document.forms.form2.action = "showclient";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
	<s:if test="#result =='editfail'">
		<script type="text/javascript">
			$(function() {
				document.forms.form2.action = "showclient";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
</s:if>

<s:set name="caseID" value="#clientfind.caseID"></s:set>
<s:set name="lawyerID" value="#clientfind.lawyerID"></s:set>
<s:set name="name" value="#clientfind.caseStartTime"></s:set>
<s:set name="loginDateEnd" value="#clientfind.caseHandleTime"></s:set>
<s:set name="loginDateStart" value="#clientfind.indicter"></s:set>

</head>
<body>
    <div></div>
    <div class="alert alert-info">��ǰλ��<b class="tip"></b>�ͻ�����<b class="tip"></b>�ͻ���ѯ</div>
	<form id="form1" action="findclient" method="post">
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<td colspan="6" class="auto-style2">&nbsp;����д��ѯ����(�粻��д�򷵻�ȫ����¼)
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>�ͻ�����:</td>
					<td class="detail"><input id="name" name="name"
						value="${name}" /></td>
					<td>�Ǽ�����:</td>
					<td
						<div class="input-append">
                        <input class="span2 datepicker" size="16" type="text" id="loginDateStart" name="loginDateStart" value="${loginDateStart}"/><span class="add-on"><i class="icon-calendar"></i></span>��<input id="loginDateEnd" class="span2 datepicker" size="16" type="text" name="loginDateEnd" value="${loginDateEnd}"/><span class="add-on"><i class="icon-calendar"></i></span>
                    </div></td>
				</tr>
				<tr>
					<td>������ʦ:</td>
					<td class="detail"><input id="lawyerID" name="lawyerID"
						value="${lawyerID}" /></td>
					<td>��ذ���:</td>
					<td class="detail"><input id="caseID" name="caseID"
						value="${caseID}" /></td>
				</tr>

				<tr>
					<td colspan="6" align="right"><input class="btn btn-inverse"
						id="find" type="button" value="��ѯ" /> <input id="clear"
						class="btn btn-inverse" type="button" value="���" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>


	<table class="table table-striped table-bordered table-condensed" id="list">
        <thead>
            <tr class="tr_detail">
                <td>�ͻ���� </td>
                <td>�ͻ�����</td>
                <td>�Ǽ�����</td>
                <td>��ذ���</td>
                <td>������ʦ</td>
				<td>��ϵ��ַ</td>
				<td>��ϵ�绰</td>
				<td>����</td>
				<td>��������</td>
				<td>����</td>
            </tr>
        </thead>
       <s:set name="list" value="#resultlist" />
			<s:iterator id="resu" value="list">
				<tr>
					<td><s:property value="clientID" /> </a></td>
					<td><s:property value="name" />
					</td>
					<td><s:property value="loginDate" />
					</td>
					<td><s:property value="caseID" />
					</td>
					<td><s:property value="lawyerID" />
					</td>
					<td><s:property value="address" />
					</td>
					<td><s:property value="phone" />
					</td>
					<td><s:property value="fax" />
					</td>
					<td><s:property value="zip" />
					</td>
					<s:set name="stbtnm" value="clientID"></s:set>
					<td><a class="btn btn-mini btn-primary" id="${stbtnm}"
						onclick='lookV(this)'>�鿴</a> <a class="btn btn-mini btn-success"
						id="${stbtnm}" onclick='editV(this)'>�༭</a> <a
						class="btn btn-mini btn-danger" id="${stbtnm}"
						onclick='deleteV(this)'>ɾ��</a>
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

