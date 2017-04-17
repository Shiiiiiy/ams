package com.uws.security.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uws.core.base.BaseController;
import com.uws.core.session.SessionFactory;
import com.uws.core.session.UserSession;
import com.uws.res.model.Resource;

/**
 * 
* @ClassName: MainController 
* @Description: 首页跳转 逻辑修改 
* @author 联合永道
* @date 2015-9-22 下午2:34:54 
*
 */
@Controller
public class MainController extends BaseController
{
	/**
	 * 
	 * @Title: main
	 * @Description: 主页
	 * @param request
	 * @param response
	 * @return
	 * @throws
	 */
	@RequestMapping({ "/main" })
	public String main(HttpServletRequest request, HttpServletResponse response)
	{
		UserSession userSession = ((SessionFactory) SessionFactory.getSession("default_menu_key")).getUserSession();
		String menuId = userSession.getHeaderMenuId(); 
		return "redirect:/security/menuDispatch2.do?menuId="+menuId;
	}

	/**
	 * 
	 * @Title: loadSidebar
	 * @Description: loadSidebar
	 * @param request
	 * @param response
	 * @return
	 * @throws
	 */
	@SuppressWarnings("unchecked")
    @RequestMapping({ "/security/loadSidebar" })
	public String loadSidebar(HttpServletRequest request, HttpServletResponse response)
	{
		UserSession userSession = ((SessionFactory) SessionFactory.getSession("default_menu_key")).getUserSession();
		String menuId = request.getParameter("menuId");
		menuId.equals(userSession.getHeaderMenuId());

		userSession.setHeaderMenuId(menuId);
		List<Resource> sidebarMenuTree = new ArrayList<Resource>();
		List<Resource> menuTree = userSession.getMenuTree();
		if ((menuTree.size() > 0) && (menuId != null))
		{
			for (Resource resource : menuTree)
			{
				if (resource.getId().equals(menuId))
				{
					sidebarMenuTree = resource.getChildList();
				}
			}
		}
		userSession.setSidebarMenuTree(sidebarMenuTree);
		return "decorators/sidebar";
	}

	/**
	 * 
	 * @Title: loadOutLine
	 * @Description: loadOutLine
	 * @param request
	 * @param response
	 * @return
	 * @throws
	 */
	@RequestMapping({ "/security/loadOutLine" })
	public String loadOutLine(HttpServletRequest request,HttpServletResponse response)
	{
		return "security/main/outline";
	}

	/**
	 * 菜单跳转
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
    @RequestMapping({ "/security/menuDispatch" })
	public String menuDispatch(HttpServletRequest request, HttpServletResponse response)
	{
		UserSession userSession = ((SessionFactory) SessionFactory.getSession("default_menu_key")).getUserSession();
		String menuId = request.getParameter("menuId");
		Resource resource = null;
		List<Resource> menuList = userSession.getMenuList();
		for (Resource res : menuList)
		{
			if (res.getId().equals(menuId))
			{
				resource = res;
			}
		}
		userSession.setSidebarMenuId(menuId);
		userSession.setSidebarParentId(resource.getParent().getId());
		String link = resource.getLink();
		if (!link.startsWith("/"))
		{
			link = "/" + link;
		}
		Object tempList = new ArrayList<String>();
		((List<String>) tempList).add(resource.getName());
		while ((resource != null) && (resource.getParent() != null))
		{
			for (Resource res : menuList)
			{
				if (res.getId().equals(resource.getParent().getId()))
				{
					((List<String>) tempList).add(res.getName());
					resource = res;
					break;
				}
			}
		}
		List<String> navStrList = new ArrayList<String>();
		for (int i = 1; i < ((List<String>) tempList).size(); i++)
		{
			navStrList.add((String) ((List<String>) tempList).get(((List<String>) tempList)
			        .size() - i - 1));
		}
		userSession.setNavStrList(navStrList);
		return (String) ("redirect:" + link);
	}
	
	/**
	 * 菜单跳转的方法  默认选中第一个刷新的方法 
	 * @param request
	 * @param response
	 * @return
	 */
	 @SuppressWarnings("unchecked")
     @RequestMapping({"/security/menuDispatch2"})
	 public String menuDispatch2(HttpServletRequest request, HttpServletResponse response) 
	 {
	    UserSession userSession = ((SessionFactory)SessionFactory.getSession(UserSession.DEFAULT_MENU_KEY)).getUserSession();
	    String menuId = request.getParameter("menuId");
	    Resource resource = null;
	    List<Resource> menuList = userSession.getMenuList();
	    for (Resource res : menuList) {
	      if (res.getParent()!=null&&res.getParent().getId().equals(menuId)) {
	        resource = res;
	        break;
	      }
	    }
	    //判断统一浏览器不同用户登录时候  再跳转到 首页
	    if( null == resource)
	    	return "redirect:/main.do";
	    for (Resource res : menuList) {
	        if (res.getParent()!=null&&res.getParent().getId().equals(resource.getId())) {
	          resource = res;
	          break;
	        }
	     }
	    userSession.setSidebarMenuId(resource.getId());
	    userSession.setSidebarParentId(resource.getParent().getId());
	    String link = resource.getLink();
	    if (!(link.startsWith("/"))) {
	      link = "/" + link;
	    }
	    List<String> tempList = new ArrayList<String>();
	    tempList.add(resource.getName());
	    while (resource != null && resource.getParent() != null) {
	      for (Resource res : menuList) {
	        if (res.getId().equals(resource.getParent().getId())) {
	          tempList.add(res.getName());
	          resource = res;
	          break;
	        }
	      }
	    }
	    List<String> navStrList = new ArrayList<String>();
	    for (int i = 1; i < tempList.size(); i++) {
	      navStrList.add(tempList.get(tempList.size() - i - 1));
	    }
	    userSession.setNavStrList(navStrList);
	    userSession.setHeaderMenuId(menuId);
	    List<Resource> sidebarMenuTree = new ArrayList<Resource>();    
	    if ((menuList.size() > 0) && 
	      (menuId != null)) {
	      for (Resource r:menuList) {
	        if (r.getId().equals(menuId)) {
	          sidebarMenuTree = r.getChildList();
	        }
	      }
	    }
	    userSession.setSidebarMenuTree(sidebarMenuTree);
	    return ((String)"redirect:" + link);
	  }
}