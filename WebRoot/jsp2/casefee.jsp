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

<s:set name="caseID" value="#casefee.caseID"></s:set>
<s:set name="legalCost" value="#casefee.legalCost"></s:set>
<s:set name="maintainCost" value="#casefee.maintainCost"></s:set>
<s:set name="transactCost" value="#casefee.transactCost"></s:set>
<s:set name="shouldCost" value="#casefee.shouldCost"></s:set>
<s:set name="costRecieved" value="#casefee.costRecieved"></s:set>
<s:set name="costRemain" value="#casefee.costRemain"></s:set>
<s:set name="name" value="#clientname"></s:set>


</head>
<body>
    <div class="alert alert-info">当前位置<b class="tip"></b>报表<b class="tip"></b>案件收费单</div>
     <!--startprint-->
    <div id="s2"><img src="../img/logol.png">
    <br />
    <br />
    <br />
    <img src="../img/title4.png">
    <br />
    <br />
    <br />
    <br /></div>
     <p><b><font size="3">尊敬的${name}先生（女士）：</font></b></p>
    <br />
    <p><b><font size="3">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp您好！</font></b></p>
    <br />
    <p><b><font size="3">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp您在本律师事务所办理的业务需交纳以下费用：</font></b></p>
    <br />
	<table class="table table-striped table-bordered table-condensed list">
        <thead>
            <tr>
            </tr>
        </thead>
        <tbody>
        	<tr>
                <td >案件编号</td>
                <td width="500" colspan="3"> ${caseID}                  
                </td>
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
             <tr>
                <td width="15%">诉讼费</td>
                <td width="500">${legalCost}

                </td>
                <td width="500">保全费</td>
                <td width="500">${maintainCost}

            </tr>
            <tr height="15"><td colspan="4"></td></tr>
            <tr>
                <td>办案费</td>
                <td>${transactCost}

                <td>应收费</td>
                <td>${shouldCost}
                    
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
            <tr>
                <td>欠费</td>
                <td>${costRecieved}

                </td>
                <td>已收费</td>
                <td>${costRemain}
                    
            </tr>
            <tr height="15"><td colspan="4"></td></tr>
        </tbody>
        <tfoot>
        </tfoot>
    </table>
    <br />
    <p><b><font size="3">请您按时缴纳费用，以便我们可以更好地为您服务，谢谢！</font></b></p>
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

