package user.service;

import java.io.IOException;
import java.util.ArrayList;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService {


	@Override
	public void execute() {
		System.out.println();
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = UserDAO.getInstance();
		//Scanner scan = new Scanner(System.in);
		
		System.out.print("삭제할 아이디 입력 : ");
		String id = scan.nextLine();
				
		
		userDTO.setId(id);
		
		
		userDAO.delete(userDTO);
		
		System.out.println("데이터를 삭제 완료했습니다.");

		
	}

}
