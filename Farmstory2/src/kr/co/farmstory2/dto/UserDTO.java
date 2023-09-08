package kr.co.farmstory2.dto;

public class UserDTO {
    private String uid;
    private String pass;
    private String name;
    private String nick;
    private String email;
    private String hp;
    private String role;
    private String zip;
    private String addr1;
    private String addr2;
    private String regIp;
    private String regDate;
    private String leaveDate;
    private int total;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    public void setTotal(String total) {
        this.total = Integer.parseInt(total);
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHp() {
        return hp;
    }

    public void setHp(String hp) {
        this.hp = hp;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public String getRegIp() {
        return regIp;
    }

    public void setRegIp(String regIp) {
        this.regIp = regIp;
    }

    public String getRegDate() {
        return regDate;
    }
    public String getRegDateYMD() {
        return regDate.substring(0,10);
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(String leaveDate) {
        this.leaveDate = leaveDate;
    }

    @Override
    public String toString() {
        return getUid()+", "+getName()+", "+getNick()+", "+getEmail()+", "+getHp()+", "+getRole()+", "+getZip()+", "+getAddr1()+", "+ getAddr2()+", "+getRegIp()+", "+ getRegDate() +", "+ getLeaveDate()+","+getTotal();
    }
}
