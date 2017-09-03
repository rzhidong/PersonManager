package com.manager.action;

import java.util.List;

import com.manager.enity.PersonEnity;

public interface IPersonAction {
	
	public boolean insertPerson(PersonEnity personEnity);
	
	public boolean isExistByName(String username);
	
	public PersonEnity getOnePerson(int id);
	
	public List<PersonEnity> getAllPersons();
	
	public boolean deletePerson(int id);
	
	public boolean updatePerson(PersonEnity personEnity);

}
