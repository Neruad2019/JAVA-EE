package DB;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/social_network?useUnicode=true&serverTimezone=UTC", "root", "");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public static boolean setUser(Users user){
        int row=0;
        try {
            PreparedStatement statement=connection.prepareStatement("INSERT INTO user(id,email,password,full_name,birth_date,picture_url) VALUES (NULL,?,?,?,?,?)");
            statement.setString(1, user.getEmail());
            statement.setString(2,user.getPassword());
            statement.setString(3,user.getFull_name());
            statement.setString(4,user.getBirthdate());
            statement.setString(5,user.getUrl_pic());
            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static Users getUser(String email){
        Users userr=null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT id,email,password,full_name,birth_date,picture_url FROM user WHERE email=?");
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                userr = new Users(resultSet.getLong("id"),resultSet.getString("email"),resultSet.getString("password"),resultSet.getString("full_name"),resultSet.getString("birth_date")
                        ,resultSet.getString("picture_url"));
            }
            statement.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return userr;
    }
    public static String getUserPassword(int id){
        String password=null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT password FROM user WHERE id=?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                password=resultSet.getString("password");
            }
            statement.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return password;
    }
    public static Users getUserByID(int id){
        Users userr=null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT id,email,password,full_name,birth_date,picture_url FROM user WHERE id=?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                userr = new Users(resultSet.getLong("id"),resultSet.getString("email"),resultSet.getString("password"),resultSet.getString("full_name"),resultSet.getString("birth_date")
                        ,resultSet.getString("picture_url"));
            }
            statement.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return userr;
    }
    public static boolean settings1(Users user){
        int row=0;
        try {
            PreparedStatement statement=connection.prepareStatement("UPDATE user SET email=?,full_name=?,birth_date=? WHERE id=?");
            statement.setString(1, user.getEmail());
            statement.setString(2,user.getFull_name());
            statement.setString(3,user.getBirthdate());
            statement.setInt(4,(int)(long)user.getId());
            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static boolean settings2(String url,int id){
        int row=0;
        try {
            PreparedStatement statement=connection.prepareStatement("UPDATE user SET picture_url=? WHERE id=?");
            statement.setString(1, url);
            statement.setInt(2,id);
            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static boolean settings3(String password,int id){
        int row=0;
        try {
            PreparedStatement statement=connection.prepareStatement("UPDATE user SET password=? WHERE id=?");
            statement.setString(1, password);
            statement.setInt(2,id);
            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static boolean addPost(Post post){
        int row=0;
        try {
            PreparedStatement statement=connection.prepareStatement("INSERT INTO posts(id,author_id,title,short_content,content,post_date) VALUES (NULL,?,?,?,?,?)");
            statement.setInt(1, (int)(long)post.getAuthor_id());
            statement.setString(2,post.getTitle());
            statement.setString(3,post.getShort_content());
            statement.setString(4,post.getContent());
            statement.setTimestamp(5,post.getPost_date());
            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static boolean setPost(Post post){
        int row=0;
        try {
            PreparedStatement statement=connection.prepareStatement("UPDATE posts SET title=?,short_content=?,content=? WHERE id=?");
            statement.setString(1, post.getTitle());
            statement.setString(2,post.getShort_content());
            statement.setString(3,post.getContent());
            statement.setInt(4,(int)(long)post.getId());
            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static boolean deletePost(int id) {
        int row = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM posts WHERE id=?");
            statement.setInt(1, id);
            row = statement.executeUpdate();
            statement.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return row > 0;
    }
    public static ArrayList<Post> getPosts(int author_id){
        ArrayList<Post> posts=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT id,author_id,title,short_content,content,post_date FROM posts WHERE author_id=?");
            statement.setInt(1, author_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                posts.add(new Post(resultSet.getLong("id"),resultSet.getLong("author_id"),resultSet.getString("title"),resultSet.getString("short_content"),resultSet.getString("content"),resultSet.getTimestamp("post_date"),null));
            }
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return posts;
    }
    public static ArrayList<Users> searchUsers(String substring,int user_id){
        ArrayList<Users> users=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT id,full_name,birth_date,picture_url FROM user WHERE (user.full_name LIKE CONCAT('%',?,'%') AND user.id!=?)");
            statement.setString(1, substring);
            statement.setInt(2, user_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Users user=new Users();
                user.setId(resultSet.getLong("id"));
                user.setBirthdate(resultSet.getString("birth_date"));
                user.setFull_name(resultSet.getString("full_name"));
                user.setUrl_pic(resultSet.getString("picture_url"));
                users.add(user);
            }
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return users;
    }
    public static boolean addRequest(int user_id,int requester_id,Timestamp date){
        int row=0;
        try {
            //PreparedStatement statement=connection.prepareStatement("SET @user_id_new=?,@requester_sender_id_new=?; INSERT INTO friends_requests(user_id,requester_sender_id) SELECT @user_id_new,@requester_sender_id_new WHERE NOT EXISTS (SELECT 1 FROM friends_requests WHERE (user_id=@user_id_new AND requester_sender_id=@requester_sender_id_new))");
            PreparedStatement statement=connection.prepareStatement("INSERT INTO friends_requests(user_id,requester_sender_id) VALUES (?,?)");
            statement.setInt(1, user_id);
            statement.setInt(2, requester_id);

            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static ArrayList<Users> requestedUsers(int user_id){
        ArrayList<Users> users=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT user.id,full_name,birth_date,picture_url FROM user,friends_requests WHERE (user.id=friends_requests.requester_sender_id AND friends_requests.user_id=?)");
            statement.setInt(1, user_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Users user=new Users();
                user.setId(resultSet.getLong("user.id"));
                user.setBirthdate(resultSet.getString("birth_date"));
                user.setFull_name(resultSet.getString("full_name"));
                user.setUrl_pic(resultSet.getString("picture_url"));
                users.add(user);
            }
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return users;
    }
    public static boolean deleteRequest (int user_id,int requester_id) {
        int row = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM friends_requests WHERE user_id=? AND requester_sender_id=?");
            statement.setInt(1, user_id);
            statement.setInt(2, requester_id);
            row = statement.executeUpdate();
            statement.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return row > 0;
    }
    public static boolean addFriend(int user_id, int friend_id, Timestamp date){
        int row=0;
        try {
            PreparedStatement statement=connection.prepareStatement("INSERT INTO friends(id,user_id,friend_id,added_time) VALUES (NULL,?,?,?)");
            statement.setInt(1, user_id);
            statement.setInt(2, friend_id);
            statement.setTimestamp(3,date);

            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static ArrayList<Users> getFriends(int user_id){
        ArrayList<Users> friends=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT user.id,full_name,birth_date,picture_url FROM user,friends WHERE user.id=friends.friend_id AND friends.user_id=?");
            statement.setInt(1, user_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Users user=new Users();
                user.setId(resultSet.getLong("user.id"));
                user.setBirthdate(resultSet.getString("birth_date"));
                user.setFull_name(resultSet.getString("full_name"));
                user.setUrl_pic(resultSet.getString("picture_url"));
                friends.add(user);
            }
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return friends;
    }
    public static boolean deleteFriend (int user_id,int requester_id) {
        int row = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM friends WHERE (user_id=? AND friend_id=?)");
            statement.setInt(1, user_id);
            statement.setInt(2, requester_id);
            row = statement.executeUpdate();
            statement.close();
            //-----------
            statement = connection.prepareStatement("DELETE FROM friends WHERE (friend_id=? AND user_id=?)");
            statement.setInt(1, user_id);
            statement.setInt(2, requester_id);
            row = statement.executeUpdate();
            statement.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return row > 0;
    }
    public static ArrayList<Post> getFriendsPosts(int user_id){
        ArrayList<Post> posts=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT posts.id,author_id,title,short_content,content,post_date,user.full_name FROM posts,user,friends WHERE (friends.user_id=? AND friends.friend_id=posts.author_id AND posts.author_id=user.id) ORDER BY posts.post_date ASC");
            statement.setInt(1, user_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                posts.add(new Post(resultSet.getLong("id"),resultSet.getLong("author_id"),resultSet.getString("title"),resultSet.getString("short_content"),resultSet.getString("content"),resultSet.getTimestamp("post_date"),resultSet.getString("user.full_name")));
            }
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return posts;
    }
    public static boolean addChat(int user_id, int opponent_user_id){
        int row=0;
        try {
            PreparedStatement statement=connection.prepareStatement("INSERT INTO chats(user_id,opponent_user_id,latest_message_text) VALUES (?,?,'')");
            statement.setInt(1, user_id);
            statement.setInt(2, opponent_user_id);

            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static boolean isChatExists(int find_user_id, int find_opponent_id){
        String a=null;
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT id FROM chats WHERE (user_id=? AND opponent_user_id=?) OR (opponent_user_id=? AND user_id=?)");
            statement.setInt(1, find_user_id);
            statement.setInt(2, find_opponent_id);
            statement.setInt(3, find_user_id);
            statement.setInt(4, find_opponent_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                a=resultSet.getString("id");
            }
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return a!=null;
    }
    public static boolean addMessage(int chat_id,int user_id, int opponent_user_id,String text){
        int row=0;
        try {
            PreparedStatement statement=connection.prepareStatement("INSERT INTO messages(chat_id,user_id,sender_id,message_text,read_by_receiver) VALUES (?,?,?,?,0)");
            statement.setInt(1, chat_id);
            statement.setInt(2, opponent_user_id);
            statement.setInt(3, user_id);
            statement.setString(4, text);

            row=statement.executeUpdate();
            statement.close();


            statement=connection.prepareStatement("UPDATE chats SET latest_message_text=?,latest_message_time=? WHERE id=?");
            statement.setString(1, text);
            statement.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            statement.setInt(3, chat_id);

            row=statement.executeUpdate();
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return row>0;
    }
    public static int getChatid(int find_user_id, int find_opponent_id){
        int id=-1;
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT id FROM chats WHERE (user_id=? AND opponent_user_id=?) OR (opponent_user_id=? AND user_id=?)");
            statement.setInt(1, find_user_id);
            statement.setInt(2, find_opponent_id);
            statement.setInt(3, find_user_id);
            statement.setInt(4, find_opponent_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                id=resultSet.getInt("id");
            }
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return id;
    }
    public static ArrayList<Message> getMessages(int chat_id){
        ArrayList<Message> messages=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT id,chat_id,user_id,sender_id,message_text,read_by_receiver,sent_date FROM messages WHERE chat_id=? ORDER BY messages.sent_date ASC");
            statement.setInt(1, chat_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                messages.add(new Message(resultSet.getLong("id"),resultSet.getLong("chat_id"),resultSet.getLong("user_id"),resultSet.getLong("sender_id"),resultSet.getString("message_text"),resultSet.getTimestamp("sent_date"),resultSet.getBoolean("read_by_receiver")));
            }
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return messages;
    }
    public static ArrayList<Chat> getChats(int user_id){
        ArrayList<Chat> chats=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT id,user_id,opponent_user_id,latest_message_text,latest_message_time FROM chats WHERE user_id=? OR opponent_user_id=?");
            statement.setInt(1, user_id);
            statement.setInt(2, user_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Chat chat=new Chat();
                chat.setId(resultSet.getLong("id"));
                chat.setUser_id(resultSet.getLong("user_id"));
                chat.setOpponent_user_id(resultSet.getLong("opponent_user_id"));
                chat.setLatest_message_text(resultSet.getString("latest_message_text"));
                chat.setLatest_message_time(resultSet.getTimestamp("latest_message_time"));
                chats.add(chat);
            }
            statement.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return chats;
    }

}
