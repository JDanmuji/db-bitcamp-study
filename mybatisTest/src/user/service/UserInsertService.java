package user.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserInsertService implements UserService {


	@Override
	public void execute() {
		System.out.println();
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = new UserDAO();
		//Scanner scan = new Scanner(System.in);
		
		System.out.print("이름 입력 : ");
		String name = scan.nextLine();
		System.out.println("아이디 입력 : ");
		String id = scan.nextLine();
		System.out.println("비밀번호 입력 : ");
		String pwd = scan.nextLine();
		
		
		userDTO.setId(id);
		userDTO.setName(name);
		userDTO.setPwd(pwd);
		
		
		userDAO.write(userDTO);
		
		System.out.println("데이터를 저장했습니다.");

		
	}
	
}
