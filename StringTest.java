import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
public class StringTest {
  public static void main(String[] args) throws UnsupportedEncodingException {
    String hex = URLEncoder.encode("李易烜", "UTF8");
    String chsHex = URLDecoder.decode(hex, "utf8");
    System.out.println("汉字到16进制 ==> " + hex);
    System.out.println("16进制到汉字 ==> " + chsHex);
    System.out.println();
    String src = "李易烜"; 
    String htmlStr = "";
    String cnStr = "";
    for(int i=0; i!=src.length(); i++){
      int str = src.codePointAt(i);
      htmlStr = htmlStr+"&#"+str+";";
      cnStr = cnStr+""+(char)str;
    }
    System.out.println("汉字到html转义符 ==> " + htmlStr);
    System.out.println("html转义符到汉字 ==> " + cnStr);
  }
}
