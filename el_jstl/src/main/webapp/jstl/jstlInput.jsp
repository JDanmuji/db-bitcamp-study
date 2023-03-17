<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
   </head>
   
   <body>
      <form name="jstlInput"  action="jstlResult.jsp">
         <table border="1" cellpadding="5" cellspacing="0" >
            
            <tr>
               <th>이름</th>
               <td>
                  <input type="text" name="name" placeholder="이름 입력">
               </td>
            </tr>
            
            <tr>
               <th>나이</th>
               <td>
                  <input type="text" name="age">
               </td>
            </tr>
            
            <tr>
               <th width="70">색깔</th>
               <td>
                  <select name="color" style="width: 120px;">
                     <optgroup label="색깔">
                        <option value="red">빨강</option>
                        <option value="green">초록</option>
                        <option value="blue">파랑</option>
                        <option value="magenta">보라</option>
                        <option value="sky">하늘</option>
                     </optgroup>
                  </select>
               </td>
            </tr>
            
            <tr>
               <th>취미</th>
               <td>
                  <input type="checkbox" name="hobby" id="hobby_book" value="book"/>
                  <label for="hobby">독서</label> 
                  <input type="checkbox" name="hobby" id="hobby_movie" value="movie" /> 
                  <label for="hobby">영화</label>
                  <input type="checkbox" name="hobby" id="hobby_music" value="music"/> 
                  <label for="hobby">음악</label>
                  <input type="checkbox" name="hobby" id="hobby_game" value="game"/> 
                  <label for="hobby">게임</label>
                  <input type="checkbox" name="hobby" id="hobby_shopping" value="shopping"/> 
                  <label for="hobby">쇼핑</label>
               </td>
            </tr>
            
            <tr>
               <td colspan="2" align="center">
                  <input type="submit" value="SEND" >
                  <input type="reset" value="CANCEL">
               </td>
            </tr>
            
         </table>
      </form>
   </body>
</html>