<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../css/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../css/global_color.css" /> 
       	<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
        <script language="javascript" type="text/javascript">
            //删除
            function deleteAccount(id) {
                var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
                if(r)
                {
                	window.location.href="deleteAccount.action?id="+id;
                }
                document.getElementById("operate_result_info").style.display = "block";
            }
            //开通或暂停
            function setState() {
                var r = window.confirm("确定要开通此账务账号吗？");
                document.getElementById("operate_result_info").style.display = "block";
            }
            //提交表单
            function toPage(page)
            {
            	var number=parseInt(page);
            	document.getElementById("page").value=number;
            	document.getElementById("searchForm").submit();
            }
            //开启账务账号
            function startAccount(id)
            {
            	 var r = window.confirm("确定要开通此账务账号吗？");
            	 if(!r) return;
      			 $.post(
	      			 "startAccount.action",
	      			 {"id":id},
	      			 function(data){
	      			 	var msg="";
	      			 	if(data)
	      			 	{
	      			 		msg="开启成功";
	      			 	}
	      			 	else
	      			 	{
	      			 		msg="开启失败";
	      			 	}
	      			 	$("#operMsg").text(msg);
	      			 	$("#operate_result_info").show();
	      			 	var page=$("#page").val();
	      			 	setTimeout(function(){
	      			 		toPage(page);
	      			 	},1500);
	      			 }
      			 );
            }
            //暂停账务账号
            function pauseAccount(id)
            {
            	 var r = window.confirm("确定要暂停此账务账号吗？");
            	 if(!r) return;
            	 $.post(
	            	 "pauseAccount.action",
	            	 {"id":id},
	            	 function(data){
	            	 var msg="";
	            	 	if(data)
	            	 	{
	            	 		msg="暂停成功";
	            	 	}
	            	 	else
	            	 	{
	            	 		msg="暂停失败";
	            	 	}
	            	 	$("#operMsg").text(msg);
	      			 	$("#operate_result_info").show();
	      			 	var page=$("#page").val();
	      			 	setTimeout(function(){
	      			 		toPage(page);
	      			 	},1500);
	            	 }
            	 );
            }
            //删除账务账号
            function deleteAccount(id)
            {
            	 var r = window.confirm("确定要删除此账务账号吗？");
            	 if(!r) return;
            	 $.post(
	            	 "deleteAccount.action",
	            	 {"id":id},
	            	 function(data){
	            	 var msg="";
	            	 	if(data)
	            	 	{
	            	 		msg="删除成功";
	            	 	}
	            	 	else
	            	 	{
	            	 		msg="删除失败";
	            	 	}
	            	 	$("#operMsg").text(msg);
	      			 	$("#operate_result_info").show();
	      			 	var page=$("#page").val();
	      			 	setTimeout(function(){
	      			 		toPage(page);
	      			 	},1500);
	            	 }
            	 );
            }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../img/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
               <li><a href="../login/index.jsp" class="index_off"></a></li>
                <li><a href="../role/list.jsp" class="role_off"></a></li>
                <li><a href="../admin/list.jsp" class="admin_off"></a></li>
                <li><a href="../cost/list.jsp" class="fee_off"></a></li>
                <li><a href="list.jsp" class="account_on"></a></li>
                <li><a href="../service/list.jsp" class="service_off"></a></li>
                <li><a href="#" class="bill_off"></a></li>
                <li><a href="#" class="report_off"></a></li>
                <li><a href="#" class="information_off"></a></li>
                <li><a href="#" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="" method="post" id="searchForm">
                <!--查询-->
               	<input type="hidden" id="page" name="page" />
                <div class="search_add">                        
                    <div>
                    	身份证：<input type="text" name="idcardNo" class="text_search" />
                    </div>                            
                    <div>姓名：<input type="text" name="realName" class="width70 text_search"></div>
                    <div>登录名：<input type="text" name="loginName" class="text_search"/></div>
                    <div>
                     	   状态：
                     	   <select name="status">
                     	   		<option value="-1">全部</option>
                     	   		<option value="0">开通</option>
                     	   		<option value="1">暂停</option>
                     	   		<option value="2">删除</option>
                     	   </select>
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" onclick="toPage(1);"/></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddAcount.action';" />
                </div>  
                <!--删除等的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../img/close.png" onclick="this.parentNode.style.display='none';" />
               	    <span id="operMsg">删除成功，且已删除其下属的业务账号！</span>
                </div>   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th>账号ID</th>
                        <th>姓名</th>
                        <th class="width150">身份证</th>
                        <th>登录名</th>
                        <th>状态</th>
                        <th class="width100">创建日期</th>
                        <th class="width150">上次登录时间</th>                                                        
                        <th class="width200"></th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="toAccountDetail.action?realname=tom">tom</a></td>
                        <td>123456</td>
                        <td>tom123</td>
                        <td>开通</td>
                        <td>2018-01-01</td>
                        <td>2018-01-02</td>                            
                        <td class="td_modi">
                        	<!--
                            	作者：offline
                            	时间：2018-02-13
                            	描述：状态为0
                            -->
	                         	<!--<input type="button" value="暂停" class="btn_pause" onclick="pauseAccount(1);" />
	                            <input type="button" value="修改" class="btn_modify" onclick="location.href='toModifyAccount.action?id=1';" />
	                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(1);" />-->
	                        <!--
                            	作者：offline
                            	时间：2018-02-13
                            	描述：状态为1
                            -->
	                        	<input type="button" value="开通" class="btn_start" onclick="startAccount(1);" />
	                            <input type="button" value="修改" class="btn_modify" onclick="location.href='toModifyAccount.action?id=1';" />
	                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(1);" />
                       </td>
                    </tr>
                </table>
                <p>业务说明：<br />
                1、创建则开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、暂停账务账号，同时暂停下属的所有业务账号；<br />                
                6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br />
                7、删除账务账号，同时删除下属的所有业务账号。</p>
                </div>                   
                <!--分页-->
                <div id="pages">
                    <a href="javascript:toPage(1);">首页</a>
                    <a href="#">上一页</a>
                    <a href="javascript:toPage(1);" class="current_page">1</a>
                    <a href="javascript:toPage(2);">2</a>
                    <a href="#">下一页</a>
                    <a href="javascript:toPage(<s:property value='totalPages'/>);">末页</a>
                </div>                     
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北网的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有&copy;北京网络职业学院 </p>
        </div>
    </body>
</html>
