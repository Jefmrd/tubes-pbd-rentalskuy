-- hapus indexing
DROP INDEX idx_pelanggan_status_total ON pelanggan;
DROP INDEX idx_kendaraan_merek_harga ON kendaraan;
DROP INDEX idx_penyewaan_status_tgl ON penyewaan;
USE RENTALSKUY;
SET profiling = 1;
-- Query nonkey
SELECT * FROM pelanggan
WHERE STATUS_KEANGGOTAAN = 'Gold' AND TOTAL_PENYEWAAN > 5;
SELECT * FROM kendaraan
WHERE MEREK = 'Toyota' AND HARGA_SEWA_PERHARI < 500000;
SELECT * FROM penyewaan
WHERE TANGGAL_SEWA BETWEEN '2025-01-01' AND '2025-06-30'
  AND STATUS_SEWA = 'Selesai';
-- query key
SELECT * FROM penyewaan WHERE ID_SEWA LIKE 'S00%';
SELECT * FROM PENYEWAAN 
WHERE ID_PELANGGAN = 'P0500';
SHOW PROFILES;
RESET PERSIST;
SET profiling = 0;
SET profiling = 1;
-- create indexing
CREATE INDEX idx_pelanggan_status_total ON pelanggan(STATUS_KEANGGOTAAN, TOTAL_PENYEWAAN);
CREATE INDEX idx_kendaraan_merek_harga ON kendaraan(MEREK, HARGA_SEWA_PERHARI);
CREATE INDEX idx_penyewaan_status_tgl ON penyewaan(STATUS_SEWA, TANGGAL_SEWA);
-- query ulang
-- Query nonkey
SELECT * FROM pelanggan
WHERE STATUS_KEANGGOTAAN = 'Gold' AND TOTAL_PENYEWAAN > 5;
SELECT * FROM kendaraan
WHERE MEREK = 'Toyota' AND HARGA_SEWA_PERHARI < 500000;
SELECT * FROM penyewaan
WHERE TANGGAL_SEWA BETWEEN '2025-01-01' AND '2025-06-30'
  AND STATUS_SEWA = 'Selesai';
-- query key
SELECT * FROM penyewaan WHERE ID_SEWA LIKE 'S00%';
SELECT * FROM PENYEWAAN 
WHERE ID_PELANGGAN = 'P0500';
-- menampilkan waktu
SHOW PROFILES;