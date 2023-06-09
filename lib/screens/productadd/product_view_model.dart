import 'package:flutter/material.dart';
import 'package:flutter_provider_crud/core/models/product.dart';
import 'package:flutter_provider_crud/core/service/category_service.dart';
import 'package:flutter_provider_crud/core/service/product_service.dart';
import 'package:flutter_provider_crud/screens/home/home_view_model.dart';

class ProductViewModel extends ChangeNotifier {
  //Variables
  String? _catName = "Seçiniz";
  int? _catId = 0;
  bool _isLoading = false;
  final HomeViewModel homeViewModel = HomeViewModel();
  final CategoryService categoryService = CategoryService();
  final ProductService productService = ProductService();

  //Getters
  String? get catName => _catName;
  int? get catId => _catId;
  bool get isLoading => _isLoading;

  //Setters
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set catName(String? value) {
    _catName = value;
    notifyListeners();
  }

  set catId(int? value) {
    _catId = value;
    notifyListeners();
  }

  //Product section starts
  Future<void> postProduct(Product product) async {
    try {
      isLoading = true;
      await productService.postProduct(product);
      notifyListeners();
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }
}
