# UAS-BDL_dheva
repository ini untuk mengumpulkan tugas akhir mata kuliah basis data lanjutan

# Entity Relationship Diagram
![Screenshot 2024-06-27 035355](https://github.com/dodotni/UAS-BDL_dheva/assets/173961347/bf423425-11bd-418f-bded-a3c4c3ce37ba)


## Penjelasan Trigger
Trigger dalam kode SQL ini diatur untuk memperbarui informasi tertentu di tabel karyawan setiap kali terjadi perubahan pada data karyawan yang ditentukan. Fungsi utama dari trigger ini adalah memastikan konsistensi dan integritas data di dalam database dengan melakukan operasi otomatis saat data dimodifikasi.

## Penjelasan View
View departemen_gaji digunakan untuk menghitung total gaji yang diterima oleh karyawan di setiap departemen. Kegunaan view ini adalah untuk menyederhanakan query yang kompleks dan mempermudah pengambilan data agregat dari beberapa tabel secara bersamaan.

## PENJELASAN AGGREGAT
Query ini digunakan untuk mendapatkan statistik gaji dari setiap departemen. Dengan menggabungkan tabel karyawan, departemen, dan gaji, query ini menghitung jumlah karyawan, total gaji, rata-rata gaji, gaji maksimum, dan gaji minimum untuk setiap departemen. Hasilnya dikelompokkan berdasarkan nama departemen, menampilkan berbagai metrik gaji untuk setiap departemen.

## PENJELASAN INNER JOIN
INNER JOIN digunakan untuk menggabungkan baris dari dua atau lebih tabel berdasarkan kondisi tertentu. Pada contoh di atas, INNER JOIN menghubungkan tabel karyawan dengan departemen melalui kolom id_departemen, dan menghubungkan tabel karyawan dengan tabel gaji melalui kolom id_karyawan, sehingga menghasilkan data gabungan yang menampilkan ID karyawan, nama karyawan, nama departemen, jabatan, dan gaji.

## PENJELASAN LEFT JOIN
LEFT JOIN digunakan untuk menggabungkan baris dari dua tabel, mengembalikan semua baris dari tabel kiri (karyawan), dan baris yang cocok dari tabel kanan (departemen). Jika tidak ada kecocokan, hasilnya tetap menampilkan baris dari tabel kiri dengan nilai NULL untuk kolom dari tabel kanan, seperti yang ditunjukkan pada contoh di mana nama karyawan dan nama departemen ditampilkan.

## PENJELASAN SUBQUERY
Query ini digunakan untuk memilih data karyawan yang bekerja di departemen tertentu. Dengan menggunakan subquery, query ini mencari ID departemen berdasarkan nama departemen yang ditentukan (misalnya 'IT') dan kemudian menampilkan ID, nama, dan jabatan karyawan yang bekerja di departemen tersebut.

## PENJELASAN HAVING
Query ini digunakan untuk menghitung total gaji per departemen dan hanya menampilkan departemen yang memiliki total gaji lebih dari 20 juta. Query ini menggabungkan tabel departemen, karyawan, dan gaji menggunakan JOIN, kemudian mengelompokkan hasil berdasarkan nama departemen dengan GROUP BY dan memfilter hasilnya menggunakan HAVING untuk menampilkan hanya departemen dengan total gaji yang melebihi ambang batas yang ditentukan.

## PENJELASAN WILD CARD
Query ini digunakan untuk memilih semua kolom dari tabel karyawan untuk karyawan yang memiliki gaji di atas rata-rata. Query ini menggunakan subquery untuk menemukan id_karyawan dari tabel gaji di mana gaji lebih besar dari rata-rata gaji. Hasil dari subquery ini kemudian digunakan dalam kondisi WHERE untuk memilih karyawan yang memenuhi kriteria tersebut.
