<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:forEach var="sp" items="${ListSP}">
   	<form action="./ChiTietSPController" method="post">
        <input type="hidden" name="csrfToken" value="${csrfToken}" />
   		<div class="product-card hover-effect" onclick="this.closest('form').submit();">
           <div class="discount">-${sp.giamGia}%</div>
           <img src="${sp.hinhAnhSP.duongDanHinh}" alt="${sp.tenSP}">
           <div class="product-info">
               <h3>${sp.tenSP} <span class="hot">Hot</span></h3>
               <p class="price">${sp.giaHienTai}đ <span class="original-price">${sp.giaBanDau}đ</span></p>
               <h4 class="buy-now">Mua Ngay</h4>
           </div>
       </div>
       <input type="hidden" name="method" value="get">
       <input type="hidden" name="maSP" value="${sp.maSP}">	           
   	</form>
  </c:forEach>