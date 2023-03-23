package board.bean;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class BoardDTO {
	
	@NonNull
	private String seq;
	@NonNull
	private String id;
	@NonNull
	private String name;
	private String email;
	@NonNull
	private String subject;
	@NonNull
	private String content;
	@NonNull
	private String ref;
	@NonNull
	private String lev;
	@NonNull
	private String step;
	@NonNull
	private String pSeq;
	@NonNull
	private String reply;
	
	private String hit;
	private String logTime;
	
}
