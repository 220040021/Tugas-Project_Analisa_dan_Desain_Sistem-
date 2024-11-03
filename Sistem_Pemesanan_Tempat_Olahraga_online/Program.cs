using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sistem_Pemesanan_Tempat_Olahraga_online

{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    namespace SistemPemesananTempatOlahraga
    {
        public class TempatOlahraga
        {
            public int ID { get; set; }
            public string Nama { get; set; }
            public string Jenis { get; set; }
            public string Lokasi { get; set; }
            public double BiayaPerJam { get; set; } // Biaya per jam untuk tempat olahraga
            public List<string> JamOperasional { get; set; } = new List<string> { "08:00", "10:00", "12:00", "14:00", "16:00", "18:00" };
            public List<string> JadwalTersedia { get; set; } = new List<string>();

            public TempatOlahraga()
            {
                JadwalTersedia.AddRange(JamOperasional);
            }
        }

        public class Anggota
        {
            public int ID { get; set; }
            public string Nama { get; set; }
            public double Saldo { get; set; } // Saldo anggota untuk pembayaran
        }

        public class Pemesanan
        {
            public int TempatID { get; set; }
            public int AnggotaID { get; set; }
            public string Waktu { get; set; }
            public DateTime Tanggal { get; set; }
            public double Biaya { get; set; } // Biaya reservasi
        }

        internal class Program
        {
            private static List<TempatOlahraga> daftarTempat = new List<TempatOlahraga>();
            private static List<Anggota> daftarAnggota = new List<Anggota>();
            private static List<Pemesanan> daftarPemesanan = new List<Pemesanan>();

            static void Main(string[] args)
            {
                // Tambahkan data tempat olahraga awal
                TambahTempatOlahraga(new TempatOlahraga { ID = 1, Nama = "Gym A", Jenis = "Gym", Lokasi = "Jl. Merdeka", BiayaPerJam = 50000 });
                TambahTempatOlahraga(new TempatOlahraga { ID = 2, Nama = "Lapangan Tenis B", Jenis = "Tenis", Lokasi = "Jl. Proklamasi", BiayaPerJam = 75000 });
                TambahTempatOlahraga(new TempatOlahraga { ID = 3, Nama = "Lapangan Futsal A", Jenis = "Futsal", Lokasi = "Jl. Durian", BiayaPerJam = 100000 });
                TambahTempatOlahraga(new TempatOlahraga { ID = 4, Nama = "Lapangan Basket B", Jenis = "Basket", Lokasi = "Jl. Kutilang", BiayaPerJam = 75000 });

                while (true)
                {
                    Console.WriteLine("\nSistem Pemesanan Tempat Olahraga Online:");
                    Console.WriteLine("1. Tambah Anggota");
                    Console.WriteLine("2. Lihat Daftar Tempat Olahraga dan Biaya");
                    Console.WriteLine("3. Lihat Ketersediaan Tempat");
                    Console.WriteLine("4. Buat Pemesanan");
                    Console.WriteLine("5. Lihat Pemesanan");
                    Console.WriteLine("6. Batalkan Pemesanan");
                    Console.WriteLine("7. Keluar");
                    Console.Write("Pilih opsi: ");

                    string opsi = Console.ReadLine();
                    switch (opsi)
                    {
                        case "1":
                            TambahAnggota();
                            break;
                        case "2":
                            LihatDaftarTempatDanBiaya();
                            break;
                        case "3":
                            LihatKetersediaanTempat();
                            break;
                        case "4":
                            BuatPemesanan();
                            break;
                        case "5":
                            LihatPemesanan();
                            break;
                        case "6":
                            BatalkanPemesanan();
                            break;
                        case "7":
                            return;
                        default:
                            Console.WriteLine("Opsi tidak valid.");
                            break;
                    }
                }
            }

            static void TambahTempatOlahraga(TempatOlahraga tempat)
            {
                daftarTempat.Add(tempat);
            }

            static void TambahAnggota()
            {
                Anggota anggota = new Anggota();
                Console.Write("Masukkan ID Anggota: ");
                anggota.ID = int.Parse(Console.ReadLine());

                Console.Write("Masukkan Nama Anggota: ");
                anggota.Nama = Console.ReadLine();

                Console.Write("Masukkan Saldo Awal (untuk pembayaran): ");
                anggota.Saldo = double.Parse(Console.ReadLine());

                daftarAnggota.Add(anggota);
                Console.WriteLine("Anggota berhasil ditambahkan!");
            }

            static void LihatDaftarTempatDanBiaya()
            {
                Console.WriteLine("\nDaftar Tempat Olahraga dan Biaya:");
                foreach (var tempat in daftarTempat)
                {
                    Console.WriteLine($"ID: {tempat.ID}, Nama: {tempat.Nama}, Jenis: {tempat.Jenis}, Lokasi: {tempat.Lokasi}, Biaya per Jam: {tempat.BiayaPerJam:C}");
                }
            }

            static void LihatKetersediaanTempat()
            {
                Console.Write("Masukkan ID Tempat Olahraga: ");
                int idTempat = int.Parse(Console.ReadLine());
                var tempat = daftarTempat.FirstOrDefault(t => t.ID == idTempat);

                if (tempat != null)
                {
                    Console.WriteLine("\nJadwal Tersedia:");
                    foreach (var jam in tempat.JadwalTersedia)
                    {
                        Console.WriteLine(jam);
                    }
                }
                else
                {
                    Console.WriteLine("Tempat olahraga tidak ditemukan.");
                }
            }

            static void BuatPemesanan()
            {
                Console.Write("Masukkan ID Tempat Olahraga yang ingin dipesan: ");
                int idTempat = int.Parse(Console.ReadLine());
                var tempat = daftarTempat.FirstOrDefault(t => t.ID == idTempat);

                if (tempat == null)
                {
                    Console.WriteLine("Tempat olahraga tidak ditemukan.");
                    return;
                }

                Console.Write("Masukkan ID Anggota yang memesan: ");
                int idAnggota = int.Parse(Console.ReadLine());
                var anggota = daftarAnggota.FirstOrDefault(a => a.ID == idAnggota);

                if (anggota == null)
                {
                    Console.WriteLine("Anggota tidak ditemukan.");
                    return;
                }

                Console.Write("Masukkan Tanggal Pemesanan (yyyy-MM-dd): ");
                DateTime tanggal;
                if (!DateTime.TryParse(Console.ReadLine(), out tanggal))
                {
                    Console.WriteLine("Format tanggal tidak valid.");
                    return;
                }

                Console.WriteLine("\nJam Tersedia:");
                foreach (var jam in tempat.JadwalTersedia)
                {
                    Console.WriteLine(jam);
                }

                Console.Write("Pilih Jam (format HH:mm, misalnya 08:00): ");
                string jamDipilih = Console.ReadLine();

                DateTime jamPemesanan;
                if (!DateTime.TryParseExact(jamDipilih, "HH:mm", null, System.Globalization.DateTimeStyles.None, out jamPemesanan))
                {
                    Console.WriteLine("Format jam tidak valid. Pastikan menggunakan format HH:mm.");
                    return;
                }

                string jamDipilihFormatted = jamPemesanan.ToString("HH:mm");

                if (!tempat.JadwalTersedia.Contains(jamDipilihFormatted))
                {
                    Console.WriteLine("Jam tidak tersedia.");
                    return;
                }

                double biayaPemesanan = tempat.BiayaPerJam;
                if (anggota.Saldo < biayaPemesanan)
                {
                    Console.WriteLine("Saldo tidak mencukupi. Silakan isi saldo terlebih dahulu.");
                    return;
                }

                Pemesanan pemesanan = new Pemesanan
                {
                    TempatID = idTempat,
                    AnggotaID = idAnggota,
                    Tanggal = tanggal,
                    Waktu = jamDipilihFormatted,
                    Biaya = biayaPemesanan
                };
                daftarPemesanan.Add(pemesanan);
                tempat.JadwalTersedia.Remove(jamDipilihFormatted);
                anggota.Saldo -= biayaPemesanan;

                Console.WriteLine("Pemesanan berhasil dibuat dan pembayaran berhasil diproses!");
            }

            static void LihatPemesanan()
            {
                Console.WriteLine("\nDaftar Pemesanan:");
                foreach (var pemesanan in daftarPemesanan)
                {
                    var tempat = daftarTempat.FirstOrDefault(t => t.ID == pemesanan.TempatID);
                    var anggota = daftarAnggota.FirstOrDefault(a => a.ID == pemesanan.AnggotaID);
                    Console.WriteLine($"Tempat: {tempat.Nama}, Anggota: {anggota.Nama}, Tanggal: {pemesanan.Tanggal.ToShortDateString()}, Waktu: {pemesanan.Waktu}, Biaya: {pemesanan.Biaya:C}");
                }
            }

            static void BatalkanPemesanan()
            {
                Console.Write("Masukkan ID Tempat Olahraga yang pemesanannya akan dibatalkan: ");
                int idTempat = int.Parse(Console.ReadLine());
                Console.Write("Masukkan ID Anggota yang ingin membatalkan pemesanan: ");
                int idAnggota = int.Parse(Console.ReadLine());

                var pemesanan = daftarPemesanan.FirstOrDefault(p => p.TempatID == idTempat && p.AnggotaID == idAnggota);
                if (pemesanan == null)
                {
                    Console.WriteLine("Pemesanan tidak ditemukan.");
                    return;
                }

                // Kembalikan slot jam yang dibatalkan ke jadwal tersedia
                var tempat = daftarTempat.FirstOrDefault(t => t.ID == pemesanan.TempatID);
                if (tempat != null)
                {
                    tempat.JadwalTersedia.Add(pemesanan.Waktu);
                }

                // Refund biaya ke saldo anggota
                var anggota = daftarAnggota.FirstOrDefault(a => a.ID == pemesanan.AnggotaID);
                if (anggota != null)
                {
                    anggota.Saldo += pemesanan.Biaya;
                }

                // Hapus pemesanan dari daftar
                daftarPemesanan.Remove(pemesanan);
                Console.WriteLine("Pemesanan berhasil dibatalkan dan saldo dikembalikan.");
            }
        }
    }
}
