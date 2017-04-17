	
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span2"><label>社团名称 </label></div>
				<div class="span10">
					<input id="associationName"  readonly name="orignAssociationName" <#if applyModel??>value="${(applyModel.orignAssociationName!"")?html}"</#if>/>
				</div>
			</div>
			<div class="span6">
				<div class="span2"><label>社团编号</label></div>
                <div class="span10">
                   <input id="associationName" class="span5" readonly name="associationCode" <#if applyModel?? && applyModel.associationPo??>value="${(applyModel.associationPo.associationCode!"")?html}"</#if>/>
				</div>
			</div>
		</div>
	</div>
    <div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span2"><label>社团类型</label></div>
				<div class="span10">
				<select size="1" id="associationType" name="orignAssociationType.id" disabled aria-controls="dt_gal">
					<option value="">${(applyModel.orignAssociationType.name)!""}</option>
				</select>
				</div>
			</div>
			<div class="span6">
				<div class="span2"><label>所属学院</label></div>
				<div class="span10">
				<select size="1" id="collegeId" name="college.id" class="span5" disabled aria-controls="dt_gal">
					<option value="">${(applyModel.college.name)!""}</option>
				</select>
				</div>	
            </div>
        </div>
    </div>
    <div class="formSep">
		<div class="row-fluid">
		<div class="span12">
			<div class="span1"><label>社团宗旨组织模式经费来源</label></div>
			<div class="span8">
				<textarea cols="120" rows="6" readonly name="associationAim" class="span12"><#if applyModel?? >${(applyModel.associationAim)!""}</#if></textarea>
            </div>
		 </div>
	  </div>
	</div>
       
     
   	 <div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span2"><label>缴费金额</label></div>
				<div class="span10">
					<input id="associationFee" class="span3" readonly name="associationFee" value="<#if applyModel??>${(applyModel.associationFee!"")?html}<#else>0</#if>"/>(单位:元, 0为不需要缴费)
             	</div>
         	</div>
         	 <div class="span6 ">
				<div class="span2"><label>社团性质</label></div>
				<div  class="span10">
					<#if associationKind ??>
						<#list associationKind as c>
						<label class="radio inline">
							<input type="radio" id="isMajor_" disabled value="${c.id!""}"  name="orignIsMajor.id" <#if applyModel?? && applyModel.orignIsMajor?? && applyModel.orignIsMajor.id == c.id> checked</#if>/>
							${c.name!""}
						</label>
						</#list>
					</#if>
				</div>
            </div>
        </div>
	</div>
    	
	<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span2"><label>开放范围</label></div>
					<div class="span10">
					<#if openScope ??>
						<#list openScope as c>
						<label class="radio inline"  style="padding-bottom:10px;">
							<input type="radio" disabled id="isMajor_"  value="${c.id!""}"  name="openScope.id" <#if applyModel.associationPo?? && applyModel.associationPo.openScope?? && applyModel.associationPo.openScope.id == c.id> checked</#if>/>
							${c.name!""}
						</label>
						</#list>
					</#if>
					</div>
           		</div>
    		</div>
		</div>
    	<#if applyModel ?? && applyModel.associationPo ?? && applyModel.associationPo.openScope ?? && applyModel.associationPo.openScope.id == majorScope.id  >
    	<div class="formSep">
			<div class="row-fluid">
				<div class="span12">
					<div class="span1"><label>所选专业</label></div>
					<div class="span8">
						<textarea cols="80" rows="5" id="majorNames" name="majorName" class="span12" readonly>${applyModel.associationPo.majorNames!""}</textarea>
                    </div>
            	</div>
        	 </div>
		</div>	
    	</#if>
        <div class="formSep">
			<div class="row-fluid">
				<div class="span12">
					<div class="span1"><label>指导老师</label></div>
					<div class="span8">
					<#if advisorList??>
						<#list advisorList as advisor>
							<label>${advisor.advisorPo.name!""} <a href="javascript:void(0);" onclick="viewAdvisorDetail('${advisor.id!""}');">[查看简介]</a></label>
						</#list>
					</#if>
                    </div>
                </div>
            </div>
		</div>
		
		<div class="formSep">
			<div class="row-fluid">
				<div class="span12">
					<div class="span1"><label>社员信息</label></div>
                    <div class="span8">
                    	<label><a href="javascript:void(0);" onclick="viewMember('${(applyModel.associationPo.id)!""}');">[社员列表查看]</a></label>
                	</div>
            	</div>
        	</div>
        </div>
