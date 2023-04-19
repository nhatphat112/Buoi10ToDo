package Model;

public class Users {
    private String username;
    private int count =0;
    private int valueRandom = 0;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getValueRandom() {
        return valueRandom;
    }

    public void setValueRandom(int valueRandom) {
        this.valueRandom = valueRandom;
    }

    public Users(String username, int count, int valueRandom) {
        this.username = username;
        this.count = count;
        this.valueRandom = valueRandom;
    }
    public void inceaseCount (){
        count++;
    }

    public Users() {
    }
}
