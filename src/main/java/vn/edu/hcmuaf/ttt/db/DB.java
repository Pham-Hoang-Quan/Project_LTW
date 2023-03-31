package vn.edu.hcmuaf.ttt.db;

import vn.edu.hcmuaf.ttt.bean.AbBean;
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.model.Logging;

public class DB {
    private static DB install;
    public static DB me(){
        if (install==null) install = new DB();
        return install;
    }
    private DB(){

    }
    public boolean insert(AbBean bean){
        return bean.insert(JDBiConnector.me());

    }

    public static void main(String[] args) {
        Log log = new Log(Log.INFO,-1,"LOGIN FALSE", "User ABC", 0);
        DB.me().insert(log);

    }
}
