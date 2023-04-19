package Controller;

import Model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Random;

@WebServlet(name = "playServlet",urlPatterns = "/play")
public class PlayServlet extends HttpServlet {
    private ArrayList <Users> userArrayList = new ArrayList<Users>();

    public ArrayList<Users> getUserArrayList() {
        return userArrayList;
    }

    public void setUserArrayList(ArrayList<Users> userArrayList) {
        this.userArrayList = userArrayList;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Users users = new Users();
        String url = "/play.jsp";
        String message = "";
        String username = req.getParameter("username");
        System.out.println("check" + username);
        if (username != null) {
            if (!username.isEmpty()) {
                users.setUsername(username);

            } else url = "/login.jsp";
        }
        System.out.println("check Th1");
        String chooseUser = req.getParameter("chooseUser");
        String count = req.getParameter("count");
        String random = req.getParameter("valueRandom");
        int chooseUserValue = 0;
        int countValue = 0;
        int randomValue = 0;
        if (random == null) {
            System.out.println("check Th2");
            Random generator = new Random();
            randomValue = (int) generator.nextInt((1000 - 1) + 1) + 1;
            System.out.println("check random creator"+randomValue);
            users.setValueRandom(randomValue);
        }
        if (chooseUser != null && count != null) {
            if (!chooseUser.isEmpty() && !count.isEmpty()) {
                System.out.println("check Th3");
                boolean check = false;

                try {
                    chooseUserValue = Integer.parseInt(chooseUser);
                    countValue = Integer.parseInt(count);
                    randomValue = Integer.parseInt(random);
                    users.setValueRandom(randomValue);
                    System.out.println("check random user"+users.getValueRandom());
                    countValue++;
                    users.setCount(countValue);
                    check = true;
                } catch (Exception e) {
                    System.out.println("Error parse data");
                    check = false;
                    e.printStackTrace();
                }

                if (check) {
                    if (chooseUserValue > randomValue) message = "Lớn hơn rồi !!! Hãy thử nhập số bé hơn !";
                    else if (chooseUserValue < randomValue) message = "Bé hơn rồi !!! Hãy thử nhập số lớn hơn !";
                    else if (chooseUserValue == randomValue) {
                        userArrayList.add(users);
                        message = "Chúc mừng bạn đã đoán trúng, số lần đoán của bạn là " + countValue;
                        req.setAttribute("success","success");
                        url = "/login.jsp";


                    }


                }else url = "/play.jsp";


            }

        }
        for (int i = 0;i<userArrayList.size()-1;i++){
            for (int j =i+1;j<userArrayList.size();j++){
                Users usersI = userArrayList.get(i);
                Users usersJ = userArrayList.get(j);
                if(usersI!=null && usersJ!=null){
                    if(usersI.getUsername().equals(usersJ.getUsername())&&usersI.getCount()==usersJ.getCount()&&usersI.getValueRandom()==usersJ.getValueRandom()){
                        userArrayList.remove(usersJ);
                    }
                    if(usersI.getCount()>usersJ.getCount()){
                        Collections.swap(userArrayList,i,j);
                    }
                }


            }
        }
        req.setAttribute("message",message);
        System.out.println("check url"+url);
        req.setAttribute("users", users);
        req.setAttribute("userArrayList", userArrayList);
        req.getRequestDispatcher(url).forward(req, resp);
    }

}
