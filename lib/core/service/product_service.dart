import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_provider_crud/core/models/product.dart';

class ProductService {
  final dio = Dio();

  Future<List<Product>?> getProduct(int? number) async {
    final url = 'https://mytestapimobile.net/api/urunlers/urunlers?kategoriId=$number';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return (response.data as List).map((x) => Product.fromJson(x)).toList();
      } else {
        print('${response.statusCode} : ${response.data}');
      }
    } catch (e) {
      print('${e}');
    }
  }

  Future<Product?> postProduct(Product product) async {
    const url = 'https://mytestapimobile.net/api/urunlers';
    try {
      var response = await dio.post(url, data: json.encode(product.toJson()));
    } catch (e) {
      print('${e}');
    }
  }

  Future<Product?> delProduct(int? id) async {
    final url = 'https://mytestapimobile.net/api/urunlers/$id';
    try {
      var response = await dio.delete(url);
    } catch (e) {
      print('${e}');
    }
  }
}
