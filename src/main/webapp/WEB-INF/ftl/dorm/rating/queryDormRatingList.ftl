<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/dormcommon.js"></script>
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
	 <div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="dormRatingQuery"  action="${rc.contextPath}/dorm/dormRating/opt-query/querydormRatingList.do" method="post">
			  <div class="span12">
				<div class="row-fluid">
				  <div class="span4">
				   <span class="formTitle">公寓</span>
					<select size="1" id="dormBuilding" name="room.building.id" aria-controls="dt_gal" class="span7" onChange="cascadeDorm.getDormBuilding('dormBuilding','dormFloor','dormName');">
					  <option value="" >请选择..</option>
						<#if buildList ??>
							<#list buildList as d>
							    <#if dormRating?? && dormRating.room?? && dormRating.room.building?? && dormRating.room.building.id==d.id>
									   <option  value="${d.id}" selected="selected" />${(d.name)!""}</option>
								<#else>
									   <option value="${d.id}" >${(d.name)!""}</option>	
								</#if>
							</#list>
						</#if>
					</select>
				 </div>
				  <div class="span4">
				   <span class="formTitle">楼层</span>
					<select size="1" id="dormFloor" name="room.floorNum" aria-controls="dt_gal" class="span7 emptySelect" onChange="cascadeDorm.changeDormFloor('dormBuilding','dormFloor','dormName');">
					  <option value="" >请选择..</option>
					   <#if floorList ??>
						 <#list floorList as d>
							<#if dormRating?? && dormRating.room ?? && dormRating.room.floorNum==d.name >
								   <option  value="${d.id}" selected="selected" />${(d.name)!""}</option>
							<#else>
								   <option value="${d.id}" >${(d.name)!""}</option>	
							</#if>
						 </#list>
					    </#if>
					</select>
				 </div>
				 <div class="span4">
				   <span class="formTitle">寝室号</span>
					<select size="1" id="dormName" name="room.id" aria-controls="dt_gal" class="span7 emptySelect">
					  <option value="" >请选择..</option>
					  <#if dormNoList??>
						<#list dormNoList as c>
							<#if dormRating?? && dormRating.room?? && dormRating.room.id==c.id>
								<option value="${c.id}" selected="selected">${c.name?html}</option>
							<#else>
								<option value="${c.id}">${c.name?html}</option>
							</#if>
						</#list>
					 </#if>
					</select>
				   </div>
				 </div>
				<div class="btnCenter">
					<input type="button" class="btn btn-info"  onclick="selectDormRatingQuery();" value="查 询"/>
                	<input type="button" class="btn btn-info"  onclick="comp.clearForm('dormRatingQuery')" value="清 空"/>
				</div>
			   </div> 	  
			  </form>
				<div class="row-fluid">
					<div class="span12">
					 <h5 class="heading"></h5>
					  <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="8%">公寓</th>
									<th width="8%">楼层</th>
									<th width="8%">寝室号</th>
									<th width="9%">批次名称</th>
									<th width="8%">得分</th>
									<th width="9%">文明标兵寝室</th>
									<th width="9%">较差寝室</th>
									<th width="8%">检查人</th>
									<th width="8%">检查时间</th>
									<th width="7%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut">${(p.room.building.name)!""}</td>
											<td class="autocut">${(p.room.floorNum)!""}</td>
											<td class="autocut">${(p.room.name)!""}</td>
											<td class="autocut">${(p.batchName)!""}</td>
											<td class="autocut">${(p.getScore)!""}</td>
											<td class="autocut">${(p.isPacesetter)!""}</td>
											<td class="autocut">${(p.isBedRoom)!""}</td>
											<td class="autocut">${(p.checkUser)!""}</td>
											<td class="autocut">${((p.checkTime)!"")?string("yyyy-MM-dd")}</td>
											<td class="autocut">
											  <a href="${rc.contextPath}/dorm/dormRating/opt-view/dormRatingView.do?batchId=${(p.batchId)!''}&&dormID=${(p.room.id)!''}&&batchInfo=${(p.batchInfo)!''}" title="学生公寓评比查看"><i class="icon-list-alt"></i></a>
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="dormRatingQuery"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<#-- 脚本开始 -->
<script>
	//查询
	function selectDormRatingQuery(){
	    $("#dormRatingQuery").attr("action","${rc.contextPath}/dorm/dormRating/opt-query/querydormRatingList.do");
		$("#dormRatingQuery").submit();
	}
	
</script>
</body>
</html>