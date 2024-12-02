import 'dart:io';
import '../lib/produk.dart';
import '../lib/keranjang.dart';
import '../lib/kasir.dart';

void main() {
  var daftarProduk = [
    Produk('Pensil', 2000, 60),
    Produk('Buku', 10000, 40),
    Produk('Penghapus', 1500, 30),
    Produk('Penggaris', 3000, 70),
    Produk('Pulpen', 3000, 25),
  ];

  var keranjang = Keranjang();
  var kasir = Kasir('Jibran');

  while (true) {
    print('\n=== Sistem POS Sederhana ===');
    print('1. Tampilkan Produk');
    print('2. Tambah Produk ke Keranjang');
    print('3. Hapus Produk dari Keranjang');
    print('4. Lihat Keranjang');
    print('5. Proses Transaksi');
    print('6. Laporan Penjualan');
    print('7. Keluar');
    stdout.write('Pilih menu (1-7): ');
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        print('\n=== Daftar Produk ===');
        for (var i = 0; i < daftarProduk.length; i++) {
          print('${i + 1}. ${daftarProduk[i].nama} - Rp${daftarProduk[i].harga} (Stok: ${daftarProduk[i].stok})');
        }
        break;
      case '2':
        print('\n=== Tambah Produk ke Keranjang ===');
        for (var i = 0; i < daftarProduk.length; i++) {
          print('${i + 1}. ${daftarProduk[i].nama} - Rp${daftarProduk[i].harga} (Stok: ${daftarProduk[i].stok})');
        }
        stdout.write('Masukkan nomor produk (1-${daftarProduk.length}): ');
        var indexProduk = int.tryParse(stdin.readLineSync() ?? '');
        
        if (indexProduk == null || indexProduk < 1 || indexProduk > daftarProduk.length) {
          print('Nomor produk tidak valid. Silakan coba lagi.');
          break;
        }

        stdout.write('Masukkan jumlah: ');
        var jumlah = int.tryParse(stdin.readLineSync() ?? '');
        if (jumlah == null || jumlah <= 0) {
          print('Jumlah tidak valid. Silakan coba lagi.');
          break;
        }

        keranjang.tambahProduk(daftarProduk[indexProduk - 1], jumlah);
        break;
      case '3':
        keranjang.tampilkanKeranjang();
        stdout.write('Masukkan nomor produk di keranjang: ');
        var indexKeranjang = int.tryParse(stdin.readLineSync() ?? '');
        
        if (indexKeranjang == null || indexKeranjang < 1 || indexKeranjang > keranjang.daftarProduk.length) {
          print('Nomor produk tidak valid. Silakan coba lagi.');
          break;
        }

        var produkDihapus = keranjang.daftarProduk[indexKeranjang - 1]['produk'] as Produk;
        keranjang.hapusProduk(produkDihapus);
        break;

      case '4':
        keranjang.tampilkanKeranjang();
        break;
      case '5':
        kasir.prosesTransaksi(keranjang);
        break;
      case '6':
        kasir.laporanPenjualan();
        break;
      case '7':
        print('Terima kasih telah menggunakan sistem POS!');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
