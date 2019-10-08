package com.game.action.userManager;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.game.page.AdminPage;
import com.game.po.SysAdmin;
import com.game.service.userManager.AdminService;
import com.game.vo.AdminForm;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminManagerAction extends ActionSupport{
	 
	private static final long serialVersionUID = 1L;
	private AdminService adminServiceImpl;
	private String rows;
	private String page;
	private AdminPage adminPage;
	private AdminForm adminForm;
	private String ids;
	
	
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public AdminForm getAdminForm() {
		return adminForm;
	}
	public void setAdminForm(AdminForm adminForm) {
		this.adminForm = adminForm;
	}
	public AdminPage getAdminPage() {
		return adminPage;
	}
	public void setAdminPage(AdminPage adminPage) {
		this.adminPage = adminPage;
	}
	public AdminService getAdminServiceImpl() {
		return adminServiceImpl;
	}
	public void setAdminServiceImpl(AdminService adminServiceImpl) {
		this.adminServiceImpl = adminServiceImpl;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	
	public String List(){
		int npage =  Integer.parseInt(page);
		int nrows = Integer.parseInt(rows);
		adminPage.setRows(adminServiceImpl.listService(npage, nrows));
		adminPage.setTotal(adminServiceImpl.countService());
		return "LIST";
	}
	public String Add(){
		if(adminServiceImpl.existService(adminForm.getAdminName())){//有该用户
			return "AddFail";
		}else{
			adminServiceImpl.saveService(adminForm);
			return "ADD";
		}
	}
	public String EditIsExist(){
		if(adminServiceImpl.existService(adminForm.getAdminName())){//有该用户
			return "EditFail";
		}else{
			adminServiceImpl.updateService(adminForm);
			return "EditSuccess";
		}
	}
	public String Edit(){
		adminServiceImpl.updateService(adminForm);
		return "Edit";
	}
	public String FindUser(){
		if(ids==null || "".endsWith(ids)){
			adminPage.setRows(adminServiceImpl.listService(1, 10));
			adminPage.setTotal(adminServiceImpl.countService());
		}else{
			AdminForm adminForm= adminServiceImpl.listByUserNameService(ids);
			List<AdminForm> adminPageList=  new ArrayList<AdminForm>();
			adminPageList.add(adminForm);
			adminPage.setRows(adminPageList);
			adminPage.setTotal(1);
		}
		return "FINDUSER";
	}
	public String ListById(){
		Map<String, Object> session = ActionContext.getContext().getSession(); 
		SysAdmin user = (SysAdmin) session.get("user");//获取session值	
		adminPage.setRows(adminServiceImpl.listByIdService(user.getAdminId().intValue()));
		adminPage.setTotal(1);
		return "LISTBYID";
	}
}
