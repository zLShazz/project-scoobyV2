package com.codingdojo.alanis.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.alanis.models.Region;
import com.codingdojo.alanis.models.User;
import com.codingdojo.alanis.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping("/register")
	public String index(@ModelAttribute("newUser") User newUser,
						Model model) {
		model.addAttribute("regiones", Region.Regiones);
		return "user/registrar.jsp";
		
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
						   BindingResult result,
						   HttpSession session,
						   Model model) {
		
		//método en servicio
		service.register(newUser, result);
		
		if(result.hasErrors()) {
			System.out.println("Hola");
			model.addAttribute("regiones", Region.Regiones);
			return "user/registrar.jsp";
		} else {
			//Guardar sesión
			session.setAttribute("userInSession", newUser);
			return "redirect:/home";
		}
		
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("email") String email,
						@RequestParam("password") String password,
						RedirectAttributes redirectAttributes,
						HttpSession session) {
		
		//enviar email y contraseña y que el servicio verifique si son correctos
		User userLogin = service.login(email, password);
		
		if(userLogin == null) {
			//Hay error
			//redirectAttributes.addFlashAttribute("error_login", "Email/Password incorrect");
			redirectAttributes.addFlashAttribute("error_login", "Email/Password incorrect");
			return "redirect:/login";
		} else {
			//Guardamos en sesion
			session.setAttribute("userInSession", userLogin);
			return "redirect:/home";
		}
		
		
	}
	
	@GetMapping("/login")
	public String index() {
		return "user/login.jsp";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInSession");
		return "redirect:/";
	}
	
	///////////////////////////////////////////////////////////////////////////
	@GetMapping("/editarPerfil/{id}")
	public String edit(@PathVariable("id") Long id, Model model, @ModelAttribute("newUser") User newUser, HttpSession session) {
		
		User editUser = service.buscarId(id);
		
		model.addAttribute("newUser", editUser);
		model.addAttribute("regiones", Region.Regiones);
		return "user/editUser.jsp";
	}
	
	@PutMapping("/editarPerfil")
	public String edit(@Valid @ModelAttribute("newUser") User newUser, 
						BindingResult result, Model model) {
		model.addAttribute("regiones", Region.Regiones);
		if(result.hasErrors()) {
			return "user/editUser.jsp";
		}else {
			service.saveUser(newUser);
			return "redirect:/perfil/" + newUser.getId();
		}
		
	}
}
