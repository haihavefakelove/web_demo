package maHoa;

import java.security.MessageDigest;
import java.util.Base64;

public class maHoa {
    public static String toSHA( String str){
        String salt = "sdbsjabuwenjdjnfj23";
        String result= null;
        str= str+salt;
        try{
            byte[] dataBytes = str.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            result= Base64.getEncoder().encodeToString(md.digest(dataBytes));
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
