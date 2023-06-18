package com.codingdojo.alanis.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.alanis.models.Pet;
import com.codingdojo.alanis.models.User;

@Repository
public interface PetRepository extends CrudRepository<Pet, Long>{
	
	
	List<Pet> findByName(String name); //ejemplo
	
	Optional<Pet> findById(Long id);//por id 
	
	//List<Pet> findFirst8ById(Long id);
	
	@Query(value="SELECT * FROM pets LIMIT 20;" , nativeQuery = true)
    List<Pet> carrusel();

	
	//select pets.id from pets 
	
	
	@Query(value = "SELECT * FROM pets WHERE species = 'perro'", nativeQuery = true)
    List<Pet> getPerros();
	
	@Query(value = "SELECT * FROM pets WHERE species = 'gato'", nativeQuery = true)
    List<Pet> getGatos();
	
	@Query(value = "SELECT * FROM pets WHERE species = 'roedor'", nativeQuery = true)
    List<Pet> getRoedores();
	
	@Query(value = "SELECT * FROM pets WHERE species = 'otro'", nativeQuery = true)
    List<Pet> getOtros ();
	

	
	@Query(value = "SELECT * FROM pets WHERE genre = 'macho'", nativeQuery = true)
    List<Pet> getMachos();
	
	@Query(value = "SELECT * FROM pets WHERE genre = 'hembra'", nativeQuery = true)
    List<Pet> getHembras();
	
	
	
	@Query(value = "SELECT * FROM pets WHERE age = 'cachorro'", nativeQuery = true)
    List<Pet> getCachorros();
	
	@Query(value = "SELECT * FROM pets WHERE age = 'adulto'", nativeQuery = true)
    List<Pet> getAdultos();
	
	@Query(value = "SELECT * FROM pets WHERE age = 'senior'", nativeQuery = true)
    List<Pet> getSeniors();
	
	
	void deleteById(Long id);
	
	Pet save(Pet nuevoPet);
	
	@Query(value = "SELECT * FROM pets WHERE user_id = ?1", nativeQuery = true)
    List<Pet> getOwnerPets(Long id);
}
