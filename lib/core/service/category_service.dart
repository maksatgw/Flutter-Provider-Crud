import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_provider_crud/core/models/category.dart';

class CategoryService {
  String? error;
  final dio = Dio();
  Future<List<Category>?> getCategory() async {
    const url = 'https://mytestapimobile.net/api/kategoris';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return (response.data as List).map((x) => Category.fromJson(x)).toList();
      } else {
        print('${response.statusCode} : ${response.data}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Category?> postCategory(Category category) async {
    const url = 'https://mytestapimobile.net/api/kategoris';
    try {
      var response = await dio.post(url, data: json.encode(category.toJson()));
    } catch (e) {
      print(e);
    }
  }

  Future delCategory(int? id) async {
    final url = 'https://mytestapimobile.net/api/kategoris/$id';
    try {
      var response = await dio.delete(url);
    } catch (e) {
      print(e);
    }
  }
}
