package kr.co.farmstory2.dto;

public class FileDTO {
    private int fNo;
    private int aNo;
    private String oriName;
    private String newName;
    private int download;
    private String rDate;

    public int getfNo() {
        return fNo;
    }

    public void setfNo(int fNo) {
        this.fNo = fNo;
    }

    public int getaNo() {
        return aNo;
    }

    public void setaNo(int aNo) {
        this.aNo = aNo;
    }

    public String getOriName() {
        return oriName;
    }

    public void setOriName(String oriName) {
        this.oriName = oriName;
    }

    public String getNewName() {
        return newName;
    }

    public void setNewName(String newName) {
        this.newName = newName;
    }

    public int getDownload() {
        return download;
    }

    public void setDownload(int download) {
        this.download = download;
    }

    public String getrDate() {
        return rDate;
    }

    public void setrDate(String rDate) {
        this.rDate = rDate;
    }
}
