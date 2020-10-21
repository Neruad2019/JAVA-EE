package DB;

import java.sql.Timestamp;

public class Message {
    private Long id;
    private Long chat_id;
    private Long user_id;
    private Long sender_id;
    private String message_text;
    private Timestamp sent_time;
    private boolean read_by_receiver;

    public Message() {
    }

    public Message(Long id, Long chat_id, Long user_id, Long sender_id, String message_text, Timestamp sent_time, boolean read_by_receiver) {
        this.id = id;
        this.chat_id = chat_id;
        this.user_id = user_id;
        this.sender_id = sender_id;
        this.message_text = message_text;
        this.sent_time = sent_time;
        this.read_by_receiver = read_by_receiver;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getChat_id() {
        return chat_id;
    }

    public void setChat_id(Long chat_id) {
        this.chat_id = chat_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Long getSender_id() {
        return sender_id;
    }

    public void setSender_id(Long sender_id) {
        this.sender_id = sender_id;
    }

    public String getMessage_text() {
        return message_text;
    }

    public void setMessage_text(String message_text) {
        this.message_text = message_text;
    }

    public Timestamp getSent_time() {
        return sent_time;
    }

    public void setSent_time(Timestamp sent_time) {
        this.sent_time = sent_time;
    }

    public boolean isRead_by_receiver() {
        return read_by_receiver;
    }

    public void setRead_by_receiver(boolean read_by_receiver) {
        this.read_by_receiver = read_by_receiver;
    }
}
