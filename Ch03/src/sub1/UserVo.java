package sub1;

public class UserVo {
    private String  uid;
    private String  name;
    private String  hp;
    private int  age;

    public UserVo(String uid, String name, String hp, int age) {
        this.uid = uid;
        this.name = name;
        this.hp = hp;
        this.age = age;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
