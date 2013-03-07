import java.util.Scanner;

public class Exam {
  public static void main(String[] args){
    Scanner sc = new Scanner(System.in);
    int a = 0;
    try{
      a = sc.nextInt();
    }
    catch(Exception e){
      System.out.println("xx");
      main(args);
    }
    if(a <= 0){
      System.out.println("xx error");
      main(args);
    }
    else{
      excute(a);
      main(args);
    }
  }
  static void excute(int a){
    if(a%2 != 0){
      System.out.println(a/2 + "+" + (a/2+1));
    }
    for(int i=a/2; i>=Math.sqrt(a); i--){
      if(a%i == 0){
        int j = a/i;
        if(i%2 != 0){
          String s = "";
          for(int m=i/2; m>=-(i/2); m--){
            if(j-m < 0) break;
            s += j-m + "+";	
          }
          if(s.length() > 1){
            s = s.substring(0, s.length()-1);
            System.out.println(s);
          }
        }
        if(i != j && j%2 != 0){
          String s = "";
          for(int m=j/2; m>=-(j/2); m--){	
            if(i-m < 0) break;
            s += i-m + "+";			
          }
          if(s.length() > 1){
            s = s.substring(0, s.length()-1);
            System.out.println(s);
          }
        }
      }
      else if(a/i>2 && (a/i)%2 == 0 && a%i == (a/i)/2){
        String s = "";
        for(int m=i-a%i+1; m<=i+a%i; m++){
          s += m + "+";
        }
        if(s.length() > 1){
          s = s.substring(0, s.length()-1);
          System.out.println(s);
        }
      }
    }
  }
}
