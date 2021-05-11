package Bean;

public class Article {
    private String id;
    private String title;
    private String author;
    private String pubdate;
    private String moddate;
    private String cateId;
    private String tagId;
    private int view;
    private int zan;
    private int comment;
    private String content;
    private String img;

    public Article() {
    }

    public Article(String id, String title, String author, String moddate, String cateId, String tagId, int view, int zan, int comment, String content) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.moddate = moddate;
        this.cateId = cateId;
        this.tagId = tagId;
        this.view = view;
        this.zan = zan;
        this.comment = comment;
        this.content = content;
    }

    public Article(String id, String title, String author, String pubdate, String moddate, String cateId, String tagId, int view, int zan, int comment, String content) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.pubdate = pubdate;
        this.moddate = moddate;
        this.cateId = cateId;
        this.tagId = tagId;
        this.view = view;
        this.zan = zan;
        this.comment = comment;
        this.content = content;
    }

    public Article(String id, String title, String author, String pubdate, String moddate, String cateId, String tagId, int view, int zan, int comment, String content, String img) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.pubdate = pubdate;
        this.moddate = moddate;
        this.cateId = cateId;
        this.tagId = tagId;
        this.view = view;
        this.zan = zan;
        this.comment = comment;
        this.content = content;
        this.img = img;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPubdate() {
        return pubdate;
    }

    public void setPubdate(String pubdate) {
        this.pubdate = pubdate;
    }

    public String getModdate() {
        return moddate;
    }

    public void setModdate(String moddate) {
        this.moddate = moddate;
    }

    public String getCateId() {
        return cateId;
    }

    public void setCateId(String cateId) {
        this.cateId = cateId;
    }

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getZan() {
        return zan;
    }

    public void setZan(int zan) {
        this.zan = zan;
    }

    public int getComment() {
        return comment;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
