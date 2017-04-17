<aside id ="asideLeft">
    <#--<a href="javascript:void(0)" class="sidebar_switch on_switch ttip_r" title="隐藏菜单栏">Sidebar switch</a>-->
    <div class="sidebar">
        <div class="sidebar_inner">
            <div id="side_accordion" class="accordion">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a href="#collapseOne1" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                            <i class="icon-jjbz icon-white"></i> 新生注册管理
                        </a>
                    </div>
                    <#if menuKey??>
                    	<div class="accordion-body collapse in" id="collapseOne1">
                    <#else>
                    	<div class="accordion-body collapse" id="collapseOne1">
                    </#if>
                        <div class="accordion-inner">
                            <ul class="nav nav-list">
                            	<#if menuKey??>
                            		<#if menuKey=='register'>
                            			<#--<li class="active"><a href="${rc.contextPath}/newstudent/register/editNewStudentInfo.do">信息采集</a></li>-->
                            			<li class="active"><a href="${rc.contextPath}/newstudent/register/viewWriteComm.do">信息采集</a></li>
                            			
                            			<#--<li><a href="${rc.contextPath}/newstudent/register/onlinePay.do">在线缴费</a></li>-->
                            			<li><a href="${rc.contextPath}/newstudent/register/editPassWord.do">修改密码</a></li>
                            		<#elseif menuKey=='onlinePay'>
                            			<#--<li class="active"><a href="${rc.contextPath}/newstudent/register/editNewStudentInfo.do">信息采集</a></li>-->
                            			<li class="active"><a href="${rc.contextPath}/newstudent/register/viewWriteComm.do">信息采集</a></li>
                            			
                            			<#--<li class="active"><a href="${rc.contextPath}/newstudent/register/onlinePay.do">在线缴费</a></li>-->
                            			<li><a href="${rc.contextPath}/newstudent/register/editPassWord.do">修改密码</a></li>
                            		<#elseif menuKey=='editPassword'>
                            			<#--<li class="active"><a href="${rc.contextPath}/newstudent/register/editNewStudentInfo.do">信息采集</a></li>-->
                            			<li ><a href="${rc.contextPath}/newstudent/register/viewWriteComm.do">信息采集</a></li>
                            			
                            			<#--<li><a href="${rc.contextPath}/newstudent/register/onlinePay.do">在线缴费</a></li>-->
                            			<li class="active"><a href="${rc.contextPath}/newstudent/register/editPassWord.do">修改密码</a></li>
                            		</#if>
                            	<#else>
                            		<#--<li class="active"><a href="${rc.contextPath}/newstudent/register/editNewStudentInfo.do">信息采集</a></li>-->
                            			<li class="active"><a href="${rc.contextPath}/newstudent/register/viewWriteComm.do">信息采集</a></li>
                            			
                            		<#--<li><a href="${rc.contextPath}/newstudent/register/onlinePay.do">在线缴费</a></li>-->
                            		<li><a href="${rc.contextPath}/newstudent/register/editPassWord.do">修改密码</a></li>
                            	</#if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</aside>
<script src="${rc.contextPath}/js/rod_common.js"></script>