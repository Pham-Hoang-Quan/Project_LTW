package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.model.hoaDon;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class statisticsService {



    //lay cac năm
    public static ArrayList<Integer> getYearR() {
        ArrayList<Integer> yearR = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("SELECT YEAR(ngayTaoHD) AS tg\n" +
                    "FROM hoadon\n" +
                    "GROUP BY YEAR(ngayTaoHD);");
            while (rs.next()) {
                int y = rs.getInt("tg");
                yearR.add(y);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return yearR;
    }
    public static ArrayList<Integer> getMonths(int year) {
        ArrayList<Integer> months = new ArrayList<>();
        try {
            Connection connection = DBConnect.getInstall().get().getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT DISTINCT MONTH(ngayTaoHD) AS month FROM hoadon WHERE YEAR(ngayTaoHD) = ? ORDER BY month ASC");
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int month = rs.getInt("month");
                months.add(month);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return months;
    }





    //lay tong hoa đơn ban theo nam
    public static ArrayList<Integer> getTongDonTheoNam() {
        ArrayList<Integer> yearshoadon = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("SELECT COUNT(*) AS so\n" +
                    "FROM hoadon\n" +
                    "GROUP BY YEAR(ngayTaoHD);");
            while (rs.next()) {
                int yt = rs.getInt("so");
                yearshoadon.add(yt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return yearshoadon;
    }


    public static ArrayList<Integer> getTongDonTheoThang(int year) {
        ArrayList<Integer> monthshoadon = new ArrayList<>();
        try {
            Connection connection = DBConnect.getInstall().get().getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT COUNT(*) AS total_orders FROM hoadon WHERE YEAR(ngayTaoHD) = ? GROUP BY MONTH(ngayTaoHD)");
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int total = rs.getInt("total_orders");
                monthshoadon.add(total);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return monthshoadon;
    }



    //lây ra năm
    public static ArrayList<Integer> getYear() {
        ArrayList<Integer> year = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("SELECT DISTINCT YEAR(ngayTaoHD) AS year\n" +
                    "FROM hoadon\n" +
                    "GROUP BY YEAR(ngayTaoHD), MONTH(ngayTaoHD)\n" +
                    "ORDER BY YEAR(ngayTaoHD), MONTH(ngayTaoHD);");
            while (rs.next()) {
                int month = rs.getInt("year");
                year.add(month);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return year;
    }

    //doanh thu theo năm
    public static ArrayList<Integer> getTotalRevenue() {
        ArrayList<Integer> totalRevenue = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("SELECT SUM(toongGia) AS total\n" +
                    "FROM hoadon\n" +
                    "GROUP BY YEAR(ngayTaoHD)\n" +
                    "ORDER BY YEAR(ngayTaoHD);");
            while (rs.next()) {
                int total = rs.getInt("total");
                totalRevenue.add(total);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalRevenue;
    }

    //doanh thu theo thang của từng năm
    public static ArrayList<Integer> getRevenueByMonth(int year) {
        ArrayList<Integer> revenueByMonth = new ArrayList<>();
        try {
            Connection connection = DBConnect.getInstall().get().getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT SUM(toongGia) AS mon\n" +
                    "FROM hoadon WHERE YEAR(ngayTaoHD) = ?\n" +
                    "GROUP BY YEAR(ngayTaoHD), MONTH(ngayTaoHD)\n" +
                    "ORDER BY YEAR(ngayTaoHD), MONTH(ngayTaoHD);");
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int totalByMonth = rs.getInt("mon");
                revenueByMonth.add(totalByMonth);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return revenueByMonth;
    }


    //doanh thu bán khoan mini theo năm
    public static ArrayList<Integer> getTotalRevenueCatogory() {
        ArrayList<Integer> totalRevenueCatogory = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("SELECT SUM(oi.toongGia) AS category_revenue\n" +
                    "FROM hoadon oi\n" +
                    "JOIN products p ON oi.id = p.id\n" +
                    "JOIN category c ON p.classify= c.cName\n" +
                    "WHERE cName = 'Khoan mini'\n" +
                    "GROUP BY c.cName, c.cid , YEAR(ngayTaoHD)\n" +
                    "ORDER BY YEAR(ngayTaoHD)");
            while (rs.next()) {
                int category_revenue = rs.getInt("category_revenue");
                totalRevenueCatogory.add(category_revenue);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRevenueCatogory;
    }

    //Thống kê số lượng truy cập
    public static ArrayList<Integer> getAccessByYear() {
        ArrayList<Integer> accessByYear = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("\n" +
                    "SELECT  YEAR(createAt) AS year ,COUNT(*) AS total_users\n" +
                    "FROM log\n" +
                    "WHERE src = 'List_Index'\n" +
                    "GROUP BY YEAR(createAt)\n" +
                    "ORDER BY YEAR(createAt);\n");
            while (rs.next()) {
                int category_revenue = rs.getInt("total_users");

                accessByYear.add(category_revenue);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accessByYear;
    }

    //lấy ra năm mà người dùn truy cập

    public static ArrayList<Integer> getByYear() {
        ArrayList<Integer> byYear = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("\n" +
                    "SELECT  YEAR(createAt) AS year ,COUNT(*) AS total_users\n" +
                    "FROM log\n" +
                    "WHERE src = 'List_Index'\n" +
                    "GROUP BY YEAR(createAt)\n" +
                    "ORDER BY YEAR(createAt);\n");
            while (rs.next()) {
                int category_revenue = rs.getInt("year");

                byYear.add(category_revenue);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return byYear;
    }

    //tính số truy cập theo tháng trong năm
    public static ArrayList<Integer> getAccessByMonth(int year) {
        ArrayList<Integer> accessByMonth = new ArrayList<>();
        try {
            Connection connection = DBConnect.getInstall().get().getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT  YEAR(createAt) AS year, MONTH(createAt) ,COUNT(*) AS total_users\n" +
                    "FROM log\n" +
                    "WHERE src = 'List_Index'\n" +
                    "AND YEAR(createAt) = ?\n" +
                    "GROUP BY YEAR(createAt), MONTH(createAt)\n" +
                    "ORDER BY YEAR(createAt), MONTH(createAt);\n");
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int totalByMonth = rs.getInt("total_users");
                accessByMonth.add(totalByMonth);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return accessByMonth;
    }
//láy tháng theo năm của truy cập
    public static ArrayList<Integer> accessMotnh(int year) {
        ArrayList<Integer> accessMonth = new ArrayList<>();
        try {
            Connection connection = DBConnect.getInstall().get().getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT  YEAR(createAt) AS year, MONTH(createAt) as months ,COUNT(*) AS total_users\n" +
                    "FROM log\n" +
                    "WHERE src = 'List_Index'\n" +
                    "AND YEAR(createAt) = ?\n" +
                    "GROUP BY YEAR(createAt), MONTH(createAt)\n" +
                    "ORDER BY YEAR(createAt), MONTH(createAt);\n");
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int totalByMonth = rs.getInt("months");
                accessMonth.add(totalByMonth);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return accessMonth;
    }
// đếm số tài khoản nhập sai theo nam
    public static ArrayList<Integer> geterruserByYear() {
        ArrayList<Integer> erruserByYear = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("\n" +
                    "SELECT  YEAR(createAt) AS year ,COUNT(*) AS total_users\n" +
                    "FROM log\n" +
                    "WHERE src = 'List_Index'\n" +
                    "GROUP BY YEAR(createAt)\n" +
                    "ORDER BY YEAR(createAt);\n");
            while (rs.next()) {
                int category_revenue = rs.getInt("total_users");

                erruserByYear.add(category_revenue);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return erruserByYear;
    }




    public static void main(String[] args) {
        System.out.println(statisticsService.accessMotnh(2023));
    }
}
