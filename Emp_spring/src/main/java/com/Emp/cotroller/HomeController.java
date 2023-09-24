package com.Emp.cotroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Emp.dao.EmpDao;
import com.Emp.entity.Emp;


@Controller
public class HomeController {
	
	@Autowired
	private EmpDao empDao;
	
	@RequestMapping(path="/home")
	public String home(Model m) {
		
		List<Emp> list=empDao.getAllEmp();
		m.addAttribute("empList", list);
		return "home";
	}
	
	@RequestMapping(path="/addEmp")
	public String addEmp() {
		return "add_Emp";
	}
	
	
	///view to controller(all data i.e ModelAttribute) 
	@RequestMapping(path="/createEmp",method=RequestMethod.POST )
	public String createEmp(@ModelAttribute Emp emp,HttpSession session) {
		System.out.println(emp);
		
		int i =empDao.saveEmp(emp);
		session.setAttribute("msg", "Registered Sucessfully");
		return "redirect:/addEmp"; // after filling user data when refreshed again data is stored so to avoid redirect is used along with httpsession
	}
	@RequestMapping(path="/editEmp/{id}")
	public String editEmp(@PathVariable int id,Model m) {
		Emp emp=empDao.getEmpById(id);
		m.addAttribute("emp", emp);
		return "edit_emp";
		
	}
	@RequestMapping(path="/updateEmp",method=RequestMethod.POST)
	public String updateEmp(@ModelAttribute Emp emp,HttpSession session) {//for temporary time data save httpsession is used
		
		empDao.update(emp);
		session.setAttribute("msg", "Update Sucessfully");
		
		return "redirect:/home";
		
	}
	@RequestMapping(path="/deleteEmp/{id}")
	public String deleteEmp(@PathVariable int id,HttpSession session) {
		empDao.deleteEmp(id);
		session.setAttribute("msg", "Employee deleted Sucesfully");
		return "redirect:/home";
		
	}
	
	@RequestMapping(path="/register")
	public String registerPage() {
		
		return"register";
	}
	
	@RequestMapping(path="/login")
	public String loginPage() {
		
		return"login";
	}
	
	@RequestMapping(path="/createUser",method=RequestMethod.POST)
	public String register(@ModelAttribute User user,HttpSession session) {
		
		System.out.println(user);
		userDao.saveUser(user);
		session.setAttribute("msg", "Registered Sucessfully");
		return "redirect:/register";
		
	}
	@RequestMapping(path="/userlogin",method=RequestMethod.POST)
	public String login(@RequestParam("email") String em,@RequestParam("password") String pwd,HttpSession session) {
		
		User user=userDao.loginUser(em, pwd);
		if(user!=null) {
			session.setAttribute("loginUser", user);
			return "profile";
		}else {
			session.setAttribute("msg", "Invalid User or Password");
			return "redirect:/login";
		}
		
	}
	
	@RequestMapping(path="/myProfile")
	public String myProfile() {
		return "profile";
	}
	
	@RequestMapping(path="/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		session.removeAttribute("loginUser");
		session.setAttribute("msg", "Logout Sucessfully");
		
		return "login";
		
	}

}
