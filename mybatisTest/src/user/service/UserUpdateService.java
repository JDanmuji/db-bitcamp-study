package user.service;

import java.io.IOException;
import java.util.ArrayList;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService {

	@Override
	public void execute() {
		System.out.println();
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = UserDAO.getInstance();
		//Scanner scan = new Scanner(System.in);
		
		System.out.println("수정할 아이디 입력 : ");
		String id = scan.nextLine();
		userDTO.setId(id);
		
		
			
		if (userDAO.userSelect(userDTO) > 0) {
			
			System.out.print("수정할 이름 입력 : ");
			String name = scan.nextLine();
			System.out.println("수정할 비밀번호 입력 : ");
			String pwd = scan.nextLine();
			
				
			//userDTO.setId(id);
			userDTO.setName(name);
			userDTO.setPwd(pwd);
			
			userDAO.update(userDTO);
			System.out.println("데이터 수정이 완료되었습니다.");
		
		} else {
			System.out.println("해당 아이디는 존재하지 않습니다.");
			
		}
		
		
		
		
		
	}


}
