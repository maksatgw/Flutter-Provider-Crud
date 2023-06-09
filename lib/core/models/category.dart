// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class Category {
  int? kategoriId;
  String? kategoriAd;

  Category({this.kategoriId, this.kategoriAd});

  Category.fromJson(Map<String, dynamic> json) {
    kategoriId = json['kategoriId'];
    kategoriAd = json['kategoriAd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kategoriAd'] = this.kategoriAd;
    return data;
  }
}
