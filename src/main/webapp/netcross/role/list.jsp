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
        <script language="javascript" type="text/javascript">
            function deleteRole(id) {
                var r = window.confirm("确定要删除此角色吗？");
                if(r)
                {
                	window.location.href="deleteRole.action?id="+id;
                }
                document.getElementById("operate_result_info").style.display = "block";
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
                <li><a href="list.jsp" class="role_on"></a></li>
                <li><a href="../admin/list.jsp" class="admin_off"></a></li>
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
            <form action="" method="">
                <!--查询-->
                <div class="search_add">
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddRole.action';" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../img/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div> 
                <!--删除错误！该角色被使用，不能删除。-->
                <!--数据区域：用表格展示数据-->     
                <div id="data">                      
                    <table id="datalist">
                        <tr>                            
                            <th>角色 ID</th>
                            <th>角色名称</th>
                            <th class="width600">拥有的权限</th>
                            <th class="td_modi"></th>
                        </tr> 
                        <tr>
                            <td>1</td>
                            <td>tom</td>
                            <td>管理员1,管理员2,管理员3</td>
                            <td>
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='toModifyRole.action?id=1';"/>
                                <input type="button" value="删除" class="btn_delete" onclick="deleteRole(1);" />
                            </td>
                        </tr>
                    </table>
                </div> 
                <!--分页-->
                <div id="pages">
    	        	<a href="#">上一页</a>
                    <a href="listRole.action?page=1" class="current_page">1</a>
                    <a href="listRole.action?page=2" >2</a>
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

