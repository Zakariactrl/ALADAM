-- Membuat database
CREATE DATABASE IF NOT EXISTS layanan;
USE layanan;

-- =========================
-- TABEL MASYARAKAT
-- =========================
CREATE TABLE masyarakat (
    nik CHAR(16) PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    telp VARCHAR(15) NOT NULL
);

-- =========================
-- TABEL PETUGAS
-- =========================
CREATE TABLE petugas (
    id_petugas INT(5) AUTO_INCREMENT PRIMARY KEY,
    nama_petugas VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    telp VARCHAR(15) NOT NULL,
    level ENUM('admin','petugas') NOT NULL
);

-- =========================
-- TABEL PENGADUAN
-- =========================
CREATE TABLE pengaduan (
    id_pengaduan INT(5) AUTO_INCREMENT PRIMARY KEY,
    nik CHAR(16) NOT NULL,
    tgl_pengaduan DATE NOT NULL,
    isi_laporan TEXT NOT NULL,
    status VARCHAR(50) NOT NULL,

    FOREIGN KEY (nik) REFERENCES masyarakat(nik)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- TABEL TANGGAPAN
-- =========================
CREATE TABLE tanggapan (
    id_tanggapan INT(5) AUTO_INCREMENT PRIMARY KEY,
    id_pengaduan INT(5) NOT NULL,
    tgl_tanggapan DATE NOT NULL,
    tanggapan TEXT NOT NULL,
    id_petugas INT(5) NOT NULL,

    FOREIGN KEY (id_pengaduan) REFERENCES pengaduan(id_pengaduan)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
