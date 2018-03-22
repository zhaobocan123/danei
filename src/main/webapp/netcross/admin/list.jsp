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
            function deleteAdmin(id) {
                var r = window.confirm("确定要删除此管理员吗？");
                if(r)
                {
	                $.post(
			            	 "deleteAdmin.action",
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
			      			 		search(page);
			      			 	},1500);
			            	 }
	            	  );
                }
               // document.getElementById("operate_result_info").style.display = "block";
            }
            //全选
            function selectAdmins(inputObj) {
                var inputArray = document.getElementById("datalist").getElementsByTagName("input");
                for (var i = 1; i < inputArray.length; i++) {
                    if (inputArray[i].type == "checkbox") {
                        inputArray[i].checked = inputObj.checked;
                    }
                }
            }
            function search(page)
            {
            	$("#page").val(page);
            	$("#searchAdminForm").submit();
            }
            //重置密码
            function resetPwd() {
                var checkObjs = document.getElementsByName("selectedAdmin");
                if(checkObjs == null || checkObjs.length == 0)
                {
                	alert("请至少选择一条数据！");
                	return;
                }
                var ids = new Array();
                for(var i=0;i<checkObjs.length;i++){
                	if(!checkObjs[i].checked)
                		continue;
                	var trObj = checkObjs[i].parentNode.parentNode;
                	var tdObjs = trObj.getElementsByTagName("td");
                	ids.push(tdObjs[1].innerHTML);
                }
                 $.post(
                	"resetPassword.action",
                	{"ids":ids.toString()},
                	function(data){
                		var pass = data;
                		if(pass){
                			alert("重置密码成功");
                		} else {
                			alert("重置密码失败");
                		}
                	}
                );
                //document.getElementById("operate_result_info").style.display = "block";
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
                <li><a href="list.jsp" class="admin_on"></a></li>
                <li><a href="../cost/list.jsp" class="fee_off"></a></li>
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
            <form action="" method="post" id="searchAdminForm">
                <!--查询-->
                <div class="search_add">
                    <div>
                      	  模块：			
                      	<select  name="priviliegeId" class="select_search">
                      		<option value="-1">--全部--</option>
                        <select>
                    </div>
                    <div>角色：
                    	<select name="roleId"   class="select_search" >
                    		<option value="-1">--全部--</option>
                    	</select>
                    </div>
                    <input type="hidden"  name="page" id="page" />
                    <div><input type="button" value="搜索" class="btn_search" onclick="search(1)"/></div>
                    <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();" />
                    <input type="button" value="增加" class="btn_add" onclick="" />
                </div>
                <!--删除和密码重置的操作提示-->
                <div id="operate_result_info" class="operate_fail">
                    <img src="../img/close.png" onclick="this.parentNode.style.display='none';" />
                    <span id="operMsg">删除失败！数据并发错误。</span><!--密码重置失败！数据并发错误。-->
                </div> 
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="th_select_all">
                                <input type="checkbox" onclick="selectAdmins(this);" />
                                <span>全选</span>
                            </th>
                            <th>管理员ID</th>
                            <th>姓名</th>
                            <th>登录名</th>
                            <th>电话</th>
                            <th>电子邮件</th>
                            <th>授权日期</th>
                            <th class="width100">拥有角色</th>
                            <th></th>
                        </tr> 
                        <tr>
                            <td><input type="checkbox" name="selectedAdmin"/></td>
                            <td>1</td>
                            <td>张三</td>
                            <td>123</td>
                            <td>13110180908</td>
                            <td>123@163.com</td>
                            <td>2018-10-01</td>
                            <td>
                                <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">系统管理员</a>
                                <!--浮动的详细信息-->
                                <div class="detail_info">
                                 	 系统管理员
                                </div>
                            </td>
                            <td class="td_modi">
                                <input type="button" value="修改" class="btn_modify" onclick="javascript:location = 'edit.html'" />
                                <input type="button" value="删除" class="btn_delete" onclick="deleteAdmin();" />
                            </td>
                        </tr>
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
                	<a href="#">上一页</a>
	                <a href="javascript:searchsearch();" class="current_page">1</a>
                   	<a href="javascript:search();" >2</a>
                    <a href="javascript:search();">下一页</a>
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
