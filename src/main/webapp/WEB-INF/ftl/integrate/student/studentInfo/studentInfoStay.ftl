						<#if studentRoom ?? && studentRoom.room ??>
						<div class="row-fluid">
							<div class="span12">
							    <div class="span4">
									<div class="span3">
										<label >公寓</label>
									</div>
									<div >
										<input class="span7" id="building" name="building.id" disabled="disabled" <#if studentRoom?? && studentRoom.building ??>value="${(studentRoom.building.name)!""}"</#if>  />
									</div>
								</div>
								<div class="span4">
									<div class="span3">
										<label >寝室</label>
									</div>
									<div >
										<input class="span7" id="room" name="room.id" disabled="disabled" <#if studentRoom?? && studentRoom.room??>value="${(studentRoom.room.name)!""}"</#if> />
									</div>
								</div>
								<div class="span4">
									<div class="span3">
										<label >床位号</label>
									</div>
									<div >
										<input class="span7" id="bedNumber" name="bedNumber" disabled="disabled" <#if studentRoom??>value="${(studentRoom.bedNumber)!""}"</#if> />
									</div>
								</div>
							</div>
						</div>	
						<div class="row-fluid">
					    <div class="span12">
						<h3 class="heading">同寝学生信息</h3>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="8%">序号</th>
									<th width="10%">姓名</th>
									<th width="15%">学号</th>
									<th width="10%">性别</th>
									<th width="10%">床位号</th>
									<th width="20%">班级</th>
									<th width="15%">专业</th>
									<th width="15%">学院</th>
								</tr>
							</thead>
							<tbody>
							<#if studentRoomList ?? >	
								<#list studentRoomList as s>
								<#if s.student ?? >
								<tr>		
								    <td>${s_index+1}</td>
									<td class="autocut">${s.student.name!""?html}</td>
									<td class="autocut">${s.student.stuNumber!""?html}</td>									
									<td class="autocut"><#if s.student.genderDic?? >${s.student.genderDic.name!""?html}</#if></td>
									<td class="autocut"><#if s.bedNumber ?? >${s.bedNumber!""?html}</#if></td>
									<td class="autocut"><#if s.student.classId ?? >${s.student.classId.className!""?html}</#if></td>
									<td class="autocut"><#if s.student.major ?? >${s.student.major.majorName!""?html}</#if></td>
									<td class="autocut"><#if s.student.college ?? >${s.student.college.name!""?html}</#if></td>
								</tr>
								</#if>
								</#list>
							 </#if> 
							</tbody>
						</table>	
						</div>
						</div>
						</div>
						<#else>
						<div class="row-fluid">
							<div class="span12">
						        <span class="f_req">该生暂无住宿信息！</span>
						    </div>
						</div>
						<br/>
						</#if>