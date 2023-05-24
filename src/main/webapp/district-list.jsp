<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>List of Provinces</title>
    <style>
        select {
            padding: 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<h1>List of Provinces</h1>

<c:if test="${not empty accessToken}">
    <p>${accessToken}</p>
</c:if>
    <c:if test="${not empty provinces}">
      <p>${provinces}</p>
    </c:if>
<c:if test="${not empty provinceArray}">
    <p>${provinceArray}</p>
</c:if>
<h2>Chọn tỉnh:</h2>
<select id="province-select" name="provinceId"></select>

<h2>Chọn huyện:</h2>
<select id=di-select" name="provId"></select>
<c:if test="${not empty getDistricts}">
    <p>${getDistricts}</p>
</c:if>
<c:if test="${not empty districtArray}">
    <p>${districtArray}</p>
</c:if>



<script>
    // Dữ liệu từ JSON
    <c:if test="${not empty provinceArray}">

    var data = {
        "data":${provinceArray}
    };
    </c:if>
    // Lấy thẻ select từ DOM
    var provinceSelect = document.getElementById("province-select");

    // Lặp qua dữ liệu và tạo các option
    for (var i = 0; i < data.data.length; i++) {
        var province = data.data[i];

        var option = document.createElement("option");
        option.value = province.ProvinceID;
        option.textContent = province.ProvinceName;

        // Thêm option vào select
        provinceSelect.appendChild(option);
    }

    // Sự kiện khi người dùng chọn tỉnh
    provinceSelect.addEventListener("change", function() {
        var selectedOption = this.options[this.selectedIndex];
        var selectedProvinceId = selectedOption.value;
        var selectedProvinceName = selectedOption.textContent;

        // Gửi selectedProvinceId và selectedProvinceName đến server hoặc xử lý dữ liệu khác ở đây


    });
</script>
















</body>
</html>