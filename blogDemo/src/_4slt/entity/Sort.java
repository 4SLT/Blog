package _4slt.entity;


public class Sort {
    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKeyword() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "sort{" +
                "id=" + id +
                ", keyword='" + name + '\'' +
                '}';
    }
}