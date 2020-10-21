package DB;

import java.sql.Timestamp;

public class Chat {

    private Long id;
    private Long user_id;
    private Long opponent_user_id;
    private Timestamp created_date;
    private String latest_message_text;
    private Timestamp latest_message_time;

    public Chat() {
    }

    public Chat(Long id, Long user_id, Long opponent_user_id, Timestamp created_date, String latest_message_text, Timestamp latest_message_time) {
        this.id = id;
        this.user_id = user_id;
        this.opponent_user_id = opponent_user_id;
        this.created_date = created_date;
        this.latest_message_text = latest_message_text;
        this.latest_message_time = latest_message_time;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Long getOpponent_user_id() {
        return opponent_user_id;
    }

    public void setOpponent_user_id(Long opponent_user_id) {
        this.opponent_user_id = opponent_user_id;
    }

    public Timestamp getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Timestamp created_date) {
        this.created_date = created_date;
    }

    public String getLatest_message_text() {
        return latest_message_text;
    }

    public void setLatest_message_text(String latest_message_text) {
        this.latest_message_text = latest_message_text;
    }

    public Timestamp getLatest_message_time() {
        return latest_message_time;
    }

    public void setLatest_message_time(Timestamp latest_message_time) {
        this.latest_message_time = latest_message_time;
    }
}
