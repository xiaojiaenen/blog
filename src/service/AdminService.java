package service;

import Bean.Article;
import Bean.Cate;
import Bean.Tag;
import dao.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    private Dao dao;

    public AdminService(Dao dao) {
        this.dao = dao;
    }

    public void insertArticle(Article article) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        try {
            ps = conn.prepareStatement("insert into article values(?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, article.getId());
            ps.setString(2, article.getTitle());
            ps.setString(3, article.getAuthor());
            ps.setString(4, article.getPubdate());
            ps.setString(5, article.getModdate());
            ps.setString(6, article.getCateId());
            ps.setString(7, article.getTagId());
            ps.setInt(8, article.getView());
            ps.setInt(9, article.getZan());
            ps.setInt(10, article.getComment());
            ps.setString(11, article.getContent());
            ps.setString(12, article.getImg());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public void updateArticle(String id, Article article) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        try {
            ps = conn.prepareStatement("update article set title=?,cateId=?,tagId=?,content=?,moddate=? where id=?");
            ps.setString(6, article.getId());
            ps.setString(1, article.getTitle());
            ps.setString(2, article.getCateId());
            ps.setString(3, article.getTagId());
            ps.setString(4, article.getContent());
            ps.setString(5, article.getModdate());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public List<Article> selectAll() {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        List<Article> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement("select * from article order by pubdate desc");
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                String pubdate = rs.getString(4);
                String moddate = rs.getString(5);
                String cate = rs.getString(6);
                String tag = rs.getString(7);
                int view = rs.getInt(8);
                int zan = rs.getInt(9);
                int comment = rs.getInt(10);
                String content = rs.getString(11);
                String img=rs.getString(12);
                list.add(new Article(id, title, author, pubdate, moddate, cate, tag, view, zan, comment, content,img));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    public List<Cate> selectAllCate() {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        List<Cate> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement("select * from cate");
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                list.add(new Cate(id, name));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    public void insertCate(Cate cate) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        try {
            ps = conn.prepareStatement("insert into cate values(?,?)");
            ps.setString(1, cate.getId());
            ps.setString(2, cate.getName());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public void updateCate(String id, String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        try {
            ps = conn.prepareStatement("update cate set name=? where id=?");
            ps.setString(1, name);
            ps.setString(2, id);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public void insertTag(Tag tag) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        try {
            ps = conn.prepareStatement("insert into tag values(?,?)");
            ps.setString(1, tag.getId());
            ps.setString(2, tag.getName());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public void delArticle(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        try {
            ps = conn.prepareStatement("delete from article where id=?");
            ps.setString(1, id);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public void updateTag(String id, String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        try {
            ps = conn.prepareStatement("update tag set name=? where id=?");
            ps.setString(1, name);
            ps.setString(2, id);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public List<Tag> selectAllTag() {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        List<Tag> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement("select * from tag");
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                list.add(new Tag(id, name));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    public Article selectById(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        Article article = null;

        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("select * from article where id=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String title = rs.getString(2);
                String author = rs.getString(3);
                String pubdate = rs.getString(4);
                String moddate = rs.getString(5);
                String cate = rs.getString(6);
                String tag = rs.getString(7);
                int view = rs.getInt(8);
                int zan = rs.getInt(9);
                int comment = rs.getInt(10);
                String content = rs.getString(11);
                String img = rs.getString(12);
                article = new Article(id, title, author, pubdate, moddate, cate, tag, view, zan, comment, content,img);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return article;
    }

    public String getCateId(String cate) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("select id from cate where name=?");
            ps.setString(1, cate);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }

    public String getTagId(String tag) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("select id from tag where name=?");
            ps.setString(1, tag);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }

    public String getCateName(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("select name from cate where id=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }

    public String getTagName(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("select name from tag where id=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }

    public List<Article> selectArticleByCateId(String cateId){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        List<Article> list=new ArrayList<>();

        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("select * from article where cateId=? order by pubdate desc");
            ps.setString(1, cateId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                String pubdate = rs.getString(4);
                String moddate = rs.getString(5);
                String cate = rs.getString(6);
                String tag = rs.getString(7);
                int view = rs.getInt(8);
                int zan = rs.getInt(9);
                int comment = rs.getInt(10);
                String content = rs.getString(11);
                String img = rs.getString(12);
                list.add(new Article(id, title, author, pubdate, moddate, cate, tag, view, zan, comment, content,img));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    public List<Article> selectArticleByTagId(String tagId){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        List<Article> list=new ArrayList<>();

        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("select * from article where tagId like ? order by pubdate desc");
            ps.setString(1, "%"+tagId+"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                String pubdate = rs.getString(4);
                String moddate = rs.getString(5);
                String cate = rs.getString(6);
                String tag = rs.getString(7);
                int view = rs.getInt(8);
                int zan = rs.getInt(9);
                int comment = rs.getInt(10);
                String content = rs.getString(11);
                String img = rs.getString(12);
                list.add(new Article(id, title, author, pubdate, moddate, cate, tag, view, zan, comment, content,img));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }


}
