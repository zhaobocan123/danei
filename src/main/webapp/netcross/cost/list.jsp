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
			
			$("#form").submit();
		}
        		
        		
        		
            //排序按钮的点击事件
            function sort(btnObj) {
          		
            	
           			
                if (btnObj.className == "sort_desc"){
                    btnObj.className = "sort_asc";
               		$("#pai_sort").val("正序");
               		$("#name_sort").val(btnObj.value);
                	
                	$("#form").submit();
               
                }else{
                    btnObj.className = "sort_desc";
                    $("#pai_sort").val("倒序");
                    $("#name_sort").val(btnObj.value);
                	
                	$("#form").submit();
                }
                	
            }

            //启用
            function startCost(id) {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                if(r)
                {
                	var page = $("#page").val();
                	
                	$.post(
                    		"startCost.do",
                    		{"id":id,"page":page},
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
                    					window.location.href="listCost.do?page="+page;
                    				},
                    				1500
                    			);
                    		}
                    	);
                	
                	
                	/* $.post(
                		"startCost.do",
                		{"page":page,"id":idd},
                		function(data){
                			
                		}
                	); */
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
                		"deleteCost.do",
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
                					window.location.href="listCost.do";
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
                    <input type="hidden" name="pai_sort" id="pai_sort"  >
                     <input type="hidden" name="page" id="page" value="${map.PageUtil.currentPage }">
                        <input type="button" value="月租" class="${vo.dian_sort}"  onclick="sort(this);" />
                        <input type="button" value="基费" class="${vo.dian_sort}"  onclick="sort(this);" />
                        <input type="button" value="时长" class="${vo.dian_sort}"  onclick="sort(this);" />
                    </div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddCost.do';" />
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
                            <td><a href="toCostDetail.do?id=${h.id }">长城宽带</a></td>
                            <td>${h.baseDuration }</td>
                            <td>${h.baseCost}</td>
                            <td>${h.unitCost }</td>
                            <td>${h.creatime }</td>
                            <td>${h.startime }</td>
                            <td>
                            	<c:if test="${h.status eq 0 }">暂停</c:if>
                            	<c:if test="${h.status eq 1 }">开通</c:if>
                            	<c:if test="${h.status eq 2 }">删除</c:if>
                            </td>
                            <td>
                                <input type="button" value="启用" class="btn_start" onclick='startCost(${h.id });' />
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='toModifyCost.do?id=${h.id }&page=${map.PageUtil.currentPage }&dian_sort=${vo.dian_sort }&name_sort=${vo.name_sort }';" />
                                <input type="button" value="删除" class="btn_delete" onclick='deleteCost(${h.id });' />
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <p>业务说明：<br />
                    1、创建资费时，状态为暂停，记载创建时间；<br />
                    2、暂停状态下，可修改，可删除；<br />
                    3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br />
                    4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
                    ${vo.name_sort }
                    </p>
                </div>
                <!--分页-->
                <div id="pages">
                	一共${map.PageUtil.totalRows }条数据,共${map.PageUtil.totalPage }页,当前是第${map.PageUtil.currentPage }页
                	<br/>
                	<a href="#" onclick="getPage(1)">首页</a>
                <!-- 	如果当前页为第一页时 就没有上一页这个标签 -->
                	<c:if test="${map.PageUtil.currentPage == 1 }">
          
                		<c:forEach begin="${map.PageUtil.start }" end="${map.PageUtil.end }" step="1" var="i" >
                				<c:if test="${map.PageUtil.currentPage == i }">
                				<a>${i }</a>
                				</c:if>
                				<c:if test="${map.PageUtil.currentPage != i }">
                				<a href="#" onclick="getPage(${i })" class="current_page">${i }</a>
                				</c:if>
                		</c:forEach>
                				<a href="#" onclick="getPage(${map.PageUtil.currentPage +1 })">下一页</a>
                	</c:if>
                	<!-- 	如果当前页不是第一页时也不是最后一页 就有上一页和下一页这个标签 -->
                	<c:if test="${map.PageUtil.currentPage > 1 && map.PageUtil.currentPage < map.PageUtil.totalPage}">
                	
                	<a href="#" onclick="getPage(${map.PageUtil.currentPage -1 })">上一页</a>
                	<c:forEach begin="${map.PageUtil.start }" end="${map.PageUtil.end }" step="1" var="i">
                		<c:if test="${map.PageUtil.currentPage == i }">
                				<a>${i }</a>
                				</c:if>
                				<c:if test="${map.PageUtil.currentPage != i }">
                				<a href="#" onclick="getPage(${i })" class="current_page">${i }</a>
                				</c:if>
                	
                	</c:forEach>
                	<a href="#" onclick="getPage(${map.PageUtil.currentPage +1 })">下一页</a>
                	</c:if>
                	<!-- 	如果当前页是最后一页 就没有下一页这个标签 -->
                	<c:if test="${map.PageUtil.currentPage == map.PageUtil.totalPage }">
                	<a href="#" onclick="getPage(${map.PageUtil.currentPage -1 })">上一页</a>
                		<c:forEach begin="${map.PageUtil.start }" end="${map.PageUtil.end }" step="1" var="i" >
                				<c:if test="${map.PageUtil.currentPage == i }">
                				<a>${i }</a>
                				</c:if>
                				<c:if test="${map.PageUtil.currentPage != i }">
                				<a href="#" onclick="getPage(${i })" class="current_page">${i }</a>
                				</c:if>
                		</c:forEach>
                				
                	</c:if>
            		
            		<a href="#" onclick="getPage(${map.PageUtil.totalPage })">尾页</a>
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
