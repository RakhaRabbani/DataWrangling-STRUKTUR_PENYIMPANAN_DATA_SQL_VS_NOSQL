CREATE DATABASE IF NOT EXISTS db_kehadiran_karyawan
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE db_kehadiran_karyawan;

CREATE TABLE karyawan (
    id_karyawan   INT AUTO_INCREMENT PRIMARY KEY,
    nik           VARCHAR(20)  NOT NULL UNIQUE,
    nama_lengkap  VARCHAR(100) NOT NULL,
    jabatan       VARCHAR(50),
    departemen    VARCHAR(50),
    tanggal_masuk DATE,
    status_aktif  ENUM('aktif', 'nonaktif') DEFAULT 'aktif',
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE absensi (
    id_absen     INT AUTO_INCREMENT PRIMARY KEY,
    id_karyawan  INT NOT NULL,
    tanggal      DATE NOT NULL,
    status       ENUM('hadir', 'sakit', 'izin', 'alpa') NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_absensi_karyawan
        FOREIGN KEY (id_karyawan)
        REFERENCES karyawan(id_karyawan)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;
