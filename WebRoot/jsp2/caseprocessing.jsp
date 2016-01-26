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

<s:set name="caseID" value="#caseprocessing.caseID"></s:set>
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

</head>
<body>
	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>����<b class="tip"></b>��������
	</div>
	<!--startprint-->
	<div id="s2">
		<img src="../img/logol.png"> <br /> <br /> <br /> <img
			src="../img/title2.png"> <br /> <br /> <br /> <br />
	</div>
	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>�������</td>
				<td width="500" colspan="3">${caseID}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>�ʹ�</td>
				<td width="500">${service}</td>
				<td>����</td>
				<td width="500">${bullentinTime}</td>

			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>��ͥʱ��</td>
				<td>${sittingTime}</td>
				<td>��������</td>
				<td>${singleInquisition}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td width="15%">��������</td>
				<td width="500" colspan="3" height="">${joinInquisition}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>��������ʱ��</td>
				<td>${adjournmentTime}</td>
				<td>ͥ������ʱ��</td>
				<td>${adjPrecidingJudgeTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>Ժ������ʱ��</td>
				<td>${adjDeanTime}</td>
				<td>��Ժ����ʱ��</td>
				<td>${adjIntermediateTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>�鵵ʱ��</td>
				<td colspan="3">${fileTime}</td>
			</tr>
			<tr height="15">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td width="15%">��ע</td>
				<td width="500" colspan="3" height="">${memo}</td>
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
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <img
			src="../img/foot.jpg">
	</div>
	<!--endprint-->

	<div align="center">
		<a class="btn btn-success" onClick="doPrint()">�� ӡ �� ��</a>
	</div>
</body>
</html>

