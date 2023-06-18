package com.codingdojo.alanis.models;


import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Size(min = 2, max = 55) 
    @NotEmpty
	private String name;
	
	//@Size(min=10, max=13)
	//private String rut;
	
	@NotNull
	@Size(min=2)
	@Email
	private String email;
	
	@NotEmpty
	@Size(min=6)
	private String password;
	
	@Transient //No guarda el dato DB
	@Size(min=6)
	private String confirm;
	
	@NotEmpty
	@Size(min=2, max=300)
	private String city;
	
	@NotEmpty
	@Size(min=2, max=300)
	private String region;
	
	
	@Size(min=2, max=300)
	private String address;
	
	@Past
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	

	@Size(min=2, max=300)
	private String type;

	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	///////////////////////////////////
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Publication> publications;
	
	@OneToMany(mappedBy="owner", fetch = FetchType.LAZY)
	private List<Pet> myPets;
	
	
	////Relación de mensajes
	@OneToMany(mappedBy="remitter", fetch = FetchType.LAZY)
	List<Message> messageSent;
	
	@OneToMany(mappedBy="receptor", fetch = FetchType.LAZY)
	List<Message> messageReceived;
	
	/////////////////////////////////
	public User() {
	}
	
	//////////////////////////////////////////////////
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getConfirm() {
		return confirm;
	}


	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getRegion() {
		return region;
	}


	public void setRegion(String region) {
		this.region = region;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
	
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	public List<Publication> getPublications() {
		return publications;
	}

	public void setPublications(List<Publication> publications) {
		this.publications = publications;
	}

	public List<Pet> getMyPets() {
		return myPets;
	}

	public void setMyPets(List<Pet> myPets) {
		this.myPets = myPets;
	}
    
    
	
}
