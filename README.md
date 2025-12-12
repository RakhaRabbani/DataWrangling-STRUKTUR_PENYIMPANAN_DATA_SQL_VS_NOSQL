<div align="center">
  <h1>Sistem Kehadiran Karyawan (SQL)</h1>
</div>
<div align="center">
  <h3><i>Transform Data, Unlock Insights, Drive Innovation</i></h3>
  <img src="https://img.shields.io/github/last-commit/RakhaRabbani/DataWrangling-AGREGASI_DAN_TRANSFORMASI_STRUKTURAL?style=flat-square&color=blue" alt="Last Commit">
  <img src="https://img.shields.io/github/languages/top/RakhaRabbani/DataWrangling-AGREGASI_DAN_TRANSFORMASI_STRUKTURAL?style=flat-square&color=blue" alt="Top Language">
  <img src="https://img.shields.io/github/languages/count/RakhaRabbani/DataWrangling-AGREGASI_DAN_TRANSFORMASI_STRUKTURAL?style=flat-square&color=blue" alt="Language Count">
  <br><br>
</div>

Repository ini berisi skrip SQL untuk membangun database sederhana sistem kehadiran karyawan.

## Struktur Database


### 1. Tabel `karyawan`
```sql
Menyimpan data master karyawan:
- id_karyawan (INT, PK)
- nik (VARCHAR, UNIQUE)
- nama_lengkap
- jabatan
- departemen
- tanggal_masuk (DATE)
- status_aktif (ENUM)
- created_at (TIMESTAMP)
  ```

### 2. Tabel `absensi`
```sql
Menyimpan catatan kehadiran:
- id_absen (INT, PK)
- id_karyawan (FK → karyawan.id_karyawan)
- tanggal (DATE)
- status (ENUM: hadir, sakit, izin, alpa)
- created_at (TIMESTAMP)
```

### Penjelasan singkat
```
- Relasi: karyawan (1) --- (N) absensi
- id_karyawan di absensi menjadi FOREIGN KEY
   yang mengacu ke PRIMARY KEY di tabel karyawan.
    Tipe data:
        * id_karyawan, id_absen : INT (AUTO_INCREMENT)
        * nik                   : VARCHAR(20)
         * nama_lengkap          : VARCHAR(100)
         * jabatan, departemen   : VARCHAR(50)
         * tanggal_masuk, tanggal: DATE
         * status_aktif          : ENUM('aktif','nonaktif')
         * status                : ENUM('hadir','sakit','izin','alpa')
```
### Relasi
Satu karyawan memiliki banyak catatan absensi (one-to-many).

## Cara Menjalankan
```
mysql -u root -p < kehadiran_karyawan.sql
```

## Isi File
- `kehadiran_karyawan.sql` : skrip lengkap pembuatan database & tabel.
- `README.md` : dokumentasi & penjelasan.
