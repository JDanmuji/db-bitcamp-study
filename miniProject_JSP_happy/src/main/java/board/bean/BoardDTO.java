package board.bean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {
	private String seq;
	private String id;
	private String name;
	private String email;
	private String subject;
	private String content;
	private int ref;
	private int lev;
	private int step;
	private int pseq;
	private int reply;
	private int hit;
	private Date logtime;

	



}
