package com.codingdojo.alanis.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.codingdojo.alanis.models.Age;
import com.codingdojo.alanis.models.Genre;
import com.codingdojo.alanis.models.Pet;
import com.codingdojo.alanis.models.Region;
import com.codingdojo.alanis.models.Species;
import com.codingdojo.alanis.models.User;
import com.codingdojo.alanis.models.Vaccine;
import com.codingdojo.alanis.services.PetService;
import com.codingdojo.alanis.services.UserService;


@Controller
public class HomeController {

	@Autowired
	private PetService petService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String index() {
		//si el usuario tiene iniciada sesión mandar al home, si no, mandarlo a registrar
		return "redirect:/register";
	}
	
	@GetMapping("/home")
	public String home(Model model,
					   HttpSession session) {
		
		/*Revisa que mi usuario haya iniciado sesion*/
		User userInMethod = (User)session.getAttribute("userInSession");
		
		if(userInMethod == null) { //para que no puedan entrar directamente con el url
			return "redirect:/";
		}
		/*=======Revisa que mi usuario haya iniciado sesion=======*/
		
		model.addAttribute("pets", petService.carrusel());
		
		System.out.println(petService.carrusel());
		
		return "home/home.jsp";
	}
	
	@GetMapping("/adopcion")
	public String adopcion(@ModelAttribute("pet") Pet pet,
						   HttpSession session, Model model) {
		
		model.addAttribute("generos", Genre.generos);
		model.addAttribute("especies", Species.especies);
		model.addAttribute("edades", Age.edades);
		model.addAttribute("vacunas", Vaccine.vacunas);
		
		/*Revisa que mi usuario haya iniciado sesion*/
		User userInMethod = (User)session.getAttribute("userInSession");
		
		
		if(userInMethod == null) { //para que no puedan entrar directamente con el url
			return "redirect:/";
		}
		/*=======Revisa que mi usuario haya iniciado sesion=======*/
		
		return "pet/adopcion.jsp";
	}
	
	@PostMapping("/adopcion")//formulario de creacion de mascotas
	public String adopcion(@Valid @ModelAttribute("pet") Pet pet, 
						   BindingResult result,
						   MultipartFile imagen,
						   HttpSession session, Model model) {
		
		model.addAttribute("generos", Genre.generos);
		model.addAttribute("especies", Species.especies);
		model.addAttribute("edades", Age.edades);
		model.addAttribute("vacunas", Vaccine.vacunas);
		
		
		/*Revisa que mi usuario haya iniciado sesion*/
		User userInMethod = (User)session.getAttribute("userInSession");
		
		if(userInMethod == null) { //para que no puedan entrar directamente con el url
			return "redirect:/";
		}
		/*=======Revisa que mi usuario haya iniciado sesion=======*/
		
		if(result.hasErrors()) {
			System.out.println("hola");
			model.addAttribute("generos", Genre.generos);
			model.addAttribute("especies", Species.especies);
			model.addAttribute("edades", Age.edades);
			model.addAttribute("vacunas", Vaccine.vacunas);
			return "/pet/adopcion.jsp";
			
		}else {
			if(!imagen.isEmpty()) {
                Path directorioImagenes = Paths.get("src/main/resources/static/img");
                String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath();

                try {

                    byte[] bytesImg = imagen.getBytes();
                    Path rutaCompleta = Paths.get(rutaAbsoluta+"/"+imagen.getOriginalFilename());
                    Files.write(rutaCompleta, bytesImg);//guarda la imagen en la ruta

                    pet.setImage(imagen.getOriginalFilename());
                    System.out.println(imagen.getOriginalFilename());
                }catch(IOException e) {
                    e.printStackTrace();
                }
            }
			petService.guardarMascotas(pet);
			return "redirect:/home";
		}
		
	}
	
	@GetMapping("/mostrar/{petId}")
	public String mostrarMascota(@PathVariable("petId")Long petId,
								 Model model,
								 HttpSession session) {
		
		/*Revisa que mi usuario haya iniciado sesion*/
		User userInMethod = (User)session.getAttribute("userInSession");
		
		if(userInMethod == null) { //para que no puedan entrar directamente con el url
			return "redirect:/";
		}
		/*=======Revisa que mi usuario haya iniciado sesion=======*/
		
		Pet mostrarPet = petService.buscarMascotasPorId(petId);
		model.addAttribute("mostrarPet", mostrarPet);
		
		return "/pet/mostrar.jsp";
		
	}
	
	@GetMapping("/donaciones")
	public String donaciones(HttpSession session) {
		
		/*Revisa que mi usuario haya iniciado sesion*/
		User userInMethod = (User)session.getAttribute("userInSession");
		
		if(userInMethod == null) { //para que no puedan entrar directamente con el url
			return "redirect:/";
		}
		/*=======Revisa que mi usuario haya iniciado sesion=======*/
		
		return "/pet/donaciones.jsp";
	}
	
	@GetMapping("/adoptar")
	public String adoptar(Model model) {
		
		model.addAttribute("pets", petService.mostrarMascota());
		
		return "/pet/adoptar.jsp";
	}
	
	@GetMapping("/perfil/{userId}")
	public String perfil(@PathVariable("userId") Long userId,
	                     HttpSession session, Model model) {

	    /*Revisa que mi usuario haya iniciado sesion*/
	    User userInMethod = (User) session.getAttribute("userInSession");

	    if (userInMethod == null) { //para que no puedan entrar directamente con el url
	        return "redirect:/";
	    }
	    /*=======Revisa que mi usuario haya iniciado sesion=======*/
	    model.addAttribute("pets", petService.myPet(userId));
	    //System.out.println(petService.myPet(userId));
	    
	    model.addAttribute("user", userService.buscarId(userId));
	    
	    return "/user/perfil.jsp";
	}

	@GetMapping("/categoria/especies/{specie}")
	public String mostrarMascotasPorSpecie(@PathVariable("specie") String specie, HttpSession session, Model model) {

	    /* Revisa que mi usuario haya iniciado sesion */
	    User userInMethod = (User) session.getAttribute("userInSession");

	    if (userInMethod == null) { // para que no puedan entrar directamente con el url
	        return "redirect:/";
	    }
	    /* ======= Revisa que mi usuario haya iniciado sesion ======= */
	    
	    
	    if (specie.equalsIgnoreCase("perros")) {
	        model.addAttribute("mascotas", petService.getPerros());
	    } else if (specie.equalsIgnoreCase("gatos")) {
	        model.addAttribute("mascotas", petService.getGatos());
	    } else if (specie.equalsIgnoreCase("roedores")) {
	        model.addAttribute("mascotas", petService.getRoedores());
	    } else {
	        model.addAttribute("mascotas", petService.getOtros());
	    }

	    
	    model.addAttribute("especie", specie);
	    return "/categoria/species.jsp";
	}

	@GetMapping("/categoria/generos/{genre}")
	public String mostrarMascotasPorGenero(@PathVariable("genre") String genre, HttpSession session, Model model) {

	    /* Revisa que mi usuario haya iniciado sesion */
	    User userInMethod = (User) session.getAttribute("userInSession");

	    if (userInMethod == null) { // para que no puedan entrar directamente con el url
	        return "redirect:/";
	    }
	    /* ======= Revisa que mi usuario haya iniciado sesion ======= */
	    
	    
	    if (genre.equalsIgnoreCase("machos")) {
	        model.addAttribute("mascotas", petService.getMachos());
	    } else if (genre.equalsIgnoreCase("hembras")) {
	        model.addAttribute("mascotas", petService.getHembras());
	    } 
	    
	    model.addAttribute("genero", genre);
	    return "/categoria/genre.jsp";
	}
	
	@GetMapping("/categoria/edades/{age}")
	public String mostrarMascotasPorEdad(@PathVariable("age") String age, HttpSession session, Model model) {

	    /* Revisa que mi usuario haya iniciado sesion */
	    User userInMethod = (User) session.getAttribute("userInSession");

	    if (userInMethod == null) { // para que no puedan entrar directamente con el url
	        return "redirect:/";
	    }
	    /* ======= Revisa que mi usuario haya iniciado sesion ======= */
	    
	    if (age.equalsIgnoreCase("cachorros")) {
	        model.addAttribute("mascotas", petService.getCachorros());
	    } else if (age.equalsIgnoreCase("adultos")) {
	        model.addAttribute("mascotas", petService.getAdultos());
	    } else if (age.equalsIgnoreCase("seniors")) {
	        model.addAttribute("mascotas", petService.getSeniors());
	    } 
	    
	    model.addAttribute("edad", age);
	    return "/categoria/age.jsp";
	}
	
	/////////////////////eliminar////////////////////////////////////

	@DeleteMapping("/borrar/{petId}")
	public String borrarPet(@PathVariable("petId") Long id) {
		petService.deletePet(id);
		return "redirect:/adoptar";
	}
	//////////////////////editar/////////////////////////////////////////
	
	@GetMapping("/editar/{id}")
	public String showEditForm(@PathVariable("id") Long id, Model model, HttpSession session) {
		
		/* Revisa que mi usuario haya iniciado sesion */
	    User userInMethod = (User) session.getAttribute("userInSession");

	    if (userInMethod == null) { // para que no puedan entrar directamente con el url
	        return "redirect:/";
	    }
	    /* ======= Revisa que mi usuario haya iniciado sesion ======= */
	    
	    Pet pet = petService.findPet(id);
	    if (pet == null) {
	        return "redirect:/home";
	    }
	    model.addAttribute("pet", pet);
	    model.addAttribute("generos", Genre.generos);
	    model.addAttribute("especies", Species.especies);
	    model.addAttribute("edades", Age.edades);
	    model.addAttribute("vacunas", Vaccine.vacunas);
	    return "pet/editar.jsp";
	}

	@PutMapping("/editar/{id}")
	public String updatePet(@PathVariable("id") Long id, @Valid @ModelAttribute("pet") Pet pet, BindingResult result,
	                        @RequestParam("imagen") MultipartFile imagen, HttpSession session, Model model) {
	    User userInSession = (User) session.getAttribute("userInSession");
	    if (userInSession == null) {
	        return "redirect:/";
	    }
	    Pet existingPet = petService.findPet(id);
	    if (existingPet == null) {
	        return "redirect:/home";
	    }
	    if (result.hasErrors()) {
	        model.addAttribute("generos", Genre.generos);
	        model.addAttribute("especies", Species.especies);
	        model.addAttribute("edades", Age.edades);
	        model.addAttribute("vacunas", Vaccine.vacunas);
	        return "pet/editar.jsp";
	    } else {
	        if (!imagen.isEmpty()) {
	            Path directorioImagenes = Paths.get("src/main/resources/static/img");
	            String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath();

	            try {
	                byte[] bytesImg = imagen.getBytes();
	                Path rutaCompleta = Paths.get(rutaAbsoluta + "/" + imagen.getOriginalFilename());
	                Files.write(rutaCompleta, bytesImg);
	                pet.setImage(imagen.getOriginalFilename());
	                System.out.println(imagen.getOriginalFilename());
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        
	        existingPet.setName(pet.getName());
	        existingPet.setGenre(pet.getGenre());
	        existingPet.setSpecies(pet.getSpecies());
	        existingPet.setAge(pet.getAge());
	        petService.guardarPet(existingPet);
	        
	        return "redirect:/home";
	    }
	}
	
}