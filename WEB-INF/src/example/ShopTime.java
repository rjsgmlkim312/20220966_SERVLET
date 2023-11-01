package example;
import java.util.Date; // 날짜 관련 정보 얻기
import java.text.SimpleDateFormat;
import java.util.TimeZone;

public class ShopTime {
    public String timenow() {
        // 서울 시간대로 설정
        TimeZone seoulTimeZone = TimeZone.getTimeZone("Asia/Seoul");
        Date day = new Date();
        
        // 서울 시간대로 날짜 설정
        SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss a");
        sdf.setTimeZone(seoulTimeZone);
        
        // 포맷된 현재 시간 문자열 얻기
        String formattedTime = sdf.format(day);
        
        return formattedTime;
    }
}
/*
    public String timenow() {
       Date day = new java.util.Date();
        String am_pm;
        int hour = day.getHours(); // 시간
        int minute = day.getMinutes(); // 분
        int second = day.getSeconds(); // 초
        if (hour / 12 == 0) {
            am_pm = "AM"; // 오전 판단
        } else {
            am_pm = "PM"; // 오후 판단
            hour = hour - 12;
        }
        String CT = hour + ":" + minute + ":" + second + " " + am_pm; // 출력 문자열 조합
        return CT; // 문자열 리턴
    }
*/