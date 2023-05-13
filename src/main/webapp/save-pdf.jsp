
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@ page import="vn.edu.hcmuaf.ttt.model.hoaDon" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itextpdf.text.pdf.BaseFont" %>

<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.itextpdf.text.Font" %>

<html>
<meta http-equiv="Content-Type" charset="UTF-8">
  <head>
    <title>BDF</title>
  </head>
  <body>
  <% hoaDon h = (hoaDon) request.getAttribute("infoCus");%>
  <%int sohd = (int) session.getAttribute("sohdd");%>
  <% List<hoaDon> listhh = (List<hoaDon>) request.getAttribute("detailsHD");
    int total = 0 ;
  %>

  <%
    String fontPath = request.getRealPath("/font/Roboto-Regular.ttf");
    BaseFont baseFont = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
    Font font = new Font(baseFont, 12, Font.NORMAL);


    // Tạo đối tượng Document
    Document document = new Document();

    // Tạo đối tượng PdfWriter để viết tài liệu vào OutputStream
    String fileName = "example.pdf"; // tên file PDF
    response.setContentType("application/pdf"); // định dạng của file PDF
    response.setHeader("Content-Disposition", "attachment;filename=" + fileName); // chọn nơi lưu file PDF
    PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());

    // Mở tài liệu để bắt đầu viết nội dung
    document.open();

    // Thêm nội dung vào tài liệu

    document.add(new Paragraph("Sô hóa đơn" + sohd,font));
    document.add(new Paragraph("Thông tin khách hàng", font));
    document.add(new Paragraph("Tên: "+  h.getHoVaTen(),font));
    document.add(new Paragraph("Email: "+  h.getHD_email(),font));
    document.add(new Paragraph("Địa chỉ: "+  h.getCity() + ", " + h.getDistrict() + ", " + h.getWard(),font));
    document.add(new Paragraph("Ngày tạo hóa đơn: "+  h.getNgayTaoHD(),font));

   for (hoaDon hh:listhh) {
     String s = hh.getToongGia();
     int i = Integer.parseInt(s);
     total += i;

     Locale locale = new Locale("vi");
     NumberFormat format = NumberFormat.getCurrencyInstance(locale);
     String gia = format.format(i).split(",")[0];

     int SL = Integer.parseInt(hh.getSoLuong());
     int giaSL = i / SL;

     Locale localer = new Locale("vi");
     NumberFormat formatr = NumberFormat.getCurrencyInstance(localer);
     String giaSLL = formatr.format(giaSL).split(",")[0];

     document.add(new Paragraph("Tên sản phẩm: " + hh.getTenSp() + " x " + hh.getSoLuong() + ", giá: " + giaSLL + "đ, " + ", Tổng: " + gia + "đ", font));
   }

     document.add(new Paragraph("Phí giao hàng: Miễn Phí",font));
     document.add(new Paragraph("Phí giảm giá: " ,font));

     Locale localee = new Locale("vi");
     NumberFormat formatt = NumberFormat.getCurrencyInstance(localee);
     String tn = formatt.format(total).split(",")[0];


    document.add(new Paragraph("Cảm ơn bạn đã đặt hàng. Chúc bạn một ngày vui vẻ. ",font));








    // Đóng tài liệu
    document.close();

    // Đóng OutputStream
    writer.close();
  %>

  </body>
</html>
