package jsp.member.model;  // 자바빈만 모아놓을 패키지, 생략가능
 
public class MemberBean 
{
    // 아이디, 비밀번호, 주소, 전화를 담을 프로퍼티(맴버변수)
    // 프로퍼티에 직접 접근할 수 없게 private를 사용한다.
    private String id;
    private String pw;
    private String Addr;
    private String tel;
    private String Name;
    private String Gender;
    private String Mail1;
    private String Mail2;
    private String Birthyy;
    private String Birthmm;
    private String Birthdd;
    
    /* 데이터를 가져오거나(get), 세팅하는(set)
    *  기능을 하는 메서드를 만든다.
    *  - 데이터를 가져오는 경우 - get메서드
    *  - 데이터를 세팅하는 경우 - set메서드
    */
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPw() {
        return pw;
    }
    public void setPw(String pw) {
        this.pw = pw;
    }
    public String gettel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel= tel;
    }
    public String getAddr() {
        return Addr;
    }
    public void setAddr(String Addr) {
        this.Addr = Addr;
        
    }
    public void setName(String Name) {
        this.id = Name;
    }
    public String getName() {
        return Name;
    }
    public void setGender(String Gender) {
        this.Gender = Gender;
    }
    public String getGender() {
        return Gender;
    }
    public void setMail1(String Mail1) {
        this.Mail1= Mail1;
    }
    public String getMail1() {
        return Mail1;
    }
    public void setMail2(String Mail2) {
        this.Mail2 = Mail2;
    }
    public String getMail2() {
        return Mail2;
    }
    public void setBirthyy(String Birthyy) {
        this.Birthyy = Birthyy;
    }
    public String getBirthyy() {
        return Birthyy;
    }
    public void setBirthmm(String Birthmm) {
        this.Birthmm = Birthmm;
    }
    public String getBirthmm() {
        return Birthmm;
    }
    public void setBirthdd(String Birthdd) {
        this.Birthdd= Birthdd;
    }
    public String getBirthdd() {
        return Birthdd;
    }
}
