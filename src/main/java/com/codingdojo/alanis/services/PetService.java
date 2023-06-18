package com.codingdojo.alanis.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.alanis.models.Pet;
import com.codingdojo.alanis.models.User;
import com.codingdojo.alanis.repositories.PetRepository;


@Service
public class PetService {

	@Autowired
	private PetRepository petRepo;
	
	public Pet buscarMascotasPorId(Long id) {
		Optional<Pet> Mascota = petRepo.findById(id);
		if(Mascota.isPresent()) {
			return Mascota.get();
		}else {
			return null;
		}
	}
	
	public Pet guardarMascotas(Pet newPet) {
		return petRepo.save(newPet);
	}
	
	public List<Pet> mostrarMascota() {
		return (List<Pet>) petRepo.findAll();
	}
	
	//Listado de primeras 8 mascotas
	public List<Pet> carrusel() {
		return petRepo.carrusel();
	}
	
///////////////////////////// FILTRADO POR ESPECIE //////////////////////////
	
		public List<Pet> getPerros() {
			return petRepo.getPerros();
		}
		
		public List<Pet> getGatos() {
			return petRepo.getGatos();
		}
		
		public List<Pet> getRoedores() {
			return petRepo.getRoedores();
		}
		
		public List<Pet> getOtros() {
			return petRepo.getOtros();
		}
		
		
		///////////////////////////// FILTRADO POR GENERO //////////////////////////////////////
		public List<Pet> getMachos() {
			return petRepo.getMachos();
		}
		
		public List<Pet> getHembras() {
			return petRepo.getHembras();
		}
		
		/////////////////////////////// FILTRADO POR LA EDAD ///////////////////////////////
		
		public List<Pet> getCachorros() {
			return petRepo.getCachorros();
		}
		
		public List<Pet> getAdultos() {
			return petRepo.getAdultos();
		}
		
		public List<Pet> getSeniors() {
			return petRepo.getSeniors();
		}



		/////////////////////////////eliminar///////////////////////////////////////////////////////
		
		public void deletePet(Long id) {
			petRepo.deleteById(id);
		}
		
		/////////////////////editar////////////////////////////////////////////////////////
		public Pet findPet(Long id) {
			return petRepo.findById(id).orElse(null);
		}
		
		public Pet guardarPet(Pet nuevoPet) {
			return petRepo.save(nuevoPet);
		}
		
		public List<Pet> myPet(Long id){
			return petRepo.getOwnerPets(id);
		}
}

