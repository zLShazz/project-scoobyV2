package com.codingdojo.alanis.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.alanis.models.Message;
import com.codingdojo.alanis.repositories.MessageRepository;

@Service
public class MessageService {

	@Autowired
	private MessageRepository messaRepo;
	
	public Message guardarMensaje(Message newMessage) {
		return messaRepo.save(newMessage);
	}
	
	public List<Message> conversacion(Long remitter, Long receptor) {
		return messaRepo.chat(remitter, receptor);
	}
	
}
