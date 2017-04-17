
		<div class="tabbable ">
			<!-- 用户基本信息-->
			<div class="tab-content">
				<div class="tab-pane active" id="user">
					<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
					<input id="id" type="hidden" name="id"  value="${(user.id)!""}">
						<div class="formSep">
							<div class="row-fluid">
								<div class="span5">
									<div class="span3" >
										<label class="control-label">人员名称 </label>
									</div>
									<div class="span9">
										<input id="name" name="name"  value="${(user.name)!""}"   disabled="disabled"/>
									</div>
								</div>
								<div class="span5">
									<div class="span3">
										<label >性别</label>
									</div>
									<div class="span9">
										<input id="name" name="name"  value="${(user.genderDic.name)!""}"   disabled="disabled"/>
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
								<div class="span5">
									<div class="span3">
										<label >用户类型 </label>
									</div>
									<div class="span9">
										<#if user.userType??>
											<input value="${(user.userType.name)!""}"   disabled="disabled"/>
										<#else>	
											<input    disabled="disabled"/>
										</#if>
									</div>
								</div>
								<div class="span5">
									<div class="span3">
										<label >人员状态</label>
									</div>
									<div class="span9">
										<input id="postcode" name="postcode"  value="${(user.statusDic.name)!""}" disabled="disabled"/>
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
								<div class="span5">
									<div class="span3">
										<label >证件类型 </label>
									</div>
									<div class="span9">
										<#if user.certTypeDic??>
											<input value="${(user.certTypeDic.name)!""}"   disabled="disabled"/>
										<#else>	
											<input    disabled="disabled"/>
										</#if>
									</div>
								</div>
								<div class="span5">
									<div class="span3">
										<label >证件号码</label>
									</div>
									<div class="span9">
										<input id="certNum" name="certNum"  value="${(user.certNum)!""}" disabled="disabled" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span5">
									<div class="span3">
										<label >出生日期</label>
									</div>
									<div class="span9">
										<input id="birthday" name="birthday"  value="${(user.birthday)!""}" disabled="disabled"/>
									</div>
								</div>
								<div class="span5">
									<div class="span3">
										<label >固定电话</label>
									</div>
									<div class="span9">
										<input id="tel" name="tel"  value="${(user.tel)!""}" disabled="disabled"/>
									</div>
								</div>
							</div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span5">
									<div class="span3">
										<label >手机号码</label>
									</div>
									<div class="span9">
										<input id="phone" name="phone"  value="${(user.phone)!""}" disabled="disabled"/>
									</div>
								</div>
								<div class="span5">
									<div class="span3">
										<label >电子邮件</label>
									</div>
									<div class="span9">
										<input id="email" name="email"  value="${(user.email)!""}" disabled="disabled"/>
									</div>
								</div>
							</div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span5">
									<div class="span3">
										<label >家庭地址</label>
									</div>
									<div class="span9">
										<input id="address" name="address"  value="${(user.address)!""}" disabled="disabled"/>
									</div>
								</div>
								<div class="span5">
									<div class="span3">
										<label >邮编</label>
									</div>
									<div class="span9">
										<input id="postcode" name="postcode"  value="${(user.postcode)!""}" disabled="disabled"/>
									</div>
								</div>
								
							</div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span5">
									<div class="span3">
										<label >备注 </label>
									</div>
									<div class="span9">
										<textarea name="comments" id="comments" cols="80" rows="5" class="span12" disabled="disabled">${(user.comments)!""}</textarea>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
    

