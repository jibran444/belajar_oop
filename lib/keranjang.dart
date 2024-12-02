import 'produk.dart';

class Keranjang {
  List<Map<String, dynamic>> daftarProduk = [];

  void tambahProduk(Produk produk, int jumlah) {
    if (produk.kurangiStok(jumlah)) {
      daftarProduk.add({'produk': produk, 'jumlah': jumlah});
      print('${produk.nama} ditambahkan ke keranjang.');
    } else {
      print('Stok ${produk.nama} tidak mencukupi.');
    }
  }

  void hapusProduk(Produk produk) {
    var item = daftarProduk.firstWhere(
      (item) => item['produk'] == produk,
      orElse: () => {},
    );

    // Periksa apakah item kosong
    if (item.isNotEmpty) {
      daftarProduk.remove(item);
      produk.tambahStok(item['jumlah']);
      print('${produk.nama} dihapus dari keranjang.');
    } else {
      print('${produk.nama} tidak ditemukan di keranjang.');
    }
  }

  double hitungTotal() {
    return daftarProduk.fold(
      0,
      (total, item) => total + (item['produk'].harga * item['jumlah']),
    );
  }

  void tampilkanKeranjang() {
    print('\n=== Isi Keranjang ===');
    if (daftarProduk.isEmpty) {
      print('Keranjang kosong.');
    } else {
      for (var i = 0; i < daftarProduk.length; i++) {
        var item = daftarProduk[i];
        var produk = item['produk'] as Produk;
        print('${i + 1}. ${produk.nama} (x${item['jumlah']})');
      }
      print('Total: Rp${hitungTotal()}');
    }
  }
}
