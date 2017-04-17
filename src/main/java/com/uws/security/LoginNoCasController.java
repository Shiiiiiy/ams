package com.uws.security;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.uws.common.service.IBaseDataService;
import com.uws.common.service.IStudentCommonService;
import com.uws.core.base.BaseController;
import com.uws.core.session.UserSession;
import com.uws.core.util.DataUtil;
import com.uws.core.util.MD5;
import com.uws.core.util.SystemPropertiesUtil;
import com.uws.domain.base.BaseTeacherModel;
import com.uws.domain.orientation.StudentInfoModel;
import com.uws.log.Logger;
import com.uws.log.LoggerFactory;
import com.uws.res.model.Resource;
import com.uws.res.service.IResourceService;
import com.uws.security.exception.CodeInvalidException;
import com.uws.security.exception.PasswordInvalidException;
import com.uws.security.service.ILoginService;
import com.uws.sys.model.Dic;
import com.uws.sys.service.DicUtil;
import com.uws.sys.service.impl.DicFactory;
import com.uws.user.model.User;
import com.uws.user.service.IUserService;
import com.uws.util.ProjectConstants;

/**
 * 
 * @ClassName: CommonLoginController
 * @Description: 重新登录方法
 * @author 联合永道
 * @date 2015-8-12 下午4:24:05
 * 
 */
@Controller("com.uws.security.LoginNoCasController")
public class LoginNoCasController extends BaseController
{

	@Autowired
	private IUserService userService;
	@Autowired
	private ILoginService loginService;
	@Autowired
	private IResourceService resourceService;
	@Autowired
	private IStudentCommonService studentCommonService;
	@Autowired
	private IBaseDataService baseDataService;
	
	private DicUtil dicUtil = DicFactory.getDicUtil();
	
	private Logger log = new LoggerFactory(LoginNoCasController.class);
	public static final String CODE_INVALID = "验证码错误";
	public static final String USERNAME_PASSWORD_INVALID = "用户名或者密码错误";

	/**
	 * 
	 * @Title: commonLoginAuth
	 * @Description: 不集成单点登录的方法 重新登录
	 * @param username
	 * @param password
	 * @param code
	 * @param requestcode
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 * @throws
	 */
	@RequestMapping(value ={ "/loginnocas" }, method ={ org.springframework.web.bind.annotation.RequestMethod.POST })
	public String commonLoginAuth(@RequestParam String username,@RequestParam String password, @RequestParam String code, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception
	{
		try
		{
			privateLoginAuth(username.trim(), password, code);
		} catch (PasswordInvalidException e)
		{
			this.log.error(e.getMessage());
			return "redirect:/login.do?errorType=USERNAME_PASSWORD_INVALID";
		} catch (CodeInvalidException e)
		{
			this.log.error(e.getMessage());
			return "redirect:/login.do?errorType=CODE_INVALID";
		} catch (Exception e)
		{
			this.log.error(e.getMessage());
			return "redirect:/login.do?errorType=USERNAME_PASSWORD_INVALID";
		}
		String succeedPage = "";
		try
		{
			succeedPage = SystemPropertiesUtil.getSystemConfigProperties().getProperty("login.success.page");
		} catch (Exception e)
		{
			this.log.error(e.getMessage());
		}
		if ((succeedPage != null) && (!"".equals(succeedPage)))
		{
			this.log.info("login success page :" + succeedPage);
			return "redirect:" + succeedPage;
		}
		this.log.info("login success to default page");
		return "redirect:/main.do";
	}
	
	/**
	 * 
	 * @Title: privateLoginAuth
	 * @Description: 处理登录 验证
	 * @param userName
	 * @param passWord
	 * @param code
	 * @throws
	 */
	private void privateLoginAuth(String username,String password,String code) throws Exception
	{
		if ((DataUtil.isNull(username)) || (DataUtil.isNull(password)) || (DataUtil.isNull(code))) {
	      throw new Exception("用户名 、密码和验证码都不能为空");
	    }
	    HttpSession session = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
	    //UserLogin userLogin = null;
	    String adminLoginName = SystemPropertiesUtil.getSystemConfigProperties().getProperty("system.manager.account.loginName");
	    password = new String(Base64.decodeBase64(password.getBytes("UTF-8")), "UTF-8");
	    
	    if("system".equals(username) || (username+"#").equalsIgnoreCase(adminLoginName))
	    {
	    	loginService.loginAuth(username,password,code);
	    }
	    else{
	    	//验证码判断
	    	if (!code.equals(session.getAttribute("ccode"))) 
	    		throw new CodeInvalidException("验证码错误");
	    	//用户登录的用户名为 学号或者教工号
	    	User user = userService.getUserById(username);
			if( null!=user )
			{
				if (username.equals(password)) 
			    {
					//判断登录用户类型 封装不同的数据类型
					Dic studentTypeDic = dicUtil.getDicInfo("USER_TYPE", "STUDENT");
					Dic TeacherTypeDic = dicUtil.getDicInfo("USER_TYPE", "TEACHER");
					Dic currentUserTypeDic = user.getUserType();
					
					if( null!=currentUserTypeDic)
					{
						if(currentUserTypeDic.getId().equals(studentTypeDic.getId()))
						{
							log.debug("封装登录学生的班级、专业、学院等 ID 信息");
							StudentInfoModel student = studentCommonService.queryStudentByStudentNo(username);
							session.setAttribute("_student_classId", student.getClassId().getId());
							session.setAttribute("_student_majorId", student.getMajor().getId());
							session.setAttribute("_student_collegeId", student.getCollege().getId());
							session.setAttribute("_current_user_type", ProjectConstants.LOGIN_USER_TYPE.STUDENT);
							
						}else if(currentUserTypeDic.getId().equals(TeacherTypeDic.getId())){
							log.debug("封装登录教工的以及ORG ID信息");
							BaseTeacherModel teacher =	baseDataService.findTeacherByCode(username);
							session.setAttribute("_teacher_orgId", teacher.getOrg().getId());
							session.setAttribute("_current_user_type", ProjectConstants.LOGIN_USER_TYPE.TEANCHER);
						}
					}
					
				  session.getMaxInactiveInterval();
			      UserSession userSession = new UserSession();
			      userSession.setUserName(user.getName());
			      userSession.setUserId(user.getId());
			      userSession.setIsSuperUser(false);
			      session.setAttribute("user_key", userSession);
			      List roleList = this.userService.getUserAllRoles(user);
			      Map map = this.resourceService.getPermMapByRoleList(roleList, false);
			      List menuList = (List)map.get("RES_MENU_LIST");
			      userSession.setMenuList(menuList);
			      List menuTree = (List)map.get("RES_MENU_TREE");
			      userSession.setMenuTree(menuTree);
			      userSession.setCheckMap((Map)map.get("RES_CHECK_MAP"));
			      userSession.setPermMap((Map)map.get("RES_PERM_MAP"));
			      List sidebarMenuTree = new ArrayList();
			      if (menuTree.size() > 0) {
			        userSession.setHeaderMenuId(((Resource)menuTree.get(0)).getId());
			        sidebarMenuTree = ((Resource)menuTree.get(0)).getChildList();
			      }
			      userSession.setSidebarMenuTree(sidebarMenuTree);
			    }
			    else {
			      throw new PasswordInvalidException("密码不正确");
			    }
			}
	    }
    }
	
	/**
	 * 
	 * @Title: logout
	 * @Description: 退出 不集成单点登录
	 * @param session
	 * @param response
	 * @param request
	 * @return
	 * @throws
	 */
	@RequestMapping(value ={ "/logoutnocas" })
	public String logout(HttpSession session, HttpServletResponse response, HttpServletRequest request)
	{
		UserSession userSession = (UserSession) session.getAttribute("user_key");
		String userName = userSession.getUserName();
		session.invalidate();
		this.log.debug(userName + "注销成功");
		return "redirect:/login.do";
	}
			
}
