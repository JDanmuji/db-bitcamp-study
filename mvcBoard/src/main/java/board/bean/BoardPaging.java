package board.bean;

import lombok.Data;

@Data
public class BoardPaging {
	// 현재 페이지
	private int currentPage;
	// [이전][1][2][3][다음]
	private int pageBlock;
	// 1페이지당 5개씩
	private int pageSize;
	// 총글 수
	private int totalA;
	private StringBuffer pagingHTML;
	

	public StringBuffer makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		//총 페이지 수
		int totalP = (totalA + (pageSize-1)) / pageSize; //(총글수 + 4) / 5
		
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		
		
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		if (startPage != 1) {
			pagingHTML.append("<span id='paging' onclick='boardPaging(" + (startPage-1) + ")'>[이전]</span>");
		}
		
		for (int i = startPage; i <= endPage; i++) {
			
			if (i == currentPage) {
				pagingHTML.append("<span id='currentPaging' onclick='boardPaging(" + i + ")'> " + i + "</span>");
			} else {
				pagingHTML.append("<span id='paging' onclick='boardPaging(" + i + ")'> " + i + "</span>");	
			}
			
		}
		
		if (endPage < totalP) {
			pagingHTML.append("<span id='paging' onclick='boardPaging(" + (endPage+1) + ")'>[다음]</span>");
		}
		
		return pagingHTML;
		
	
		
	}
}
