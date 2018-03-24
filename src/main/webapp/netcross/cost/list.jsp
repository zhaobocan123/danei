<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/netcross/css/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/netcross/css/global_color.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath }/netcross/js/jquery-1.4.3.js"></script>
        <script language="javascript" type="text/javascript">
        
        		//分页
        function getPage(page ) {
        	$("#page").val(page);
			alert(page);
			$("#form").submit();
		}
        		
        		
        		
            //排序按钮的点击事件
            function sort(btnObj) {
            
                if (btnObj.className == "sort_desc"){
                    btnObj.className = "sort_asc";
               		$("#pai_sort").val("正序");
               		$("#name_sort").val(btnObj.value);
                	alert($("#pai_sort").val()); 
                	alert($("#name_sort").val()); 
                	$("#form").submit();
               
                }else{
                    btnObj.className = "sort_desc";
                    $("#pai_sort").val("倒序");
                    $("#name_sort").val(btnObj.value);
                	alert($("#pai_sort").val());
                	alert($("#name_sort").val()); 
                	$("#form").submit();
                }
                	
            }

            //启用
            function startCost(id) {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                if(r)
                {
                	$.post(
                		"startCost.action",
                		{"id":id},
                		function(data){
                			var msg="";
                			if(data)
                			{
                				msg="资费启用成功";
                			}
                			else
                			{
                				msg="资费启用失败";
                			}
                			$("#msg").text(msg);
                			$("#operate_result_info").show();
                			setTimeout(
                				function(){
                					var page=$("#page").val();
                					window.location.href="findCost.action?page="+page;
                				},
                				1500
                			);
                		}
                	);
                }
                //document.getElementById("operate_result_info").style.display = "block";
            }
            //删除
            function deleteCost(id) {
                var r = window.confirm("确定要删除此资费吗？");
                if(r)
                {
                	//document.getElementById("operate_result_info").style.display = "block";
                 	//window.location.href="deleteCost.action?id="+id;
                 	$.post(
                		"deleteCost.action",
                		{"id":id},
                		function(data){
                			var msg="";
                			if(data)
                			{
                				msg="删除启用成功";
                			}
                			else
                			{
                				msg="删除启用失败";
                			}
                			$("#msg").text(msg);
                			$("#operate_result_info").show();
                			setTimeout(
                				function(){
                					var page=$("#page").val();
                					window.location.href="findCost.action?page="+page;
                				},
                				1500
                			);
                		}
                	);
                }
            }
        </script>        
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="${pageContext.request.contextPath }/netcross/img/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="../login/index.jsp" class="index_off"></a></li>
                <li><a href="../role/list.jsp" class="role_off"></a></li>
                <li><a href="../admin/list.jsp" class="admin_off"></a></li>
                <li><a href="list.jsp" class="fee_on"></a></li>
                <li><a href="../account/list.jsp" class="account_off"></a></li>
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
            <form name="form" id="form" action="listCost.do" method="post">
                <!--排序-->
                <div class="search_add">
                    <div>
                    <input type="hidden" name="name_sort" id="name_sort" >
                    <input type="hidden" name="pai_sort" id="pai_sort" >
                     <input type="hidden" name="page" id="page">
                        <input type="button" value="月租" class="sort_asc"  onclick="sort(this);" />
                        <input type="button" value="基费" class="sort_asc"  onclick="sort(this);" />
                        <input type="button" value="时长" class="sort_asc"  onclick="sort(this);" />
                    </div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddCost.action';" />
                </div> 
                <!--启用操作的操作提示-->
               
               <!--  <s:hidden name="page"  id="page"></s:hidden> -->
                <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath }/netcross/img/close.png" onclick="this.parentNode.style.display='none';" />
                    <span id="msg"></span>
                </div>    
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>资费ID</th>
                            <th class="width100">资费名称</th>
                            <th>基本时长</th>
                            <th>基本费用</th>
                            <th>单位费用</th>
                            <th>创建时间</th>
                            <th>开通时间</th>
                            <th class="width50">状态</th>
                            <th class="width200"></th>
                        </tr>   
                        <c:forEach items="${cost }" var="h">
                        <tr>
                            <td>${h.id }</td>
                            <td><a href="toCostDetail.action?id=1">长城宽带</a></td>
                            <td>${h.baseDuration }</td>
                            <td>${h.baseCost}</td>
                            <td>${h.status }</td>
                            <td>${h.status }</td>
                            <td>${h.status }</td>
                            <td>
                            	开通
                            </td>
                            <td>
                                <input type="button" value="启用" class="btn_start" onclick='startCost(1);' />
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='toModifyCost?id=1';" />
                                <input type="button" value="删除" class="btn_delete" onclick='deleteCost(1);' />
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <p>业务说明：<br />
                    1、创建资费时，状态为暂停，记载创建时间；<br />
                    2、暂停状态下，可修改，可删除；<br />
                    3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br />
                    4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
                    </p>
                </div>
                <!--分页-->
                <div id="pages">
            		<a href="#">上一页</a>
            		<a href="#" onclick="getPage(1)" class="current_page">${map.PageUtil.totalRows }</a>
	 				<a href="#" onclick="getPage(2)">${map.PageUtil.totalPage }</a>
            		<a href="#">下一页</a>
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
