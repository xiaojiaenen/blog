package Bean;

public class Comment {
    private String id;
    private String articleId;
    private String name;
    private String img;
    private String date;
    private String header;
    private String ip;
    private String content;

    public Comment() {
    }

    public Comment(String id, String articleId, String name, String img, String date, String header, String ip, String content) {
        this.id = id;
        this.articleId = articleId;
        this.name = name;
        this.img = img;
        this.date = date;
        this.header = header;
        this.ip = ip;
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
