<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
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
            $('#s2').hide();
			 $('#s3').hide();
        })
    </script>

<script language=javascript>
function doPrint() { 
$('#s2').show();
$('#s3').show();
bdhtml=window.document.body.innerHTML; 
sprnstr="<!--startprint-->"; 
eprnstr="<!--endprint-->"; 
prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
prnhtml=prnhtml.substr(0,prnhtml.indexOf(eprnstr)); 
window.document.body.innerHTML=prnhtml; 
window.print();
$('#s3').hide();
$('#s2').hide(); 
}
</script>

<s:set name="caseID" value="#caseends.caseID"></s:set>
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

</head>
<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>报表<b class="tip"></b>案件结束单
	</div>
	<!--startprint-->
	<div id="s2">
		<img src="../img/logol.png"> <br /> <br /> <br /> <img
			src="../img/title3.png"> <br /> <br /> <br /> <br /> <br />
	</div>
	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>案件编号</td>
				<td width="500" colspan="3">${caseID}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>合议时间</td>
				<td width="500">${joinAdjusdgementTime}</td>
				<td>审判长审批</td>
				<td width="500">${chiefJusticeTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>庭长审批</td>
				<td>${presidingJudgeTime}</td>
				<td>院长审批</td>
				<td>${deanTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>审委会审批</td>
				<td>${jurorTime}</td>
				<td>判决时间</td>
				<td>${adjudgementTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>生效时间</td>
				<td>${effectTime}</td>
				<td>执行申请与否</td>
				<td>${executeApplication}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>结案方式</td>
				<td colspan="3">${kindOfEndACase}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>结案时间</td>
				<td>${caseEndTime}</td>
				<td>报案时间</td>
				<td>${reportTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>宣判方式</td>
				<td>${adjudicateCondition}</td>
				<td>公告时间</td>
				<td>${deliverTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>上诉与否</td>
				<td>${appeal}</td>

				<td>上诉时间</td>
				<td>${appealTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	<div id="s3">
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br /> <img src="../img/foot.jpg">
	</div>
	<!--endprint-->

	<div align="center">
		<a class="btn btn-success" onClick="doPrint()">打 印 报 表</a>
	</div>
</body>
</html>

