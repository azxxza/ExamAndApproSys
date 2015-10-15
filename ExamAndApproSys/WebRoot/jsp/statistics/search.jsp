<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/jsp/common/meta.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui_1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui_1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui_1.4.3/demo.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui_1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui_1.4.3/jquery.easyui.min.js"></script>
<script language="javascript">
</script>
</head>
<body>
	<h2>Search Category</h2>
    <p>Select a category and click search button or press enter key in input box to do searching.</p>
    <div style="margin:20px 0;"></div>
    <input class="easyui-searchbox" data-options="prompt:'Please Input Value',menu:'#mm',searcher:doSearch" style="width:300px"></input>
    <div id="mm">
        <div data-options="name:'all',iconCls:'icon-ok'">姓名</div>
         <div data-options="name:'all',iconCls:'icon-ok'">按团组</div>
          <div data-options="name:'all',iconCls:'icon-ok'">按单位</div>
        <div data-options="name:'sports'">出访国（地）</div>
    </div>
    <script>
        function doSearch(value,name){
            alert('You input: ' + value+'('+name+')');
        }
    </script>
 
</body>
</html>
