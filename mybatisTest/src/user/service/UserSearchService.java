package user.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void execute() {
		System.out.println();
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = UserDAO.getInstance();
		//Scanner scan = new Scanner(System.in);
		
		System.out.println("1.이름 검색");
		System.out.println("2.아이디 검색");
		int num = scan.nextInt();
		
		
			
		if (num == 1) {
			
		
			System.out.println("찾고자 하는 이름 입력 : ");
			scan.nextLine();
			String name = scan.nextLine();
			System.out.println();
				
			userDTO.setName(name);
										
		
		} else {

			System.out.println("찾고자 하는 아이디 입력 : ");
			scan.nextLine();
			String id = scan.nextLine();
			System.out.println();
			userDTO.setId(id);
			
		}
				
		List<UserDTO> list = userDAO.search(userDTO);
		
		if (list != null ) {
			System.out.println("이름\t아이디\t비밀번호");
			
			for (UserDTO searchList : list) {
				System.out.print(searchList.getName() + "\t");
				System.out.print(searchList.getId() + "\t");
				System.out.print(searchList.getPwd());
				System.out.println();
			}
			
		} else {
			System.out.println();	
			System.out.println("해당 데이터는 존재하지 않습니다.");
		}
		
		
		System.out.println();
		System.out.println("조회가 완료되었습니다.");
		
	}


}
