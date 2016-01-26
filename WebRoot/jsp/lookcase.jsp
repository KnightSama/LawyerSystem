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

<s:set name="caseID" value="#casebegin.caseID"></s:set>
<s:set name="caseProperty" value="#casebegin.caseProperty"></s:set>
<s:set name="lawyerID" value="#casebegin.lawyerID"></s:set>
<s:set name="caseStartTime" value="#casebegin.caseStartTime"></s:set>
<s:set name="caseHandleTime" value="#casebegin.caseHandleTime"></s:set>
<s:set name="caseReason" value="#casebegin.caseReason"></s:set>
<s:set name="indicter" value="#casebegin.indicter"></s:set>
<s:set name="indictee" value="#casebegin.indictee"></s:set>
<s:set name="thirdParty" value="#casebegin.thirdParty"></s:set>
<s:set name="suitRequest" value="#casebegin.suitRequest"></s:set>
<s:set name="suitValue" value="#casebegin.suitValue"></s:set>
<s:set name="suitCost" value="#casebegin.suitCost"></s:set>
<s:set name="belongingsMaintain" value="#casebegin.belongingsMaintain"></s:set>
<s:set name="evidenceMaintain" value="#casebegin.evidenceMaintain"></s:set>

<s:set name="joinAdjusdgementTime"
	value="#caseends.joinAdjusdgementTime"></s:set>
<s:set name="presidingJudgeTime" value="#caseends.presidingJudgeTime"></s:set>
<s:set name="jurorTime" value="#caseends.jurorTime"></s:set>
<s:set name="chiefJusticeTime" value="#caseends.chiefJusticeTime"></s:set>
<s:set name="deanTime" value="#caseends.deanTime"></s:set>
<s:set name="adjudgementTime" value="#caseends.adjudgementTime"></s:set>
<s:set name="effectTime" value="#caseends.effectTime"></s:set>
<s:set name="executeApplication" value="#caseends.executeApplication"></s:set>
<s:set name="kindOfEndACase" value="#caseends.kindOfEndACase"></s:set>
<s:set name="caseEndTime" value="#caseends.caseEndTime"></s:set>
<s:set name="reportTime" value="#caseends.reportTime"></s:set>
<s:set name="adjudicateCondition" value="#caseends.adjudicateCondition"></s:set>
<s:set name="deliverTime" value="#caseends.deliverTime"></s:set>
<s:set name="appeal" value="#caseends.appeal"></s:set>
<s:set name="appealTime" value="#caseends.appealTime"></s:set>

<s:set name="legalCost" value="#casefee.legalCost"></s:set>
<s:set name="maintainCost" value="#casefee.maintainCost"></s:set>
<s:set name="transactCost" value="#casefee.transactCost"></s:set>
<s:set name="shouldCost" value="#casefee.shouldCost"></s:set>
<s:set name="costRecieved" value="#casefee.costRecieved"></s:set>
<s:set name="costRemain" value="#casefee.costRemain"></s:set>

<s:set name="service" value="#caseprocessing.service"></s:set>
<s:set name="bullentinTime" value="#caseprocessing.bullentinTime"></s:set>
<s:set name="sittingTime" value="#caseprocessing.sittingTime"></s:set>
<s:set name="singleInquisition"
	value="#caseprocessing.singleInquisition"></s:set>
<s:set name="joinInquisition" value="#caseprocessing.joinInquisition"></s:set>
<s:set name="adjournmentTime" value="#caseprocessing.adjournmentTime"></s:set>
<s:set name="adjPrecidingJudgeTime"
	value="#caseprocessing.adjPrecidingJudgeTime"></s:set>
<s:set name="adjDeanTime" value="#caseprocessing.adjDeanTime"></s:set>
<s:set name="adjIntermediateTime"
	value="#caseprocessing.adjIntermediateTime"></s:set>
<s:set name="fileTime" value="#caseprocessing.fileTime"></s:set>
<s:set name="memo" value="#caseprocessing.memo"></s:set>

<s:set name="lendTo" value="#filelend.lendTo"></s:set>
<s:set name="cManOfLend" value="#filelend.cManOfLend"></s:set>
<s:set name="lendFileTime" value="#filelend.lendFileTime"></s:set>
<s:set name="lendFileReason" value="#filelend.lendFileReason"></s:set>
<s:set name="backTime" value="#filelend.backTime"></s:set>
<s:set name="appealMoveFileTime" value="#filelend.appealMoveFileTime"></s:set>
<s:set name="appealBackFileTime" value="#filelend.appealBackFileTime"></s:set>
<s:set name="moveTo" value="#filelend.moveTo"></s:set>
<s:set name="moveReason" value="#filelend.moveReason"></s:set>
<s:set name="moveTime" value="#filelend.moveTime"></s:set>
<s:set name="moveMemo" value="#filelend.moveMemo"></s:set>

<s:set name="topage" value="#topage"></s:set>
<s:set name="showMany" value="#showMany"></s:set>

<script type="text/javascript">
	$(function() {
		var _this = $('.list').find('thead');
		//�۵�
		_this.click(function() {
			var i = $(this).find('i');
			if (i.attr('class') == 'tip-down') {
				i.attr('class', 'tip-up')
			} else {
				i.attr('class', 'tip-down')
			}
			$(this).parent().find('tbody').toggle();
		})
	})

	function editV(obj) {
		document.forms.form.action = "jumpeditcase";
		document.forms.form.submit();
	}
	function backV(obj) {
		document.forms.form.action = "showcase";
		document.forms.form.submit();
	}
</script>


</head>
<body>
	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>��������<b class="tip"></b>�����鿴
	</div>

	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
				<td colspan="6">���� <i class="tip-up"></i>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>�������</td>
				<td width="500" colspan="3">${caseID}</td>
			</tr>
			<tr>
				<td width="15%">��������</td>
				<td width="500">${caseProperty}</td>
				<td width="15%">�참��ʦ</td>
				<td width="500">${lawyerID}</td>
			</tr>
			<tr>
				<td>����ʱ��</td>
				<td>
					<div class="input-append">${caseStartTime}</div>
					<td>�᰸ʱ��</td>
					<td>
						<div class="input-append">${caseHandleTime}</div>
				</td>
			</tr>
			<tr>
				<td width="15%">����</td>
				<td width="500" colspan="3" height="">${caseReason}</td>
			</tr>
			<tr>
				<td width="15%">ԭ��</td>
				<td width="500" colspan="3" height="">${indicter}</td>
			</tr>
			<tr>
				<td width="15%">����</td>
				<td width="500" colspan="3" height="">${indictee}</td>
			</tr>
			<tr>
				<td width="15%">������</td>
				<td width="500" colspan="3" height="">${thirdParty}</td>
			</tr>
			<tr>
				<td width="15%">��������</td>
				<td width="500" colspan="3" height="">${suitRequest}</td>
			</tr>
			<tr>
				<td>���ϱ��</td>
				<td>${suitValue}</td>
				<td>���Ϸ�</td>
				<td>${suitCost}</td>
			</tr>
			<tr>
				<td width="15%">�Ʋ���ȫ</td>
				<td width="500" colspan="3" height="">${belongingsMaintain}</td>
			</tr>
			<tr>
				<td width="15%">֤�ݱ�ȫ</td>
				<td width="500" colspan="3" height="">${evidenceMaintain}</td>
			</tr>
			<tr>
				<td width="15%">��ȫ��</td>
				<td width="500" colspan="3" height="">${maintainCost}</td>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>

	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
				<td colspan="6">���� <i class="tip-up"></i>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>�ʹ�</td>
				<td width="500">${service}</td>
				<td>����</td>
				<td width="500">${bullentinTime}</td>

			</tr>
			<tr>
				<td>��ͥʱ��</td>
				<td>${sittingTime}</td>
				<td>��������</td>
				<td>${singleInquisition}</td>
			</tr>
			<tr>
				<td width="15%">��������</td>
				<td width="500" colspan="3" height="">${joinInquisition}</td>
			</tr>
			<tr>
				<td>��������ʱ��</td>
				<td>${adjournmentTime}</td>
				<td>ͥ������ʱ��</td>
				<td>${adjPrecidingJudgeTime}</td>
			</tr>
			<tr>
				<td>Ժ������ʱ��</td>
				<td>${adjDeanTime}</td>
				<td>��Ժ����ʱ��</td>
				<td>${adjIntermediateTime}</td>
			</tr>
			<tr>
				<td>�鵵ʱ��</td>
				<td colspan="3">${fileTime}</td>
			</tr>
			<tr>
				<td width="15%">��ע</td>
				<td width="500" colspan="3" height="">${memo}</td>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>

	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
				<td colspan="6">�᰸ <i class="tip-up"></i>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>����ʱ��</td>
				<td width="500">${joinAdjusdgementTime}</td>
				<td>���г�����</td>
				<td width="500">${chiefJusticeTime}</td>
			</tr>
			<tr>
				<td>ͥ������</td>
				<td>${presidingJudgeTime}</td>
				<td>Ժ������</td>
				<td>${deanTime}</td>
			</tr>
			<tr>
				<td>��ί������</td>
				<td>${jurorTime}</td>
				<td>�о�ʱ��</td>
				<td>${adjudgementTime}</td>
			</tr>
			<tr>
				<td>��Чʱ��</td>
				<td>${effectTime}</td>
				<td>ִ���������</td>
				<td>${executeApplication}</td>
			</tr>
			<tr>
				<td>�᰸��ʽ</td>
				<td colspan="3">${kindOfEndACase}</td>
			</tr>
			<tr>
				<td>�᰸ʱ��</td>
				<td>${caseEndTime}</td>
				<td>����ʱ��</td>
				<td>${reportTime}</td>
			</tr>
			<tr>
				<td>���з�ʽ</td>
				<td>${adjudicateCondition}</td>
				<td>����ʱ��</td>
				<td>${deliverTime}</td>
			</tr>
			<tr>
				<td>�������</td>
				<td>${appeal}</td>

				<td>����ʱ��</td>
				<td>${appealTime}</td>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>

	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
				<td colspan="6">����<i class="tip-up"></i>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="15%">���λ</td>
				<td width="500" colspan="3" height="">${lendTo}</td>
			</tr>
			<tr>
				<td width="15%">�����ϵ��</td>
				<td width="500" colspan="3" height="">${cManOfLend}</td>
			</tr>
			<tr>
				<td width="15%">���ԭ��</td>
				<td width="500" colspan="3" height="">${lendFileReason}</td>
			</tr>
			<tr>
				<td>���ʱ��</td>
				<td width="500">${lendFileTime}</td>
				<td>����ʱ��</td>
				<td width="500">${backTime}</td>
			</tr>
			<tr>
				<td>��������ʱ��</td>
				<td>${appealMoveFileTime}</td>
				<td>�ؾ�ʱ��</td>
				<td>${appealBackFileTime}</td>
			</tr>
			<tr>
				<td width="15%">���͵�λ</td>
				<td width="500" colspan="3" height="">${moveTo}</td>
			</tr>
			<tr>
				<td width="15%">����ԭ��</td>
				<td width="500" colspan="3" height="">${moveReason}</td>
			</tr>
			<tr>
				<td width="15%">��ע</td>
				<td width="500" colspan="3" height="">${moveMemo}</td>
			</tr>
			<tr>
				<td>����ʱ��</td>
				<td colspan="3">${moveTime}</td>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>

	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
				<td colspan="6">���� <i class="tip-up"></i>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="15%">���Ϸ�</td>
				<td width="500">${legalCost}</td>
				<td width="500">��ȫ��</td>
				<td width="500">${maintainCost}</td>
			</tr>
			<tr>
				<td>�참��</td>
				<td>${transactCost}</td>

					<td>Ӧ�շ�</td>
					<td>${shouldCost}</td>
			</tr>
			<tr>
				<td>Ƿ��</td>
				<td>${costRecieved}</td>
				<td>���շ�</td>
				<td>${costRemain}</td>
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
				type="hidden" id="checkbutton" name="buttonName" value="${caseID}"><input
				type="hidden" id="topage" name="topage" value="${topage}"><input
				type="hidden" id="showMany" name="showMany" value="${showMany}">
		</div> 
	</form>
</body>
</html>

