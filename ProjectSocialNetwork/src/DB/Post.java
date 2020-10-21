package DB;

import java.sql.Timestamp;

public class Post {
    private Long id;
    private Long author_id;
    private String title;
    private String short_content;
    private String content;
    private Timestamp post_date;
    private String author_name;

    public Post() {
    }

    public Post(Long id, Long author_id, String title, String short_content, String content, Timestamp post_date, String author_name) {
        this.id = id;
        this.author_id = author_id;
        this.title = title;
        this.short_content = short_content;
        this.content = content;
        this.post_date = post_date;
        this.author_name = author_name;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(Long author_id) {
        this.author_id = author_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShort_content() {
        return short_content;
    }

    public void setShort_content(String short_content) {
        this.short_content = short_content;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getPost_date() {
        return post_date;
    }

    public void setPost_date(Timestamp post_date) {
        this.post_date = post_date;
    }
}
