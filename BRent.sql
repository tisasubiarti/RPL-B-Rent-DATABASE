CREATE DATABASE IF NOT exists BRent;

Use BRent;

CREATE TABLE User
(
	User_ID INT PRIMARY KEY,
    Nama VARCHAR(40),
    email VARCHAR(40),
    Username VARCHAR(30),
    Password VARCHAR(20)
);

CREATE TABLE Manager
(
	Manager_ID INT PRIMARY KEY,
    User_ID INT
);

CREATE TABLE  Admin
(
	Admin_ID INT PRIMARY KEY,
    User_ID INT
);

CREATE TABLE Pelanggan
(
	Pelanggan_ID INT PRIMARY KEY,
    jenisKelamin VARCHAR(30),
    Alamat VARCHAR(30),
    No_Telepon INT,
    User_ID INT
);

CREATE TABLE Promo
(
	Promo_ID INT PRIMARY KEY,
    PromoPercentage INT,
    maksimumClaim INT,
    minimumPembayran INT,
    Admin_ID INT

);

CREATE TABLE Kendaraan
(
	Kendaraan_ID INT PRIMARY KEY,
	jenisKendaraan VARCHAR(50),
    merkKendaraan VARCHAR(50),
    ccKendaraan INT,
    harga INT,
    Admin_ID INT
);

CREATE TABLE PerlengkapanKendaraan
(
	Perlengkapan INT PRIMARY KEY,
    jumlah INT,
    jenisAtribut VARCHAR(30),
    Kendaraan_ID INT
);

describe PerlengkapanKendaraan;

CREATE TABLE Registrasi
(
	Registrasi_ID INT PRIMARY KEY,
    tanggalRegistrasi INT,
    Pelanggan_ID INT
);

CREATE TABLE Pembayaran
(
	Pembayaran_ID INT PRIMARY KEY,
    jenisPembayaran VARCHAR(30),
    tanggalPembayaran INT,
    totalPembayaran INT,
    statusPembayaran VARCHAR(30),
    Registrasi_ID INT
);

CREATE TABLE Pengembalian
(
  Pengembalian_ID INT PRIMARY KEY,
  tanggalPengembalian INT,
  Pembayaran_ID INT,
  Kendaraan_ID INT
);

ALTER TABLE Manager
ADD CONSTRAINT FK_Manager_User_ID
FOREIGN KEY(User_ID)
REFERENCES User(User_ID);

ALTER TABLE Admin
ADD CONSTRAINT FK_Admin_User_ID
FOREIGN KEY(User_ID)
REFERENCES User(User_ID);

ALTER TABLE Pelanggan
ADD CONSTRAINT FK_Pelanggan_User_ID
FOREIGN KEY(User_ID)
REFERENCES User(User_ID);

ALTER TABLE Promo
ADD CONSTRAINT FK_Promo_Admin_ID
FOREIGN KEY(Admin_ID)
REFERENCES Admin(Admin_ID);

ALTER TABLE Kendaraan
ADD CONSTRAINT FK_Kendaraan_Admin_ID
FOREIGN KEY(Admin_ID)
REFERENCES Admin(Admin_ID);

ALTER TABLE PerlengkapanKendaraan
ADD CONSTRAINT FK_PerlengkapanKendaraan_Kendaraan_ID
FOREIGN KEY(Kendaraan_ID)
REFERENCES Kendaraan(Kendaraan_ID);

ALTER TABLE Registrasi
ADD CONSTRAINT FK_Registrasi_Pelanggan_ID
FOREIGN KEY(Pelanggan_ID)
REFERENCES Pelanggan(Pelanggan_ID);

ALTER TABLE Pembayaran
ADD CONSTRAINT FK_Pembayaran_Registrasi_ID
FOREIGN KEY(Registrasi_ID)
REFERENCES Registrasi(Registrasi_ID);


ALTER TABLE Pengembalian
ADD CONSTRAINT FK_Pengembalian_Pembayaran_ID
FOREIGN KEY(Pembayaran_ID)
REFERENCES Pembayaran(Pembayaran_ID);

describe User;
describe Manager;
describe Admin;
describe Pelanggan;
describe Promo;
describe Kendaraan;
describe PerlengkapanKendaraan;
describe Registrasi;
describe Pembayaran;
describe Pengembalian;

/*Membuat DML*/

INSERT INTO User
( User_ID, Nama, email, Username, Password)
VALUES
( 12345, "Tisa", "tisahaura", "tisaaaa", "tisa2021");
select* from User;

INSERT INTO Manager
( Manager_ID, User_ID)
VALUES
( 6789, 12345);
select* from Manager;

INSERT INTO Admin
( Admin_ID, User_ID )
VALUES
( 5678, 12345 );
select* from Admin;

INSERT INTO Pelanggan
( Pelanggan_ID, jenisKelamin, Alamat, No_Telepon, User_ID)
VALUES
( 15789, "Perempuan", "Bojongsoang", 0876543, 12345 );
select* from Pelanggan;

INSERT INTO Promo
( Promo_ID, PromoPercentage, maksimumClaim, minimumPembayran, Admin_ID )
VALUES
( 1345, 80, 2, 100000, 5678);
select* from Promo;

INSERT INTO Kendaraan
( Kendaraan_ID, jenisKendaraan, merkKendaraan, ccKendaraan, harga, Admin_ID)
VALUES
( 0987, "motor", "Supra", 250, 50000, 5678 );
select* from Kendaraan;

INSERT INTO PerlengkapanKendaraan
( Perlengkapan, jumlah, jenisAtribut, Kendaraan_ID )
VALUES
( 123456, 1, "Mantel", 0987);
select* from PerlengkapanKendaraan;

INSERT INTO Registrasi
( Registrasi_ID, tanggalRegistrasi, Pelanggan_ID )
VALUES
( 5356, 08102023, 15789);
select* from Registrasi;

INSERT INTO Pembayaran
( Pembayaran_ID, jenisPembayaran, tanggalPembayaran, totalPembayaran, statusPembayaran, Registrasi_ID )
VALUES
( 23245, "cash", 08102023, 50000, "berhasil", 5356 );
select* from Pembayaran;

INSERT INTO Pengembalian
( Pengembalian_ID, tanggalPengembalian, Pembayaran_ID, Kendaraan_ID )
VALUES
( 2324, 09102023, 23245, 0987 );
select* from Pengembalian;

SHOW TABLES;
