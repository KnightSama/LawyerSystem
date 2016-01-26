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
		$('#name').tooltip({
			title : '��ʦ����'
		});
		$('#workTime1').tooltip({
			title : '��������'
		});
		$('#workTime2').tooltip({
			title : '��������'
		});
		$('#inTime1').tooltip({
			title : '��������'
		});
		$('#inTime2').tooltip({
			title : '��������'
		});
		$('#contractTime').tooltip({
			title : '��ͬ����'
		});
		$('#work').tooltip({
			title : 'ְλ'
		});
		$('#typeWork').tooltip({
			title : '���'
		});
	})
</script>
    
<script type="text/javascript">
	$(function() {
		$('#find').click(function() {
			$("#form1").submit();
		})

		$('#clear').click(function() {
			$('#name').val('');
			$('#workTime1').val('');
			$('#workTime2').val('');
			$('#inTime1').val('');
			$('#inTime2').val('');
			$('#contractTime').val('');
            document.getElementById("work").options[2].selected='selected';
            document.getElementById("typeWork").options[3].selected='selected';
		})

	})
</script>

<script>
	function changePage(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "showemployee";
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
					document.forms.form2.action = "deleteemployee";
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
		document.forms.form2.action = "jumpeditemployee";
		document.forms.form2.submit();
	}
	function lookV(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "lookemployee";
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
				document.forms.form2.action = "showemployee";
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
				document.forms.form2.action = "showemployee";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
	<s:if test="#result =='editfail'">
		<script type="text/javascript">
			$(function() {
				document.forms.form2.action = "showemployee";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
</s:if>

<s:set name="name" value="#employeefind.name"></s:set>
<s:set name="workTime1" value="#employeefind.workTime1"></s:set>
<s:set name="workTime2" value="#employeefind.workTime2"></s:set>
<s:set name="inTime1" value="#employeefind.inTime1"></s:set>
<s:set name="inTime2" value="#employeefind.inTime2"></s:set>
<s:set name="contractTime" value="#employeefind.contractTime"></s:set>
<s:set name="work" value="#employeefind.work"></s:set>
<s:set name="typeWork" value="#employeefind.typeWork"></s:set>

<script type="text/javascript">
	$(function() {
		var opts = document.getElementById("work");
		var value = "${work}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}

		var opts = document.getElementById("typeWork");
		var value = "${typeWork}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}
	})
</script>

</head>
<body>
    <div></div>
    <table class="table table-striped table-bordered table-condensed">
    <form id="form1" action="findemployee" method="post">
        <thead>
            <tr>
                <td colspan="6" class="auto-style2">&nbsp;����д��ѯ����(�粻��д�򷵻�ȫ����¼) </td>
            </tr>
        </thead>
        <tbody>
		    <tr>
                <td>��ʦ����:</td>
                <td class="detail">
                    <input id="name" name="name" value="${name}"/>
                </td>
                <td>������ʼʱ��:</td>
                <td  <div class="input-append">
                        <input class="span2 datepicker" size="16" type="text" id="workTime1" name="workTime1" value="${workTime1}"/><span class="add-on"><i class="icon-calendar"></i></span>��<input id="workTime2" class="span2 datepicker" size="16" type="text" name="workTime2" value="${workTime2}"/><span class="add-on"><i class="icon-calendar"></i></span>
                    </div>
                </td>
            </tr>
			<tr>
			    <td>����˾ʱ��:</td>
                <td  <div class="input-append">
                        <input class="span2 datepicker" size="16" type="text" id="inTime1" name="inTime1" value="${inTime1}"/><span class="add-on"><i class="icon-calendar"></i></span>��<input id="inTime2" class="span2 datepicker" size="16" type="text" name="inTime2" value="${inTime2}"/><span class="add-on"><i class="icon-calendar"></i></span>
                    </div>
                </td>
                <td>��ͬ����</td>
                <td class="detail">
                    <input id="contractTime" name="contractTime" value="${contractTime}"/>
                </td>
                
            </tr>
			<tr>
                <td>ְλ</td>
                <td>
                   <select name="work" id="work">
                        <option value="��ʦ">��ʦ</option>
                        <option value="��ʦ����">��ʦ����</option>
                        <option selected="selected"></option>
                    </select></td>
                <td>���</td>
                <td>
                    <select name="typeWork" id="typeWork" >
                        <option value="�ɲ�">�ɲ�</option>
                        <option value="ְ��">ְ��</option>
						<option value="ʵϰ��">ʵϰ��</option>
                        <option selected="selected"></option>
                    </select></td>
            </tr>
			
            <tr>
                <td colspan="6" align="right">
                    <input class="btn btn-inverse" id="find" type="button" value="��ѯ" />
                    <input class="btn btn-inverse" type="button" id="clear" value="���" /></td>
            </tr>
        </tbody>
    </table>
    </form>


    <table class="table table-striped table-bordered table-condensed" id="list">
        <thead>
            <tr class="tr_detail">
                <td>��ʦ��� </td>
                <td>����</td>
                <td>�Ա�</td>
                <td>����</td>
                <td>��ͥסַ</td>
				<td>�ֻ�</td>
				<td>������ʼʱ��</td>
				<td>����˾ʱ��</td>
				<td>���</td>
            </tr>
        </thead>
        <tbody>
            <s:set name="list" value="#resultlist" />
			<s:iterator id="resu" value="list">
				<tr>
					<td><s:property value="lawyerID" /> </a></td>
					<td><s:property value="name" />
					</td>
					<td><s:property value="sex" />
					</td>
					<td><s:property value="nation" />
					</td>
					<td><s:property value="homeAddress" />
					</td>
					<td><s:property value="mobile" />
					</td>
					<td><s:property value="workTime" />
					</td>
					<td><s:property value="inTime" />
					</td>
					<td><s:property value="typeWork" />
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
