package vn.edu.hcmuaf.ttt.model;



public class Logging {

    private static Logging install;
    private static Logging me(){
        if (install==null) install = new Logging();
        return install;
    }
    private Logging(){

    }

    /**
     * level 0..., 1..., 2..., 3....
     * @param level
     */

    private void Log(int level, int user_id, String scr, String content){

    }
}
