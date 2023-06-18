package com.codingdojo.alanis.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.alanis.models.Message;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long> {
	
	
	
	@Query(value="SELECT * FROM messages WHERE (remitter_id = ?1 AND receptor_id = ?2) OR (remitter_id = ?2 AND receptor_id = ?1) ORDER BY created_at ASC", nativeQuery = true)
	List<Message> chat(Long remitter, Long receptor);
	

}
