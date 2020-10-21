package DB;

public class Users {
    private Long id;
    private String email;
    private String password;
    private String full_name;
    private String birthdate;
    private String url_pic;

    public Users(Long id, String email, String password, String full_name, String birthdate, String url_pic) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.full_name = full_name;
        this.birthdate = birthdate;
        this.url_pic = url_pic;
    }

    public Users() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getUrl_pic() {
        return url_pic;
    }

    public void setUrl_pic(String url_pic) {
        this.url_pic = url_pic;
    }
}
