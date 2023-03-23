<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Dimension by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		
		<!-- Wrapper -->
			<div id="wrapper">
				<article id="EDIT">
					<h2 class="major">SIGN UP</h2>
						<form name="writeForm" method="post" action="/member/write.do">
							<table>							
								<tr>
								  	<th>이름</th>
								  	<td>
								  	 <input type="text" name="name" id="name" placeholder="이름 입력"/>
								  	 <div id="nameDiv"></div>
								  	</td>
								  </tr>
								  
								  <tr>
								  	<th>아이디</th>
								  	<td>
								  	 <input type="text" name="id" id="id" size="30" placeholder="아이디 입력"/>
								  	 <input type="hidden" id="check" value="">
								  	 <input type="button" value="중복체크" onclick="loginCheck()"/>
								  	 <div id="idDiv"></div>
								  	</td>
								  </tr>
								  
								  <tr>
								  	<th>비밀번호</th>
								  	<td>
								  	 <input type="password" name="pwd" id="pwd" size="40"/>
								  	 <div id="pwdDiv"></div>
								  	</td>
								  </tr>
								  
								  <tr>
								  	<th>재확인</th>
								  	<td>
								  	 <input type="password" name="rdpwd" id="repwd" size="40" />
								  	</td>
								  </tr>
								  
								  <tr>
								   <th>성별</th>
								    <td>
								     <input type="radio" name="gender" id="gender_m" value="0" />
								     <label for="gender_m">남자</label>			
								     <input type="radio" name="gender" id="gender_f" value="1" />
								     <label for="gender_f">여자</label>	
								    </td>		
								  </tr>
								  
								  <tr>
								   <th>이메일</th>
								   <td>
								    <ul class="actions">
																			    
								    	<li><input type="text" name="email1" style="width: 120px;" ></li>
								    	<li><span>@</span></li>
								    	<li><input type="text" name="email2" style="width: 120px;"></li>
								    	<li><select name="email3" id="email3" style="width: 120px;" onchange="select()" >
								     	<option value="">직접입력</option>
								     	<option value="naver.com">naver.com</option>
								     	<option value="gmail.com">gmail.com</option>
								     	<option value="nate.com">nate.com</option>
									    </select>
									    </li>
								    </ul>
								   </td>
								  </tr>
								  
								  <tr>
								   <th>휴대폰</th>
								  
								   <td>
									   <ul class="actions">
								   
								    	<li><select name="tel1" id="tel1" style="width: 90px;">
								     		<option value="010" >010</option>
								     		<option value="011">011</option>
								     		<option value="019">019</option>
								     		<option value="070">070</option>
									    </select>	
										
										<input type="hidden"  name="tel1" id="tel1"/>
								    	</li>
								    	<li><span>-</span></li>
								    	<li>	
								    	<input type="text" name="tel2" style="width: 90px;"/>
								    	</li>
								    	<li><span>-</span></li>
								    	<li>	
								    	<input type="text" name="tel3" style="width: 90px;"/>
								    	</li>
								    	</ul>
								   </td>
								  </tr>
								  
								  <tr>
								   <th>주소</th>
								   <td>
								      <ul class="actions">
								    <li><input type="text" name="zipcode" id="zipcode" size="10" placeholder="우편번호" readonly/></li>								    
								    <li><input type="button" value="우편번호검색" onclick="execDaumPostcode()"/></li>
								    </ul>
								    <br>
								    <input type="text" name="addr1" id="addr1" style="width: 400px;" placeholder="주소" readonly/>
								    <br>
								    <input type="text" name="addr2" id="addr2" style="width: 400px;" placeholder="상세주소"/>
								    
								   </td>
								  </tr>
								
								<tfoot>
									<tr>
										<td colspan="2" align="center">
  	 										<input type="button" value="회원가입" onclick="checkWrite()">
										  	<input type="reset" value="다시작성">	
  										</td>
									</tr>
								</tfoot>
							</table>
						</form>
					
					</article>
				
					
				<!-- Footer -->
					<footer id="footer">
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
						</ul>
					</footer>
				
			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script type="text/javascript" src="../js/member.js"></script>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			
			
	</body>
</html>
