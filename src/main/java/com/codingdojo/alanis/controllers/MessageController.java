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

import com.codingdojo.alanis.models.Message;
import com.codingdojo.alanis.models.User;
import com.codingdojo.alanis.services.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messaService;
	
	@GetMapping("/mensaje/{userId}")
	public String mensajes(@PathVariable("userId") Long userId,
						   @ModelAttribute("message") Message newMessage,
						   Model model,
						   HttpSession session) {
		
		/*Revisa que mi usuario haya iniciado sesion*/
		User userInMethod = (User)session.getAttribute("userInSession");
		
		if(userInMethod == null) { //para que no puedan entrar directamente con el url
			return "redirect:/";
		}
		/*=======Revisa que mi usuario haya iniciado sesion=======*/
		
		model.addAttribute("recibe", userId);
		
		model.addAttribute("chat", messaService.conversacion(userInMethod.getId(), userId));
		System.out.println(messaService.conversacion(userInMethod.getId(), userId));
		return "/message/mensajes.jsp";
	}
	
	@PostMapping("/conversar")
	public String chat(@Valid @ModelAttribute("message") Message newMessage,
					   BindingResult result,
					   HttpSession session,
					   Model model) {
		
		/*Revisa que mi usuario haya iniciado sesion*/
		User userInMethod = (User)session.getAttribute("userInSession");
		
		if(userInMethod == null) { //para que no puedan entrar directamente con el url
			return "redirect:/";
		}
		/*=======Revisa que mi usuario haya iniciado sesion=======*/
		
		
		
		model.addAttribute("chat", messaService.conversacion(userInMethod.getId(), newMessage.getReceptor().getId()));
		
		if(result.hasErrors()) {
			model.addAttribute("chat", messaService.conversacion(userInMethod.getId(), newMessage.getReceptor().getId()));
			return "/message/mensajes.jsp";
		} else {
			messaService.guardarMensaje(newMessage);
			return "redirect:/mensaje/"+newMessage.getReceptor().getId();
		}
		
	}

}