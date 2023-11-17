package domain;

import java.util.Date;

public class Sailor {

    private Integer sailorId;
    private String name;
    private Integer rating;
    private Date birthday;

    public Sailor(Integer sailorId, String name, Integer rating, Date birthday) {
        this.sailorId = sailorId;
        this.name = name;
        this.rating = rating;
        this.birthday = birthday;
    }

    public Integer getSailorId() {
        return sailorId;
    }

    public String getName() {
        return name;
    }

    public Integer getRating() {
        return rating;
    }

    public Date getBirthday() {
        return birthday;
    }
}
