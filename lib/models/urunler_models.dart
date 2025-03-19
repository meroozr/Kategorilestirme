class UrunlerModels {
  List<Urunler> urunler;
  List<Kategori> kategoriler;

  UrunlerModels(this.urunler, this.kategoriler);

  factory UrunlerModels.fromJson(Map<String, dynamic> json) {
    final List jsonUrunler = json['urunler'];
    final List jsonKategoriler = json['kategoriler'];

    return UrunlerModels(
      jsonUrunler.map((e) => Urunler.fromJson(e)).toList(),
      jsonKategoriler.map((e) => Kategori.fromJson(e)).toList(),
    );
  }
}

class Urunler {
  final int id;
  final int kategori;
  final String isim;
  final String resim;

  Urunler(this.id, this.isim, this.kategori, this.resim);

  Urunler.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      kategori = json['kategori'],
      isim = json['isim'],
      resim = json['resim'];
}

class Kategori {
  final int id;
  final String isim;

  Kategori(this.id, this.isim);
  Kategori.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      isim = json['isim'];
}
