package com.course.springboot.myfirstwebapp.todo;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TodoRepository extends JpaRepository<Todo,Integer >{
	public List<Todo> findByUsername(String username);
	
	List<Todo> findByUsernameAndDescriptionContainingIgnoreCase(String username, String keyword);


	long countByDone(boolean done);

  

}

