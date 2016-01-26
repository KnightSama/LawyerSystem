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
</head>

<s:set name="caseID" value="#filelend.caseID"></s:set>
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

<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>报表<b class="tip"></b>卷宗借阅单
	</div>

	<!--startprint-->
	<div id="s2">
		<img src="../img/logol.png"> <br /> <br /> <br /> <img
			src="../img/title5.png"> <br /> <br /> <br />
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
				<td width="15%">借卷单位</td>
				<td width="500" colspan="3" height="">${lendTo}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td width="15%">借卷联系人</td>
				<td width="500" colspan="3" height="">${cManOfLend}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td width="15%">借卷原因</td>
				<td width="500" colspan="3" height="">${lendFileReason}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>借卷时间</td>
				<td width="500">${lendFileTime}</td>
				<td>还卷时间</td>
				<td width="500">${backTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>上诉移送时间</td>
				<td>${appealMoveFileTime}</td>
				<td>回卷时间</td>
				<td>${appealBackFileTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td width="15%">移送单位</td>
				<td width="500" colspan="3" height="">${moveTo}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td width="15%">移送原因</td>
				<td width="500" colspan="3" height="">${moveReason}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td width="15%">备注</td>
				<td width="500" colspan="3" height="">${moveMemo}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>移送时间</td>
				<td colspan="3">${moveTime}</td>
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
		<br /> <br /> <br /> <br /> <br /> <br /> <img
			src="../img/foot.jpg">
	</div>
	<!--endprint-->

	<div align="center">
		<a class="btn btn-success" onClick="doPrint()">打 印 报 表</a>
	</div>
</body>
</html>

