package com.uws.security;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neusoft.education.tp.sso.client.CASReceipt;
import com.neusoft.education.tp.sso.client.filter.CASFilter;
import com.uws.common.service.IBaseDataService;
import com.uws.common.service.IStudentCommonService;
import com.uws.core.base.BaseController;
import com.uws.core.session.UserSession;
import com.uws.domain.base.BaseTeacherModel;
import com.uws.domain.orientation.StudentInfoModel;
import com.uws.log.Logger;
import com.uws.log.LoggerFactory;
import com.uws.res.model.Resource;
import com.uws.res.service.IResourceService;
import com.uws.sys.model.Dic;
import com.uws.sys.service.DicUtil;
import com.uws.sys.service.impl.DicFactory;
import com.uws.user.model.User;
import com.uws.user.service.IUserService;
import com.uws.util.ProjectConstants;

/**
 * 
* @ClassName: CasLoginAuthController 
* @Description: 集成单点登录（SSO）的登录验证控制类 
* @author 联合永道
* @date 2015-7-9 下午2:26:47 
*
 */
@Controller("com.uws.security.CasLoginAuthController")
public class CasLoginAuthController extends BaseController
{
	@Autowired
	private IUserService userService;
	@Autowired
	private IResourceService resourceService;
	@Autowired
	private IStudentCommonService studentCommonService;
	@Autowired
	private IBaseDataService baseDataService;
	
	private DicUtil dicUtil = DicFactory.getDicUtil();
	private Logger logger = new LoggerFactory(CasLoginAuthController.class);
	/**
	 * 
	 * @Title: casLoginAuth
	 * @Description: 集成单点登录集成获取验证跳转方法
	 * @param session
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws
	 */
	@RequestMapping({ "/casAuth" })
	public String casLoginAuth(HttpSession session, HttpServletRequest request,HttpServletResponse response, Model model)
	{
		String userName = null;
		try {
			CASReceipt receipt = (CASReceipt) request.getSession().getAttribute(CASFilter.SSO_FILTER_RECEIPT);
			if (receipt != null) {
				userName = receipt.getUserName();
				logger.debug("单点登录成功，根据返回信息并封装平台对应的权限和菜单");
				validateUserSession(request,userName);
			}
		} catch (Exception e) {
			logger.error("单点登录失败,异常信息为 ： " + e.getMessage() );
			e.printStackTrace();
			return "/security/login/toLoginUI";
		}
		return "redirect:/main.do";
	}
	
	/**
	 * 
	 * @Title: validateUserSession
	 * @Description: 验证封装数据
	 * @param userId
	 * @throws
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
    private void validateUserSession( HttpServletRequest request,String userId) throws Exception
	{
		HttpSession session = request.getSession();
		session.getMaxInactiveInterval();
		
		User user = userService.getUserById(userId);
		
		//判断登录用户类型 封装不同的数据类型
		Dic studentTypeDic = dicUtil.getDicInfo("USER_TYPE", "STUDENT");
		Dic TeacherTypeDic = dicUtil.getDicInfo("USER_TYPE", "TEACHER");
		Dic currentUserTypeDic = user.getUserType();
		
		if( null!=currentUserTypeDic)
		{
			if(currentUserTypeDic.getId().equals(studentTypeDic.getId()))
			{
				logger.debug("封装登录学生的班级、专业、学院等 ID 信息");
				StudentInfoModel student = studentCommonService.queryStudentById(userId);
				session.setAttribute("_student_classId", student.getClassId().getId());
				session.setAttribute("_student_majorId", student.getMajor().getId());
				session.setAttribute("_student_collegeId", student.getCollege().getId());
				session.setAttribute("_current_user_type", ProjectConstants.LOGIN_USER_TYPE.STUDENT);
				
			}else if(currentUserTypeDic.getId().equals(TeacherTypeDic.getId())){
				logger.debug("封装登录教工的以及ORG ID信息");
				BaseTeacherModel teacher =	baseDataService.findTeacherById(userId);
				session.setAttribute("_teacher_orgId", teacher.getOrg().getId());
				session.setAttribute("_current_user_type", ProjectConstants.LOGIN_USER_TYPE.TEANCHER);
			}
		}
		
		// 用户基本信息
		UserSession userSession = new UserSession();
		userSession.setUserName(user.getName());
		userSession.setUserId(user.getId());
		userSession.setIsSuperUser(false);
		
		//操作权限、菜单权限 
		List roleList = this.userService.getUserAllRoles(user);
		Map map = this.resourceService.getPermMapByRoleList(roleList, false);
		List menuList = (List) map.get("RES_MENU_LIST");
		userSession.setMenuList(menuList);
		List menuTree = (List) map.get("RES_MENU_TREE");
		userSession.setMenuTree(menuTree);
		userSession.setCheckMap((Map) map.get("RES_CHECK_MAP"));
		userSession.setPermMap((Map) map.get("RES_PERM_MAP"));
		List sidebarMenuTree = new ArrayList();
		if (menuTree.size() > 0)
		{
			userSession.setHeaderMenuId(((Resource) menuTree.get(0)).getId());
			sidebarMenuTree = ((Resource) menuTree.get(0)).getChildList();
		}
		userSession.setSidebarMenuTree(sidebarMenuTree);
		
		session.setAttribute("user_key", userSession);
	}
}
