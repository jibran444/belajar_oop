class Produk {
  String nama;
  double harga;
  int stok;

  Produk(this.nama, this.harga, this.stok);

  void tambahStok(int jumlah) {
    stok += jumlah;
  }

  bool kurangiStok(int jumlah) {
    if (stok >= jumlah) {
      stok -= jumlah;
      return true;
    }
    return false;
  }

  void tampilkanInfo() {
    print('$nama - Harga: Rp$harga, Stok: $stok');
  }
}
