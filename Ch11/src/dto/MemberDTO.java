package dto;

public class MemberDTO {
    private String uid;
    private String name;
    private String hp;
    private String pos;
    private String dep;
    private String rDate;

    @Override
    public String toString() {
        return "MemberDTO{" +
                "uid='" + uid + '\'' +
                ", name='" + name + '\'' +
                ", hp='" + hp + '\'' +
                ", pos='" + pos + '\'' +
                ", dep='" + dep + '\'' +
                ", rDate='" + rDate + '\'' +
                '}';
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHp() {
        return hp;
    }

    public void setHp(String hp) {
        this.hp = hp;
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
    }

    public String getrDate() {
        return rDate;
    }

    public void setrDate(String rDate) {
        this.rDate = rDate;
    }
}
