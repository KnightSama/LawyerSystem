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

</head>
<body>
    <div class="alert alert-info">当前位置<b class="tip"></b>报表<b class="tip"></b>案件开始单</div>
    <!--startprint-->
    <div id="s2"><img src="../img/logol.png">
    <br />
    <br />
    <br />
    <img src="../img/title1.png">
    <br /></div>
    <table class="table table-striped table-bordered table-condensed list" cellspacing="2" cellpadding="2">
        <thead>
        </thead>
        <tbody>
            <tr>
                <td >案件编号</td>
                <td width="500" colspan="3">${caseID}                    
                </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
            <tr>
                <td width="15%">案件性质</td>
                <td width="500">${caseProperty}
                    </td>
                <td width="15%">办案律师</td>
                <td width="500">${lawyerID}
                    </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
            <tr>
                <td>立案时间</td>
                <td>${caseStartTime}
				       <div class="input-append">
                    
					</div>
                <td>结案时间</td>
                <td>${caseHandleTime}
                    <div class="input-append">
                    
					</div></td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
			<tr>
                <td width="15%">案由</td>
                <td width="500" colspan="3" height="">
                    ${caseReason}
                </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
			<tr>
                <td width="15%">原告</td>
                <td width="500" colspan="3" height="">
                    ${indicter}
                </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
			<tr>
                <td width="15%">被告</td>
                <td width="500" colspan="3" height="">
                    ${indictee}
                </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
			<tr>
                <td width="15%">第三人</td>
                <td width="500" colspan="3" height="">
                    ${thirdParty}
                </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
			<tr>
                <td width="15%">诉讼请求</td>
                <td width="500" colspan="3" height="">
                    ${suitRequest}
                </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
			<tr>
                <td>诉讼标的</td>
                <td>
                   ${suitValue}
                </td>
                <td>诉讼费</td>
                <td>${suitCost}
                   </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
			<tr>
                <td width="15%">财产保全</td>
                <td width="500" colspan="3" height="">
                    ${belongingsMaintain}
                </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
            <tr>
                <td width="15%">证据保全</td>
                <td width="500" colspan="3" height="">
                   ${evidenceMaintain}
                </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
			<tr>
                <td width="15%">保全费</td>
                <td width="500" colspan="3" height="">
                    ${maintainCost}
                </td>
            </tr>
        </tbody>
    </table>
    <div id="s3"> <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
   <img src="../img/foot.jpg"></div>
    <!--endprint-->
    
     <div align ="center"><a  class="btn btn-success" onClick="doPrint()">打 印 报 表</a></div>
</body>
</html>

