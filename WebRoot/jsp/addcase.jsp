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
		$("#tabs").tabs();

		$(".datepicker").datepicker();
	})

	function changeValue() {
		var val1 = document.getElementById('legalCost').value;
		var val2 = document.getElementById('maintainCost').value;
		var val3 = document.getElementById('transactCost').value;
		var val4 = document.getElementById('costRemain').value;
		document.getElementById('shouldCost').value = parseFloat(val2)
				+ parseFloat(val1) + parseFloat(val3);
		document.getElementById('costRecieved').value = parseFloat(val2)
				+ parseFloat(val1) + parseFloat(val3) - parseFloat(val4);
	}

	$(function() {
		$('#submit').click(function() {
			if ($('#CaseID').val() == "") {
				var $parent = self.parent.$;
				$parent('body').alert({
					type : 'warning',
					title : 'ϵͳ��ʾ', //����
					content : '������Ų���Ϊ�գ�', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
				})
			} else {                								
				$("form").submit();
			}
		});
	})
</script>
</head>
<body>
	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>��������<b class="tip"></b>��������
	</div>
	<form action="addcase" method="post">
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">����</a>
				</li>
				<li><a href="#tabs-2">����</a>
				</li>
				<li><a href="#tabs-3">�᰸</a>
				</li>
				<li><a href="#tabs-4">����</a>
				</li>
				<li><a href="#tabs-5">����</a>
				</li>
			</ul>
			<div id="tabs-1">
				<table
					class="table table-striped table-bordered table-condensed list">
					<thead>
					</thead>
					<tbody>
						<tr>
							<td>�������<font color="FF0000">*</font>
							</td>
							<td width="500" colspan="3"><input name="CaseID" id="CaseID"
								value="" type="text" /></td>
						</tr>
						<tr>
							<td>��������</td>
							<td><select name="CaseProperty" id="CaseProperty">
									<option value="���°���">���°���</option>
									<option value="���°���">���°���</option>
									<option value="���ð���">���ð���</option>
									<option value="��������">��������</option>
									<option value="����">����</option>
									<option selected="selected"></option>
							</select>
							</td>
							<td width="500">�참��ʦ</td>
							<td width="500"><input name="LawyerID" id="LawyerID"
								value="" type="text" />
							</td>
						</tr>
						<tr>
							<td>����ʱ��</td>
							<td>
								<div class="input-append">
									<input size="16" class="span2 datepicker" type="text"
										name="CaseStartTime" id="CaseStartTime" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							<td>�᰸ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="CaseHandleTime" id="CaseHandleTime" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>

						</tr>
						<tr>
							<td width="15%">����</td>
							<td width="500" colspan="3" height=""><textarea
									name="CaseReason" id="CaseReason" style="width: 95%" rows="4"
									cols="5" runat="server"></textarea></td>
						</tr>
						<tr>
							<td width="15%">ԭ��</td>
							<td width="500" colspan="3" height=""><textarea
									name="Indicter" id="Indicter" style="width: 95%" rows="1"
									cols="5"></textarea></td>
						</tr>
						<tr>
							<td width="15%">����</td>
							<td width="500" colspan="3" height=""><textarea
									name="Indictee" id="Indictee" style="width: 95%" rows="1"
									cols="5"></textarea></td>
						</tr>
						<tr>
							<td width="15%">������</td>
							<td width="500" colspan="3" height=""><textarea
									name="ThirdParty" id="ThirdParty" style="width: 95%" rows="1"
									cols="5"></textarea></td>
						</tr>
						<tr>
							<td width="15%">��������</td>
							<td width="500" colspan="3" height=""><textarea
									name="suitRequest" id="suitRequest" style="width: 95%" rows="4"
									cols="5"></textarea></td>
						</tr>
						<tr>
							<td>���ϱ��</td>
							<td><input name="suitValue" id="suitValue" value=""
								type="text" /></td>
							<td>���Ϸ�</td>
							<td>
								<div class="input-append">
									<input class="span2" id="suitCost" name="suitCost" size="16"
										type="text" value="0" onchange="changeValue()" /><span
										class="add-on">��</span>
								</div>
							</td>
						</tr>
						<tr>
							<td width="15%">�Ʋ���ȫ</td>
							<td width="500" colspan="3" height=""><textarea
									name="belongingsMaintain" id="belongingsMaintain"
									style="width: 95%" rows="4" cols="5"></textarea></td>
						</tr>
						<tr>
							<td width="15%">֤�ݱ�ȫ</td>
							<td width="500" colspan="3" height=""><textarea
									name="evidenceMaintain" id="evidenceMaintain"
									style="width: 95%" rows="4" cols="5"></textarea></td>
						</tr>
						<tr>
							<td width="15%">��ȫ��</td>
							<td width="500" colspan="3" height="">
								<div class="input-append">
									<input class="span2" id="MaintainCost" name="MaintainCost"
										size="16" type="text" value="0" onchange="changeValue()" /><span
										class="add-on">��</span>
								</div></td>
						</tr>
					</tbody>
					<tfoot>

					</tfoot>
				</table>
			</div>
			<div id="tabs-2">
				<table
					class="table table-striped table-bordered table-condensed list">
					<thead>
					</thead>
					<tbody>
						<tr>
							<td>�ʹ�</td>
							<td><select name="service" id="service">
									<option value="�ʼ��ʹ�">�ʼ��ʹ�</option>
									<option value="����ǩ��">����ǩ��</option>
									<option value="�ؿ�ר��">�ؿ�ר��</option>
									<option value="�����ʹ�">�����ʹ�</option>
									<option selected="selected"></option>
							</select>
							</td>
							<td>����</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" type="text" id="bullentinTime"
										name="bullentinTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
						</tr>
						<tr>
							<td>��ͥʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" type="text" id="sittingTime"
										name="sittingTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							<td>��������</td>
							<td><input name="singleInquisition" type="radio" value="��" />
								�� <input type="radio" name="singleInquisition" value="��" /> ��</td>
						</tr>
						<tr>
							<td width="15%">��������</td>
							<td width="500" colspan="3" height=""><textarea
									name="joinInquisition" style="width: 95%" rows="4" cols="5"></textarea>
							</td>
						</tr>
						<tr>
							<td>��������ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjournmentTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>ͥ������ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjPrecidingJudgeTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>Ժ������ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjDeanTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>��Ժ����ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjIntermediateTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>�鵵ʱ��</td>
							<td colspan="3">
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="fileTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td width="15%">��ע</td>
							<td width="500" colspan="3" height=""><textarea name="memo"
									style="width: 95%" rows="4" cols="5"></textarea></td>
						</tr>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
			<div id="tabs-3">
				<table
					class="table table-striped table-bordered table-condensed list">
					<thead>
					</thead>
					<tbody>
						<tr>
							<td>����ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="joinAdjusdgementTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>���г�����</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="chiefJusticeTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>ͥ������</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="presidingJudgeTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>Ժ������</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="deanTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>��ί������</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="jurorTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>�о�ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjudgementTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>��Чʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="effectTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>ִ���������</td>
							<td><input name="executeApplication" type="radio" value="�� "
								 /> �� <input type="radio"
								name="executeApplication" value="��" /> ��</td>
						</tr>
						<tr>
							<td>�᰸��ʽ</td>
							<td colspan="3"><input name="kindOfEndACase" type="radio"
								 value="�о�" /> �о� <input type="radio"
								name="kindOfEndACase" value="����" /> ���� <input
								name="kindOfEndACase" type="radio"  value="���� " />
								���� <input name="kindOfEndACase" type="radio" 
								value="����" /> ����</td>
						</tr>
						<tr>
							<td>�᰸ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="caseEndTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>����ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="reportTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>���з�ʽ</td>
							<td><select name="adjudicateCondition">
									<option value="�ʼ��ʹ�">�ʼ��ʹ�</option>
									<option value="����ǩ��">����ǩ��</option>
									<option value="�ؿ�ר��">�ؿ�ר��</option>
									<option value="�����ʹ�">�����ʹ�</option>
									<option selected="selected"></option>
							</select>
							</td>
							<td>����ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" type="text" name="deliverTime" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
						</tr>
						<tr>
							<td>�������</td>
							<td><input name="appeal" type="radio" value="�� " /> �� <input
								type="radio" name="appeal" value="��" /> ��</td>

							<td>����ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" type="text" name="appealTime" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
						</tr>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
			<div id="tabs-4">
				<table
					class="table table-striped table-bordered table-condensed list">
					<thead>
					</thead>
					<tbody>
						<tr>
							<td width="15%">���λ</td>
							<td width="500" colspan="3" height=""><textarea
									name="lendTo" style="width: 95%" rows="1" cols="5"></textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">�����ϵ��</td>
							<td width="500" colspan="3" height=""><textarea
									name="cManOfLend" style="width: 95%" rows="1" cols="5"></textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">���ԭ��</td>
							<td width="500" colspan="3" height=""><textarea
									name="lendFileReason" style="width: 95%" rows="4" cols="5"></textarea>
							</td>
						</tr>
						<tr>
							<td>���ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="lendFileTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>����ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="backTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>��������ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="appealMoveFileTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>�ؾ�ʱ��</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="appealBackFileTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td width="15%">���͵�λ</td>
							<td width="500" colspan="3" height=""><textarea
									name="moveTo" style="width: 95%" rows="2" cols="5"></textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">����ԭ��</td>
							<td width="500" colspan="3" height=""><textarea
									name="moveReason" style="width: 95%" rows="4" cols="5"></textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">��ע</td>
							<td width="500" colspan="3" height=""><textarea
									name="moveMemo" style="width: 95%" rows="4" cols="5"></textarea>
							</td>
						</tr>
						<tr>
							<td>����ʱ��</td>
							<td colspan="3">
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="moveTime" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
			<div id="tabs-5">
				<table
					class="table table-striped table-bordered table-condensed list">
					<thead>
					</thead>
					<tbody>
						<tr>
							<td width="15%">���Ϸ�</td>
							<td width="500">
								<div class="input-append">
									<input class="span2" id="legalCost" name="legalCost" size="16"
										type="text" value="0" onchange="changeValue()" /><span
										class="add-on">��</span>
								</div></td>
							<td width="500">��ȫ��</td>
							<td width="500">
								<div class="input-append">
									<input class="span2" id="maintainCost" name="maintainCost"
										size="16" type="text" value="0" onchange="changeValue()" /><span
										class="add-on">��</span>
								</div>
						</tr>
						<tr>
							<td>�참��</td>
							<td>
								<div class="input-append">
									<input class="span2" id="transactCost" name="transactCost"
										size="16" type="text" value="0" onchange="changeValue()" /><span
										class="add-on">��</span>
								</div>
								<td>Ӧ�շ�</td>
								<td>
									<div class="input-append">
										<input class="span2" id="shouldCost" name="shouldCost"
											size="16" type="text" readonly="true" /><span class="add-on">��</span>
									</div>
						</tr>
						<tr>
							<td>Ƿ��</td>
							<td>
								<div class="input-append">
									<input class="span2" id="costRecieved" name="costRecieved"
										size="16" type="text" readonly="ture" /><span class="add-on">��</span>
								</div></td>
							<td>���շ�</td>
							<td>
								<div class="input-append">
									<input class="span2" id="costRemain" name="costRemain"
										size="16" type="text" value="0" onchange="changeValue()" /><span
										class="add-on">��</span>
								</div>
						</tr>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
		</div>
	</form>
	<div style="text-align:center; ">
		<input class="btn btn-inverse" id="submit" type="button" value="����" />
	</div>
</body>
</html>
