package utility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

public class Utility {
	
	public static String getCodeValue(String code){
		String value = null;
		Hashtable codes = new Hashtable();
		codes.put("A01", "회사원");
		codes.put("A02", "전산관련직");
		codes.put("A03", "연구전문직");
		codes.put("A04", "각종학교학생");
		codes.put("A05", "일반자영업");
		codes.put("A06", "공무원");
		codes.put("A07", "의료인");
		codes.put("A08", "법조인");
		codes.put("A09", "종교/언론/예술인");
		codes.put("A10", "기타");
		 
		value = (String)codes.get(code);
		 
		return value;
		}
	public static boolean compareDay(String wdate) {
		boolean flag = false;
		List<String> list = getDay();
		if(wdate.equals(list.get(0))||wdate.equals(list.get(1))||wdate.equals(list.get(2))) {
			flag=true;
		}
			
			//첫번째값과 비교
		
		return flag;
	}
	
	//메소드내에서만 사용하여 private로
	private static List<String> getDay() {
		List<String> list = new ArrayList<String>();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		
		//캘린더 객체 생성
		Calendar cal = Calendar.getInstance(); //로컬에 맞는 시간를 제공해줌.
		
		//3개에 대한 주소
		for(int j=0; j<3; j++) {
			list.add(sd.format(cal.getTime())); //날짜가 sd형식으로 바뀌어 add에 추가
			cal.add(Calendar.DATE,-1); //날짜가 하나씩 -1
		}
		return list;
	}
	
	//검색을 안할 때
	public static String checkNull(String str) {
		if(str==null)
			str = "";
		return str;
	}
	
	 /** 
	  *  
	  * @param totalRecord 전체 레코드수 
	  * @param nowPage     현재 페이지 
	  * @param recordPerPage 페이지당 레코드 수  
	  * @param col 검색 컬럼  
	  * @param word 검색어
	  * @return 페이징 생성 문자열
	  */ 
	
	///검색한 것을 유지하기 위해서 col, word도 가져감
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
	   int pagePerBlock = 5; // 블럭당 페이지 수 
	   
	   //Math.ceil는 소수점이 있을 경우 무조건 올림 ex)3.1 -> 4로 
	   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지   
	   //pagePerBlock이 5로 설정되어있고, 그중 5개가 채워지지 못한 레코드가 있다면 하나의 그룹으로 묶어줌.
	   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
	   //현재 페이지가 13일경우 13/5 -> 2.xxx -> ceil인해 3그룹
	   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
	   
	   //블럭의 시작과 끝
	   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
	   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
	    
	   StringBuffer str = new StringBuffer(); 
	   str.append("<div style='text-align:center'>"); 
	   str.append("<ul class='pagination'> ");
	   //이전을 만들어주는 경우
	   int _nowPage = (nowGrp-1) * pagePerBlock; // 5개 이전 페이지로 이동 
	   if (nowGrp >= 2){ //자신이 현재보고 있는 그룹이 2그룹 이상이라면 -> 1그룹은 이전이 필요가 없기 때문에 보여주지 않음
	     str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>이전</A></li>"); 
	   } 
	 
	   //이전과 다음이 없는 값을 만들어 주는 경우
	   for(int i=startPage; i<=endPage; i++){ 
	     if (i > totalPage){ 
	       break; 
	     } 
	 
	     if (nowPage == i){ //1페이지 -> 1페이지
	       str.append("<li class='active'><a href=#>"+i+"</a></li>"); 
	     }else{ //그렇지 않을경우 1페이지 -> 2페이지로 가기위한 링크
	       str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></li>");   
	     } 
	   } 
	   
	   //다음을 만들어주는 경우
	   _nowPage = (nowGrp * pagePerBlock)+1; // 5개 다음 페이지로 이동  1~5페이지가 한그룹이니까 6부터?페이지를 가져가겠다.
	   if (nowGrp < totalGrp){//total그룹보다 nowGrp이 작아야만 다음으로 갈 수 있기 때문에
	     str.append("<li><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>다음</A></li>"); 
	   } 
	   str.append("</ul>"); 
	   str.append("</div>"); 
	    
	   return str.toString(); 
	} 
}
