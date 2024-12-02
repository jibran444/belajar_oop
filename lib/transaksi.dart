import 'produk.dart';

class Transaksi {
  DateTime tanggal;
  List<Map<String, dynamic>> items;
  double total;

  Transaksi(this.items, this.total) : tanggal = DateTime.now();

  void cetakStruk() {
    print('\n=== Struk Transaksi ===');
    print('Tanggal: ${tanggal.toLocal()}');
    for (var item in items) {
      var produk = item['produk'] as Produk;
      print('- ${produk.nama} x${item['jumlah']} = Rp${produk.harga * item['jumlah']}');
    }
    print('Total Bayar: Rp$total');
    print('========================');
  }
}
