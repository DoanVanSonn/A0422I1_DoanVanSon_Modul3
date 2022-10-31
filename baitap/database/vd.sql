CREATE DATABASE IF NOT EXISTS `quanlysinhvien` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `quanlysinhvien`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chuongtrinhdaotao
-- ----------------------------
DROP TABLE IF EXISTS `chuongtrinhdaotao`;
CREATE TABLE `chuongtrinhdaotao`  (
  `maChuongTrinhDaoTao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenChuongTrinhDaoTao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `soTinChi` float NULL DEFAULT NULL,
  `namBatDauDaoTao` int NULL DEFAULT NULL,
  PRIMARY KEY (`maChuongTrinhDaoTao`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chuongtrinhdaotao
-- ----------------------------
INSERT INTO `chuongtrinhdaotao` VALUES ('CNTT', 'Công nghệ Thông tin', 120, 2022);
INSERT INTO `chuongtrinhdaotao` VALUES ('KHMT', 'Khoa học Máy tính', 150, 2020);
INSERT INTO `chuongtrinhdaotao` VALUES ('KT', 'Kế toán', 130, 2022);
INSERT INTO `chuongtrinhdaotao` VALUES ('QTKD', 'Quản trị kinh doanh', 120, 2021);
INSERT INTO `chuongtrinhdaotao` VALUES ('TC', 'Tài chính', 130, 2020);

-- ----------------------------
-- Table structure for lophocphan
-- ----------------------------
DROP TABLE IF EXISTS `lophocphan`;
CREATE TABLE `lophocphan`  (
  `maLopHocPhan` int NOT NULL AUTO_INCREMENT,
  `maMonHoc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namHoc` int NOT NULL,
  `hocKy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `maGiangVien` int NOT NULL DEFAULT 0,
  `ngonNguGiangDay` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `moTa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gioiHanSoLuongSinhVien` int NOT NULL,
  PRIMARY KEY (`maLopHocPhan`) USING BTREE,
  INDEX `FK_lophocphan_monhoc`(`maMonHoc`) USING BTREE,
  INDEX `FK_lophocphan_nhanvien`(`maGiangVien`) USING BTREE,
  CONSTRAINT `FK_lophocphan_monhoc` FOREIGN KEY (`maMonHoc`) REFERENCES `monhoc` (`maMonHoc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lophocphan_nhanvien` FOREIGN KEY (`maGiangVien`) REFERENCES `nhanvien` (`maNhanVien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lophocphan
-- ----------------------------
INSERT INTO `lophocphan` VALUES (4, 'TRR', 2022, 'Học kỳ 1', 4, 'Tiếng Việt', '', 50);
INSERT INTO `lophocphan` VALUES (5, 'CSKH', 2022, 'Học kỳ 1', 1, 'Tiếng Anh', '', 100);

-- ----------------------------
-- Table structure for monhoc
-- ----------------------------
DROP TABLE IF EXISTS `monhoc`;
CREATE TABLE `monhoc`  (
  `maMonHoc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenMonHoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `soTinChi` float NULL DEFAULT 0,
  `namBatDauApDung` int NULL DEFAULT 0,
  `theLoai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `moTaTomTat` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `maTaDayDu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `taiLieu` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `mucTieuDauRa` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `hinhThucDanhGia` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `maChuongTrinhDaoTao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`maMonHoc`) USING BTREE,
  INDEX `FK_monhoc_chuongtrinhdaotao`(`maChuongTrinhDaoTao`) USING BTREE,
  CONSTRAINT `FK_monhoc_chuongtrinhdaotao` FOREIGN KEY (`maChuongTrinhDaoTao`) REFERENCES `chuongtrinhdaotao` (`maChuongTrinhDaoTao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monhoc
-- ----------------------------
INSERT INTO `monhoc` VALUES ('CSKH', 'Chăm sóc khách hàng', 5, 2021, 'Tự chọn', '0', NULL, '', '', 'Thi Trắc nghiệm', 'QTKD');
INSERT INTO `monhoc` VALUES ('TRR', 'Toán Rời Rạc', 3, 2020, 'Bắt buộc', 'Môn học này cung cấp kiến thức về Toán Rời Rạc', NULL, 'Giáo trình Toán Rời rạc', 'Sinh viên năm được kiến thức TRR', 'Thi viết', 'CNTT');

-- ----------------------------
-- Table structure for nguoidung
-- ----------------------------
DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE `nguoidung`  (
  `tenNguoiDung` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `matKhau` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `theLoai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `maNhanVien` int NULL DEFAULT NULL,
  `maSinhVien` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tenNguoiDung`) USING BTREE,
  INDEX `FK_nguoidung_nhanvien`(`maNhanVien`) USING BTREE,
  INDEX `FK_nguoidung_sinhvien`(`maSinhVien`) USING BTREE,
  CONSTRAINT `FK_nguoidung_nhanvien` FOREIGN KEY (`maNhanVien`) REFERENCES `nhanvien` (`maNhanVien`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_nguoidung_sinhvien` FOREIGN KEY (`maSinhVien`) REFERENCES `sinhvien` (`maSinhVien`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nguoidung
-- ----------------------------
INSERT INTO `nguoidung` VALUES ('abc', '456', 'Sinh viên', NULL, '01');
INSERT INTO `nguoidung` VALUES ('lam1', '123', 'Giảng viên', 4, NULL);

-- ----------------------------
-- Table structure for nhanvien
-- ----------------------------
DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE `nhanvien`  (
  `maNhanVien` int NOT NULL AUTO_INCREMENT,
  `hoDem` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ten` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `theLoai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ngaySinh` date NULL DEFAULT NULL,
  `gioiTinh` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`maNhanVien`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nhanvien
-- ----------------------------
INSERT INTO `nhanvien` VALUES (1, 'Nguyễn Văn', 'Thành', 'Giảng viên', '1990-01-15', 1);
INSERT INTO `nhanvien` VALUES (2, 'Nguyễn Thị', 'Vân', 'Giảng viên', '1995-07-10', 0);
INSERT INTO `nhanvien` VALUES (3, 'Trân Thanh', 'Thiện', 'Giảng viên', '1970-08-17', 1);
INSERT INTO `nhanvien` VALUES (4, 'Lâm Minh', 'Anh', 'Chuyên viên', '1988-03-05', 0);
INSERT INTO `nhanvien` VALUES (5, 'Thái Vân', 'Tiên', 'Chuyên viên', '1955-01-19', 1);

-- ----------------------------
-- Table structure for sinhvien
-- ----------------------------
DROP TABLE IF EXISTS `sinhvien`;
CREATE TABLE `sinhvien`  (
  `maSinhVien` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hoDem` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ten` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ngaySinh` date NULL DEFAULT NULL,
  `namNhapHoc` int NULL DEFAULT 0,
  `maChuongTrinhDaoTao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `gioiTinh` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`maSinhVien`) USING BTREE,
  INDEX `FK_sinhvien_chuongtrinhdaotao`(`maChuongTrinhDaoTao`) USING BTREE,
  CONSTRAINT `FK_sinhvien_chuongtrinhdaotao` FOREIGN KEY (`maChuongTrinhDaoTao`) REFERENCES `chuongtrinhdaotao` (`maChuongTrinhDaoTao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sinhvien
-- ----------------------------
INSERT INTO `sinhvien` VALUES ('01', 'Lê Nhật', 'Thảo', '2000-01-05', 2022, 'CNTT', 1);
INSERT INTO `sinhvien` VALUES ('02', 'Trần Văn', 'An', '2000-07-05', 2022, 'KHMT', 1);
INSERT INTO `sinhvien` VALUES ('03', 'Lê Thị', 'Thủy', '1999-01-05', 2020, 'QTKD', 0);
INSERT INTO `sinhvien` VALUES ('04', 'Hoàng Mỹ', 'Nương', '1999-01-06', 2020, 'QTKD', 0);
INSERT INTO `sinhvien` VALUES ('05', 'Nguyên Hoàng', 'Yến', '1999-12-16', 2022, 'CNTT', 0);

-- ----------------------------
-- Table structure for thamgiahoc
-- ----------------------------
DROP TABLE IF EXISTS `thamgiahoc`;
CREATE TABLE `thamgiahoc`  (
  `maLopHocPhan` int NOT NULL,
  `maSinhVien` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `diemSo` float NULL DEFAULT NULL,
  `diemChu` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`maLopHocPhan`, `maSinhVien`) USING BTREE,
  INDEX `FK_thamgiahoc_sinhvien`(`maSinhVien`) USING BTREE,
  CONSTRAINT `FK_thamgiahoc_lophocphan` FOREIGN KEY (`maLopHocPhan`) REFERENCES `lophocphan` (`maLopHocPhan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_thamgiahoc_sinhvien` FOREIGN KEY (`maSinhVien`) REFERENCES `sinhvien` (`maSinhVien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of thamgiahoc
-- ----------------------------
INSERT INTO `thamgiahoc` VALUES (4, '01', NULL, NULL);
INSERT INTO `thamgiahoc` VALUES (4, '02', NULL, NULL);
INSERT INTO `thamgiahoc` VALUES (5, '03', NULL, NULL);
INSERT INTO `thamgiahoc` VALUES (5, '04', NULL, NULL);
INSERT INTO `thamgiahoc` VALUES (5, '05', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
