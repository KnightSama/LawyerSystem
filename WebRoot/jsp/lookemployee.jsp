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
            $('.modal').show();
			
			$(".datepicker").datepicker();
        })
        
        function editV(obj) {
		document.forms.form.action = "jumpeditemployee";
		document.forms.form.submit();
	}
	function backV(obj) {
		document.forms.form.action = "showemployee";
		document.forms.form.submit();
	}
    </script>
    <s:set name="lawyerID" value="#employee.lawyerID"></s:set>
<s:set name="name" value="#employee.name"></s:set>
<s:set name="nation" value="#employee.nation"></s:set>
<s:set name="birthArea" value="#employee.birthArea"></s:set>
<s:set name="education" value="#employee.education"></s:set>
<s:set name="graduate" value="#employee.graduate"></s:set>
<s:set name="graduateTime" value="#employee.graduateTime"></s:set>
<s:set name="workTime" value="#employee.workTime"></s:set>
<s:set name="inTime" value="#employee.inTime"></s:set>
<s:set name="contractTime" value="#employee.contractTime"></s:set>
<s:set name="cardID" value="#employee.cardID"></s:set>
<s:set name="baseSalary" value="#employee.baseSalary"></s:set>
<s:set name="workSalary" value="#employee.workSalary"></s:set>
<s:set name="allowance" value="#employee.allowance"></s:set>
<s:set name="homeAddress" value="#employee.homeAddress"></s:set>
<s:set name="homeTel" value="#employee.homeTel"></s:set>
<s:set name="mobile" value="#employee.mobile"></s:set>
<s:set name="memo" value="#employee.memo"></s:set>
<s:set name="sex" value="#employee.sex"></s:set>
<s:set name="work" value="#employee.work"></s:set>
<s:set name="typeWork" value="#employee.typeWork"></s:set>
<s:set name="clientNumber" value="#employee.clientNumber"></s:set>
<s:set name="health" value="#employee.health"></s:set>
<s:set name="marrage" value="#employee.marrage"></s:set>
<s:set name="creditLevel" value="#employee.creditLevel"></s:set>
    
    
    <s:set name="topage" value="#topage"></s:set>
<s:set name="showMany" value="#showMany"></s:set>
</head>
<body>
    <div class="alert alert-info">��ǰλ��<b class="tip"></b>ά������<b class="tip"></b>�޸�</div>

    <table class="table table-striped table-bordered table-condensed list">
        <thead>
            <tr>
                <td colspan="4"><b>��ʦ������Ϣ</b></td>
            </tr>
        </thead>
        <tbody>
		<tr>
                <td width="15%">��ʦ���</td>
                <td width="500" colspan="3" height="">${lawyerID}
                </td>
            </tr>
            <tr>
                <td width="15%">����</td>
                <td width="500">${name}
                </td>
                <td width="500">�Ա�</td>
                <td width="500">${sex}</td>
            </tr>
            <tr>
                <td>����</td>
                <td>${nation}
                <td>������</td>
                <td>${birthArea}
            </tr>
             <tr>
                <td>�Ļ��̶�</td>
                <td>${education}
                <td>��ҵԺУ</td>
                <td>${graduate}</td>
            </tr>
            <tr>
                <td>��ҵʱ��</td>
                <td>${graduateTime}</td>
                <td>������ʼʱ��</td>
                <td>${workTime}</td>
            </tr>
            <tr>
                <td>����˾ʱ��</td>
                <td>${inTime}</td>
                <td>��ͬ����</td>
                <td>${contractTime}</td>
            </tr>
            <tr>
                <td>ְλ</td>
                <td>${work}</td>
                <td>���</td>
                <td>${typeWork}</td>
            </tr>
             <tr>
                <td>����״��</td>
                <td>${health}</td>
                <td>���֤��</td>
                <td>${cardID}</td>
            </tr>
             <tr>
                <td>��������</td>
                <td>${baseSalary}</td>
                <td>��λ����</td>
                <td>${workSalary}</td>
            </tr>
            <tr>
                <td>����</td>
                <td>${allowance}</td>
                <td>����״��</td>
                <td>${marrage}</td>
            </tr>
            <tr>
                <td>��ͥסַ</td>
                <td>${homeAddress}</td>
                <td>��ͥ�绰</td>
                <td>${homeTel}</td>
            </tr>
            <tr>
                <td>�ֻ�</td>
                <td>${mobile}</td>
                <td>��������</td>
                <td>${creditLevel}</td>
            </tr>
            <tr>
                <td width="15%">����Ŀͻ���</td>
                <td width="500" colspan="3" height="">${clientNumber}            
                </td>
            </tr>			
            <tr>
                <td width="15%">��ע</td>
                <td width="500" colspan="3" height=""> ${memo}           
                </td>
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
				type="hidden" id="checkbutton" name="buttonName" value="${lawyerID}"><input
				type="hidden" id="topage" name="topage" value="${topage}"><input
					type="hidden" id="showMany" name="showMany" value="${showMany}">
		</div>
	</form>
</body>
</html>

