package Bean;

public class Danmu {
    private String id;
    private String date;
    private String content;

    public Danmu() {
    }

    public Danmu(String id, String date, String content) {
        this.id = id;
        this.date = date;
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
