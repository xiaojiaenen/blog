package Bean;

public class Admin {
    private String user;
    private String pwd;

    public Admin() {
    }

    public Admin(String user, String pwd) {
        this.user = user;
        this.pwd = pwd;
    }

    public String getUser() {
        return user;
    }

    public String getPwd() {
        return pwd;
    }
}
