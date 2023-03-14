package user.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSelectService implements UserService {

	@Override
	public void execute() {
		System.out.println();
		
		
		UserDAO userDAO = UserDAO.getInstance();
		
		System.out.println("이름\t아이디\t비밀번호");
		
		for(UserDTO userDTO : userDAO.getUserList()) {
			System.out.print(userDTO.getName() + "\t");
			System.out.print(userDTO.getId() + "\t");
			System.out.print(userDTO.getPwd());
			System.out.println();
		}
		
		
		
		//userDAO.select(userDTO);
		
		System.out.println("데이터를 조회를 완료했습니다.");

		
	}

	

}
