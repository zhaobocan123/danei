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
            //显示角色详细信息
            function showDetail(flag, a) {
                var detailDiv = a.parentNode.getElementsByTagName("div")[0];
                if (flag) {
                    detailDiv.style.display = "block";
                }
                else
                    detailDiv.style.display = "none";
            }
            //删除
            function deleteAccount() {
                var r = window.confirm("确定要删除此业务账号吗？删除后将不能恢复。");
                document.getElementById("operate_result_info").style.display = "block";
            }
            //开通或暂停
            function setState() {
                var r = window.confirm("确定要开通此业务账号吗？");
                document.getElementById("operate_result_info").style.display = "block";
            }
            //页面的分页及联合搜索
            function search(page)
            {
            	$("#page").val(page);
            	$("#searchServiceForm").submit();
            }
            //暂停业务账号
            function pauseService(id)
            {
            	var r= window.confirm("确定要暂停此业务账号吗？");
            	if(!r)
            	{
            		return;
            	}
            	$.post(
            			"pauseService.action",
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
            				setTimeout(
            				function(){
            					search(page);
            				},1500);
            			}
            	);
            }
             //开通业务账号
            function startService(id,accountId)
            {
            	var r= window.confirm("确定要开通此业务账号吗？");
            	if(!r)
            	{
            		return;
            	}
            	$.post(
            			"startService.action",
            			{"id":id,"accountId":accountId},
            			function(data){
            			var msg="";
            				if(data)
            				{
            					msg="开通成功";
            				}
            				else
            				{
            					msg="对应的账务账号已暂停或删除,不能进行此项操作";
            				}
            				$("#operMsg").text(msg);
            				$("#operate_result_info").show();
            				var page=$("#page").val();
            				setTimeout(
            				function(){
            					search(page);
            				},1500);
            			}
            	);
            }
            //删除业务账号
            function deleteService(id)
            {
            	var r= window.confirm("确定要删除此业务账号吗？");
            	if(!r)
            	{
            		return;
            	}
            	$.post(
            			"deleteService.action",
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
            				setTimeout(
            				function(){
            					search(page);
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
                <li><a href="../account/list.jsp" class="account_off"></a></li>
                <li><a href="list.jsp" class="service_on"></a></li>
                <li><a href="#" class="bill_off"></a></li>
                <li><a href="#" class="report_off"></a></li>
                <li><a href="#" class="information_off"></a></li>
                <li><a href="#" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="findService.action" method="post" id="searchServiceForm">
                <!--查询-->
                <div class="search_add">
                	<input type="hidden" name="page" id="page" />
                    <div>
                    	OS 账号：<input type="text" name="osUserName" class="width100 text_search"/>
                    </div>                            
                    <div>
                    	服务器 IP：<input type="text" name="unixHost" class="width100 text_search"/>
                    </div>
                    <div>
                    	身份证：<input type="text" name="idCardNo" class="text_search"/>
                    </div>
                    <div>状态：
                    	<select name="status">
                    		<option value="-1">全部</option>
                    		<option value="0">开通</option>
                    		<option value="1">暂停</option>
                    		<option value="2">删除</option>
                    	</select>
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" onclick="search(1);"/></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddService.action';" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../img/close.png" onclick="this.parentNode.style.display='none';" />
                    <span id="operMsg">删除成功</span>
                </div>   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th class="width50">业务ID</th>
                        <th class="width70">账务账号ID</th>
                        <th class="width150">身份证</th>
                        <th class="width70">姓名</th>
                        <th>OS 账号</th>
                        <th class="width50">状态</th>
                        <th class="width100">服务器 IP</th>
                        <th class="width100">资费</th>                                                        
                        <th class="width200"></th>
                    </tr>
                    <tr>
                        <td><a href="toServiceDetail.action?id=1" title="查看明细">1</a></td>
                        <td>123</td>
                        <td>456</td>
                        <td>tom</td>
                        <td>tom123</td>
                        <!--<c:if test="status==0"><td>开通</td></c:if>
                        <c:if test="status==1"><td>暂停</td></c:if>
                        <c:if test="status==2"><td>删除</td></c:if>-->
                        <td>开通</td>
                        <td>127.0.0.1</td>
                        <td>
                            <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">宽带</a>
                            <!--浮动的详细信息-->
                            <div class="detail_info">
                             	经济实惠,好好好
                            </div>
                        </td>                            
                        <td class="td_modi">
                        	<!--<c:if test="status==0">
	                        	<input type="button" value="暂停" class="btn_pause" onclick="pauseService(1);" />
	                            <input type="button" value="修改" class="btn_modify" onclick="location.href='toModifyService.action?id=1';" />
	                            <input type="button" value="删除" class="btn_delete" onclick="deleteService(1);" />
                        	</c:if>
                        	<c:if test="status==1">
                        		<input type="button" value="开通" class="btn_start" onclick="startService(1,123);" />
                           	    <input type="button" value="修改" class="btn_modify" onclick="location.href='toModifyService.action?id=1';" />
                                <input type="button" value="删除" class="btn_delete" onclick="deleteService(1);"/>
                        	</c:if>
                        	<c:if test="status==2">
                        	</c:if>-->
                        	<input type="button" value="暂停" class="btn_pause" onclick="pauseService(1);" />
	                        <input type="button" value="修改" class="btn_modify" onclick="location.href='toModifyService.action?id=1';" />
	                        <input type="button" value="删除" class="btn_delete" onclick="deleteService(1);" />
                        </td>
                    </tr>
                </table>                
                <p>业务说明：<br />
                1、创建即开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、业务账号不设计修改密码功能，由用户自服务功能实现；<br />
                6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p>
                </div>                    
                <!--分页-->
                <div id="pages">
                   
                    
                    <a href="javascript:search(1);">首页</a>
        	        <a href="#">上一页</a>
	                <a href="javascript:search(1);" class="current_page">1</a>
	                <a href="javascript:search(2);" >2</a>
                    <a href="#">下一页</a>
                    <a href="javascript:search(10);">末页</a>
                </div>                    
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北网的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有 &copy;北京网络职业学院 </p>
        </div>
    </body>
</html>

