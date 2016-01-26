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
			title : '律师姓名'
		});
		$('#workTime1').tooltip({
			title : '区间下限'
		});
		$('#workTime2').tooltip({
			title : '区间上限'
		});
		$('#inTime1').tooltip({
			title : '区间下限'
		});
		$('#inTime2').tooltip({
			title : '区间上限'
		});
		$('#contractTime').tooltip({
			title : '合同期限'
		});
		$('#work').tooltip({
			title : '职位'
		});
		$('#typeWork').tooltip({
			title : '身份'
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
			title : '系统提示', //标题
			content : '确认要删除这条记录吗?', //提示文字信息
			modal : true, //模式，开关灯
			draggable : false,
			buttons : [ {
				id : 'yes',
				name : '确定',
				callback : function() {
					document.getElementById("checkbutton").value = obj.id;
					document.forms.form2.action = "deleteemployee";
					document.forms.form2.submit();
				}
			}, {
				id : 'no',
				name : '取消',
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
					title : '系统提示', //标题
					content : '抱歉，没有找到符合的结果！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
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
					title : '系统提示', //标题
					content : '删除成功！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
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
					title : '系统提示', //标题
					content : '编辑成功！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
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
                <td colspan="6" class="auto-style2">&nbsp;请填写查询条件(如不填写则返回全部记录) </td>
            </tr>
        </thead>
        <tbody>
		    <tr>
                <td>律师姓名:</td>
                <td class="detail">
                    <input id="name" name="name" value="${name}"/>
                </td>
                <td>工作开始时间:</td>
                <td  <div class="input-append">
                        <input class="span2 datepicker" size="16" type="text" id="workTime1" name="workTime1" value="${workTime1}"/><span class="add-on"><i class="icon-calendar"></i></span>至<input id="workTime2" class="span2 datepicker" size="16" type="text" name="workTime2" value="${workTime2}"/><span class="add-on"><i class="icon-calendar"></i></span>
                    </div>
                </td>
            </tr>
			<tr>
			    <td>进公司时间:</td>
                <td  <div class="input-append">
                        <input class="span2 datepicker" size="16" type="text" id="inTime1" name="inTime1" value="${inTime1}"/><span class="add-on"><i class="icon-calendar"></i></span>至<input id="inTime2" class="span2 datepicker" size="16" type="text" name="inTime2" value="${inTime2}"/><span class="add-on"><i class="icon-calendar"></i></span>
                    </div>
                </td>
                <td>合同期限</td>
                <td class="detail">
                    <input id="contractTime" name="contractTime" value="${contractTime}"/>
                </td>
                
            </tr>
			<tr>
                <td>职位</td>
                <td>
                   <select name="work" id="work">
                        <option value="律师">律师</option>
                        <option value="律师助理">律师助理</option>
                        <option selected="selected"></option>
                    </select></td>
                <td>身份</td>
                <td>
                    <select name="typeWork" id="typeWork" >
                        <option value="干部">干部</option>
                        <option value="职工">职工</option>
						<option value="实习生">实习生</option>
                        <option selected="selected"></option>
                    </select></td>
            </tr>
			
            <tr>
                <td colspan="6" align="right">
                    <input class="btn btn-inverse" id="find" type="button" value="查询" />
                    <input class="btn btn-inverse" type="button" id="clear" value="清空" /></td>
            </tr>
        </tbody>
    </table>
    </form>


    <table class="table table-striped table-bordered table-condensed" id="list">
        <thead>
            <tr class="tr_detail">
                <td>律师编号 </td>
                <td>姓名</td>
                <td>性别</td>
                <td>民族</td>
                <td>家庭住址</td>
				<td>手机</td>
				<td>工作开始时间</td>
				<td>进公司时间</td>
				<td>身份</td>
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
					<td colspan="100">共<s:property value="#pageNum" />页&nbsp;&nbsp;共<s:property
							value="#resultNum" />条记录&nbsp;&nbsp;<a
						class="badge badge-inverse" id="firstpage"
						onclick='changePage(this)'>首页</a>&nbsp; <a
						class="badge badge-inverse" id="prepage"
						onclick='changePage(this)'>上一页</a>&nbsp; <a
						class="badge badge-warning">&nbsp;&nbsp;&nbsp;&nbsp;第<s:property
								value="#nowPage" />页&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp; <a
						class="badge badge-inverse" id="nextpage"
						onclick='changePage(this)'>下一页</a>&nbsp; <a
						class="badge badge-inverse" id="lastpage"
						onclick='changePage(this)'>尾页</a>&nbsp;&nbsp;&nbsp;&nbsp; 跳转到<input
						id="topage" name="topage" style="width:30px;">页&nbsp;&nbsp
						<a class="badge badge-inverse" id="jump"
						onclick='changePage(this)'>跳转</a>&nbsp;&nbsp;&nbsp;&nbsp; 每页显示<input
						id="showMany" name="showMany" style="width:30px;">条记录&nbsp;&nbsp
						<a class="badge badge-inverse" id="refresh"
						onclick='changePage(this)'>刷新</a> <input type="hidden"
						id="checkbutton" name="buttonName"></td>
				</form>
			</tr>
        </tbody>
    </table>
</body>
</html>
