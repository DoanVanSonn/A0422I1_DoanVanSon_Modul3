import java.util.Date;

public class Custumer {
    private String name;
    private String birthDay;
    private String address;
    private String linkUrl;

    public Custumer() {
    }

    public Custumer(String name,
                    String birthDay,
                    String address,
                    String linkUrl) {
        this.name = name;
        this.birthDay = birthDay;
        this.address = address;
        this.linkUrl = linkUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

}
