CREATE FUNCTION fn_ThongKeSanPham()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        SUM(DaBan) AS TongSanPhamDaBan,
        SUM(SoLuong - DaBan) AS TongSanPhamTonKho
    FROM SanPham
);
GO

CREATE FUNCTION fn_LietKeSanPhamBanChay
(
    @year INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 5
        SP.MaSanPham,
        SP.TenSanPham,
        SUM(CT.SoLuong) AS TongSoLuongBan
    FROM
        HoaDon HD
    JOIN
        ChiTietHoaDon CT ON HD.MaHoaDon = CT.MaHoaDon
    JOIN
        SanPham SP ON CT.MaSanPham = SP.MaSanPham
    WHERE
        YEAR(HD.NgayTao) = @year
    GROUP BY
        SP.MaSanPham, SP.TenSanPham
    ORDER BY
        TongSoLuongBan DESC
)
GO

CREATE FUNCTION fn_ThongKeTongSoLuongSanPhamTheoThang
(
    @year INT
)
RETURNS TABLE
AS
RETURN
(
    WITH Months AS (
        SELECT 1 AS Thang
        UNION ALL SELECT 2
        UNION ALL SELECT 3
        UNION ALL SELECT 4
        UNION ALL SELECT 5
        UNION ALL SELECT 6
        UNION ALL SELECT 7
        UNION ALL SELECT 8
        UNION ALL SELECT 9
        UNION ALL SELECT 10
        UNION ALL SELECT 11
        UNION ALL SELECT 12
    )
    SELECT
        M.Thang,
        COALESCE(SUM(CT.SoLuong), 0) AS TongSoLuongBan
    FROM
        Months M
    LEFT JOIN
        HoaDon H ON YEAR(H.NgayTao) = @year AND MONTH(H.NgayTao) = M.Thang
    LEFT JOIN
        ChiTietHoaDon CT ON H.MaHoaDon = CT.MaHoaDon
    GROUP BY
        M.Thang
)
GO
