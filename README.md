# Responsi 1 Praktikum Metode Numerik

Isi repository:
- `Kasus1_Galat.m` — deret Taylor, perbandingan fungsi eksak dan pendekatan, serta perhitungan galat.
- `Kasus2_SPL.m` — sistem persamaan linear dengan metode Gauss-Seidel.
- `Kasus3_Nonlinier.m` — persamaan nonlinier dan metode biseksi.

## Cara menjalankan
1. Buka MATLAB.
2. Unduh/ekstrak repository ini dan jadikan folder tersebut sebagai **Current Folder** MATLAB.
3. Jalankan satu file setiap kali dengan menuliskan namanya di Command Window:
   - `Kasus1_Galat`
   - `Kasus2_SPL`
   - `Kasus3_Nonlinier`
4. Kasus 1 dan Kasus 3 menghasilkan grafik. File gambar PNG disimpan di Current Folder ketika program dijalankan.
5. Simpan screenshot asli dari Command Window dan grafik MATLAB untuk dimasukkan ke laporan. Jangan mengganti screenshot dengan hasil yang belum dijalankan di MATLAB.

## Hasil yang seharusnya diperiksa
- Kasus 1: hasil pendekatan Taylor dengan 23, 24, dan 25 suku menghasilkan galat sangat besar pada rentang yang ditetapkan. Interpretasi rumus yang digunakan di sini adalah `h(x) = h0 * (cos(2*pi*x/lambda) + alpha*exp(-beta*x))`; cocokkan simbol pada rumus sumber tugas sebelum finalisasi.
- Kasus 2: harga mendekati beras Rp14.000/kg, telur Rp24.000/kg, tepung Rp15.000/kg, dan ayam Rp30.000/kg.
- Kasus 3: jari-jari mendekati 4,15283059 cm dan volume tabung di luar bola mendekati 150 cm^3.

## Mengunggah ke GitHub
Buat repository baru, misalnya `responsi1-metode-numerik`. Masukkan ketiga file `.m` dan `README.md`, lalu commit dan push. Laporan PDF dapat dikumpulkan terpisah sesuai instruksi responsi.
