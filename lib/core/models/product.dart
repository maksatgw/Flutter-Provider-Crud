// ignore_for_file: unnecessary_this

class Product {
  int? urunId;
  String? urunAd;
  int? kategoriId;
  int? adet;

  Product({this.urunId, this.urunAd, this.kategoriId, this.adet});

  Product.fromJson(Map<String, dynamic> json) {
    urunId = json['urunId'];
    urunAd = json['urunAd'];
    kategoriId = json['kategoriId'];
    adet = json['adet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urunAd'] = this.urunAd;
    data['kategoriId'] = this.kategoriId;
    data['adet'] = this.adet;
    return data;
  }
}
