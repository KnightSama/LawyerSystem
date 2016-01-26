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
					title : '系统提示', //标题
					content : '案件编号不可为空！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			} else {

				$("form").submit();
			}
		});
	})
</script>

<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />
	<s:if test="#result =='adderror'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'danger',
					title : '系统提示', //标题
					content : '失败，案件编号已存在！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
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
					title : '系统提示', //标题
					content : '添加成功！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		</script>
	</s:if>

</s:if>
<s:set name="caseID" value="#casebegin.caseID"></s:set>
<s:set name="caseProperty" value="casebegin.caseProperty"></s:set>
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

<script type="text/javascript">
	$(function() {

		var opts = document.getElementById("CaseProperty");
		var value = "${caseProperty}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}
		
		var opts = document.getElementById("service");
		var value = "${service}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}
		
		var opts = document.getElementById("adjudicateCondition");
		var value = "${adjudicateCondition}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}
		
		if ("${singleInquisition}" == "是") {
			document.all("singleInquisition")[0].checked = true;//第一个radio选中  
		}
		if ("${singleInquisition}" == "否") {
			document.all("singleInquisition")[1].checked = true;//第一个radio选中  
		}
		
		if ("${executeApplication}" == "是") {
			document.all("executeApplication")[0].checked = true;//第一个radio选中  
		}
		if ("${executeApplication}" == "否") {
			document.all("executeApplication")[1].checked = true;//第一个radio选中  
		}
		
		if ("${kindOfEndACase}" == "判决") {
			document.all("kindOfEndACase")[0].checked = true;//第一个radio选中  
		}
		if ("${kindOfEndACase}" == "调解") {
			document.all("kindOfEndACase")[1].checked = true;//第一个radio选中  
		}if ("${kindOfEndACase}" == "撤诉") {
			document.all("kindOfEndACase")[0].checked = true;//第一个radio选中  
		}
		if ("${kindOfEndACase}" == "移送") {
			document.all("kindOfEndACase")[1].checked = true;//第一个radio选中  
		}
		
		if ("${appeal}" == "是") {
			document.all("appeal")[0].checked = true;//第一个radio选中  
		}
		if ("${appeal}" == "否") {
			document.all("appeal")[1].checked = true;//第一个radio选中  
		}

	})
</script>

</head>
<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>案件管理<b class="tip"></b>案件输入
	</div>
	<form action="addcase" method="post">
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">立案</a></li>
				<li><a href="#tabs-2">审理</a></li>
				<li><a href="#tabs-3">结案</a></li>
				<li><a href="#tabs-4">卷宗</a></li>
				<li><a href="#tabs-5">费用</a></li>
			</ul>
			<div id="tabs-1">
				<table
					class="table table-striped table-bordered table-condensed list">
					<thead>
					</thead>
					<tbody>
						<tr>
							<td>案件编号<font color="FF0000">*</font></td>
							<td width="500" colspan="3"><input name="CaseID" id="CaseID"
								value="${caseID}" type="text" />
							</td>
						</tr>
						<tr>
							<td>案件性质</td>
							<td><select name="CaseProperty" id="CaseProperty">
									<option value="民事案件">民事案件</option>
									<option value="刑事案件">刑事案件</option>
									<option value="经济案件">经济案件</option>
									<option value="行政案件">行政案件</option>
									<option value="其他">其他</option>
									<option selected="selected"></option>
							</select></td>
							<td width="500">办案律师</td>
							<td width="500"><input name="LawyerID" id="LawyerID"
								value="${lawyerID}" type="text" /></td>
						</tr>
						<tr>
							<td>立案时间</td>
							<td>
								<div class="input-append">
									<input size="16" class="span2 datepicker" type="text"
										name="CaseStartTime" id="CaseStartTime" value="${caseStartTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							<td>结案时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="CaseHandleTime" id="CaseHandleTime" value="${caseHandleTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>

						</tr>
						<tr>
							<td width="15%">案由</td>
							<td width="500" colspan="3" height=""><textarea
									name="CaseReason" id="CaseReason" style="width: 95%" rows="4"
									cols="5">${caseReason}</textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">原告</td>
							<td width="500" colspan="3" height=""><textarea
									name="Indicter" id="Indicter" style="width: 95%" rows="1"
									cols="5" >${indicter}</textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">被告</td>
							<td width="500" colspan="3" height=""><textarea
									name="Indictee" id="Indictee" style="width: 95%" rows="1"
									cols="5" >${indictee}</textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">第三人</td>
							<td width="500" colspan="3" height=""><textarea
									name="ThirdParty" id="ThirdParty" style="width: 95%" rows="1"
									cols="5" >${thirdParty}</textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">诉讼请求</td>
							<td width="500" colspan="3" height=""><textarea
									name="suitRequest" id="suitRequest" style="width: 95%" rows="4"
									cols="5" >${suitRequest}</textarea>
							</td>
						</tr>
						<tr>
							<td>诉讼标的</td>
							<td><input name="suitValue" id="suitValue" value="${suitValue}"
								type="text" />
							</td>
							<td>诉讼费</td>
							<td>
								<div class="input-append">
									<input class="span2" id="suitCost" name="suitCost" size="16"
										type="text" value="${suitCost}" onchange="changeValue()" /><span
										class="add-on">￥</span>
								</div></td>
						</tr>
						<tr>
							<td width="15%">财产保全</td>
							<td width="500" colspan="3" height=""><textarea
									name="belongingsMaintain" id="belongingsMaintain"
									style="width: 95%" rows="4" cols="5" value="${belongingsMaintain}"></textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">证据保全</td>
							<td width="500" colspan="3" height=""><textarea
									name="evidenceMaintain" id="evidenceMaintain"
									style="width: 95%" rows="4" cols="5" D}">${evidenceMaintain}</textarea>
							</td>
						</tr>
						<tr>
							<td width="15%">保全费</td>
							<td width="500" colspan="3" height="">
								<div class="input-append">
									<input class="span2" id="MaintainCost" name="MaintainCost"
										size="16" type="text" value="0" onchange="changeValue()" /><span
										class="add-on" value="${maintainCost}">￥</span>
								</div>
							</td>
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
							<td>送达</td>
							<td><select name="service" id="service">
									<option value="邮寄送达">邮寄送达</option>
									<option value="当面签收">当面签收</option>
									<option value="特快专递">特快专递</option>
									<option value="公告送达">公告送达</option>
									<option selected="selected"></option>
							</select></td>
							<td>公告</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" type="text" id="bullentinTime"
										name="bullentinTime" value="${bullentinTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
						</tr>
						<tr>
							<td>开庭时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" type="text" id="sittingTime"
										name="sittingTime" value="${sittingTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							<td>独任审理</td>
							<td><input name="singleInquisition" type="radio" value="是" />
								是 <input type="radio" name="singleInquisition" value="否" /> 否</td>
						</tr>
						<tr>
							<td width="15%">合议审理</td>
							<td width="500" colspan="3" height=""><textarea
									name="joinInquisition" style="width: 95%" rows="4" cols="5"
									>${joinInquisition}</textarea></td>
						</tr>
						<tr>
							<td>申请延期时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjournmentTime" value="${adjournmentTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>庭长审批时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjPrecidingJudgeTime" value="${adjPrecidingJudgeTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>院长审批时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjDeanTime" value="${adjDeanTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>中院审批时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjIntermediateTime" value="${adjIntermediateTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>归档时间</td>
							<td colspan="3">
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="fileTime" value="${fileTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td width="15%">备注</td>
							<td width="500" colspan="3" height=""><textarea name="memo"
									style="width: 95%" rows="4" cols="5" >${memo}</textarea>
							</td>
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
							<td>合议时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="joinAdjusdgementTime" value="${joinAdjusdgementTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>审判长审批</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="chiefJusticeTime" value="${chiefJusticeTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>庭长审批</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="presidingJudgeTime" value="${presidingJudgeTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>院长审批</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="deanTime" value="${deanTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>审委会审批</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="jurorTime" value="${jurorTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>判决时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="adjudgementTime" value="${adjudgementTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>生效时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="effectTime" value="${effectTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>执行申请与否</td>
							<td><input name="executeApplication" type="radio" value="是 "
								 /> 是 <input type="radio"
								name="executeApplication" value="否" /> 否</td>
						</tr>
						<tr>
							<td>结案方式</td>
							<td colspan="3"><input name="kindOfEndACase" type="radio"
								 value="判决" /> 判决 <input type="radio"
								name="kindOfEndACase" value="调解" /> 调解 <input
								name="kindOfEndACase" type="radio"  value="撤诉 " />
								撤诉 <input name="kindOfEndACase" type="radio" 
								value="移送" />移送</td>
						</tr>
						<tr>
							<td>结案时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="caseEndTime" value="${caseEndTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>报案时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="reportTime" value="${reportTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>宣判方式</td>
							<td><select name="adjudicateCondition" id="adjudicateCondition">
									<option value="邮寄送达">邮寄送达</option>
									<option value="当面签收">当面签收</option>
									<option value="特快专递">特快专递</option>
									<option value="公告送达">公告送达</option>
									<option selected="selected"></option>
							</select></td>
							<td>公告时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" type="text" name="deliverTime"
										value="${deliverTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
						</tr>
						<tr>
							<td>上诉与否</td>
							<td><input name="appeal" type="radio" value="是 " /> 是 <input
								type="radio" name="appeal" value="否" /> 否</td>

							<td>上诉时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" type="text" name="appealTime"
										value="${appealTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
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
							<td width="15%">借卷单位</td>
							<td width="500" colspan="3" height=""><textarea
									name="lendTo" style="width: 95%" rows="1" cols="5"
									>${lendTo}</textarea></td>
						</tr>
						<tr>
							<td width="15%">借卷联系人</td>
							<td width="500" colspan="3" height=""><textarea
									name="cManOfLend" style="width: 95%" rows="1" cols="5"
									>${cManOfLend}</textarea></td>
						</tr>
						<tr>
							<td width="15%">借卷原因</td>
							<td width="500" colspan="3" height=""><textarea
									name="lendFileReason" style="width: 95%" rows="4" cols="5"
									>${lendFileReason}</textarea></td>
						</tr>
						<tr>
							<td>借卷时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="lendFileTime" value="${lendFileTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>还卷时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="backTime" value="${backTime}" /><span class="add-on"><i
										class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td>上诉移送时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="appealMoveFileTime" value="${appealMoveFileTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
							<td>回卷时间</td>
							<td>
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="appealBackFileTime" value="${appealBackFileTime}" /><span
										class="add-on"><i class="icon-calendar"></i> </span>
							</td>
							</div>
							</td>
						</tr>
						<tr>
							<td width="15%">移送单位</td>
							<td width="500" colspan="3" height=""><textarea
									name="moveTo" style="width: 95%" rows="2" cols="5"
									>${moveTo}</textarea></td>
						</tr>
						<tr>
							<td width="15%">移送原因</td>
							<td width="500" colspan="3" height=""><textarea
									name="moveReason" style="width: 95%" rows="4" cols="5"
									>${moveReason}</textarea></td>
						</tr>
						<tr>
							<td width="15%">备注</td>
							<td width="500" colspan="3" height=""><textarea
									name="moveMemo" style="width: 95%" rows="4" cols="5"
									>${moveMemo}</textarea></td>
						</tr>
						<tr>
							<td>移送时间</td>
							<td colspan="3">
								<div class="input-append">
									<input class="span2 datepicker" size="16" type="text"
										name="moveTime" value="${moveTime}" /><span class="add-on"><i
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
							<td width="15%">诉讼费</td>
							<td width="500">
								<div class="input-append">
									<input class="span2" id="legalCost" name="legalCost" size="16"
										type="text" value="${legalCost}" onchange="changeValue()" /><span
										class="add-on">￥</span>
								</div></td>
							<td width="500">保全费</td>
							<td width="500">
								<div class="input-append">
									<input class="span2" id="maintainCost" name="maintainCost"
										size="16" type="text" value="${maintainCost}"
										onchange="changeValue()" /><span class="add-on">￥</span>
								</div>
						</tr>
						<tr>
							<td>办案费</td>
							<td>
								<div class="input-append">
									<input class="span2" id="transactCost" name="transactCost"
										size="16" type="text" value="${transactCost}"
										onchange="changeValue()" /><span class="add-on">￥</span>
								</div>
								<td>应收费</td>
								<td>
									<div class="input-append">
										<input class="span2" id="shouldCost" name="shouldCost"
											size="16" type="text" readonly="true" value="${shouldCost}" /><span
											class="add-on">￥</span>
									</div>
						</tr>
						<tr>
							<td>欠费</td>
							<td>
								<div class="input-append">
									<input class="span2" id="costRecieved" name="costRecieved"
										size="16" type="text" readonly="ture" value="${costRecieved}" /><span
										class="add-on">￥</span>
								</div></td>
							<td>已收费</td>
							<td>
								<div class="input-append">
									<input class="span2" id="costRemain" name="costRemain"
										size="16" type="text" value="${costRemain}"
										onchange="changeValue()" /><span class="add-on">￥</span>
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
		<input class="btn btn-inverse" id="submit" type="button" value="保存" />
	</div>
</body>
</html>
