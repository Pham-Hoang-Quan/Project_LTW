package vn.edu.hcmuaf.ttt.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.Product;

import javax.imageio.stream.ImageInputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class JDBiConnector {
    static Jdbi jdbi;

    public static Jdbi me(){
        if(jdbi==null) makeConnect();
        return jdbi;

    }

    private static void makeConnect() {

        MysqlDataSource source= new MysqlDataSource();
        source.setURL("jdbc:mysql://"+DBPropties.host()+":"+DBPropties.port()+"/"+DBPropties.name());
        source.setUser(DBPropties.user());
        source.setPassword(DBPropties.pass());
        try {
            source.setAutoReconnect(true);
            source.setUseCompression(true);
            jdbi= Jdbi.create(source);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }

    public static void main(String[] args) {
        Jdbi me = JDBiConnector.me();
        List<Product> products  = me.withHandle(handle -> {
            return handle.createQuery("select * from products ").mapToBean(Product.class).stream().collect(Collectors.toList());


        });
        System.out.println(products);

    }

}
