package com.app.danspro.dto;

import javax.persistence.Column;
import javax.persistence.Transient;

import com.app.danspro.role.Role;
import com.app.danspro.users.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LoginResponseDto { 
	
	private String token;
	private Long id;
	private String username;
	private String email;
	private List<String> roles;
	
}
