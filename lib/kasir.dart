import 'transaksi.dart';
import 'keranjang.dart';

class Kasir {
  String nama;
  List<Transaksi> daftarTransaksi = [];

  Kasir(this.nama);

  void prosesTransaksi(Keranjang keranjang) {
    if (keranjang.daftarProduk.isEmpty) {
      print('Keranjang kosong. Tidak ada transaksi yang diproses.');
      return;
    }

    var total = keranjang.hitungTotal();
    var transaksi = Transaksi(keranjang.daftarProduk, total);
    daftarTransaksi.add(transaksi);
    keranjang.daftarProduk.clear();

    print('\n=== Transaksi Diproses ===');
    print('Nama Kasir: $nama'); // Menampilkan nama kasir
    transaksi.cetakStruk();
  }

  void laporanPenjualan() {
    print('\n=== Laporan Penjualan ===');
    print('Nama Kasir: $nama'); // Menampilkan nama kasir
    
    if (daftarTransaksi.isEmpty) {
      print('Belum ada transaksi.');
    } else {
      for (var transaksi in daftarTransaksi) {
        print('- Tanggal: ${transaksi.tanggal}, Total: Rp${transaksi.total}');
      }
    }
  }

}
