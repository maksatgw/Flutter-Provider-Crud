import 'package:flutter/material.dart';
import 'package:flutter_provider_crud/core/models/category.dart';
import 'package:flutter_provider_crud/core/models/product.dart';
import 'package:flutter_provider_crud/core/service/category_service.dart';
import 'package:flutter_provider_crud/core/service/product_service.dart';

class HomeViewModel extends ChangeNotifier {
  //Variables
  List<Category>? _categoryList = [];
  List<Product>? _productList = [];
  bool _isLoading = false;

  //default page goes to the api
  int? page = 1;
  final CategoryService categoryService = CategoryService();
  final ProductService productService = ProductService();

  //Getters
  List<Category>? get categoryList => _categoryList;
  List<Product>? get productList => _productList;
  bool get isLoading => _isLoading;

  //Setters
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

//Category section start
  Future<void> getCategory() async {
    try {
      _isLoading = true;
      _categoryList = await categoryService.getCategory();
      _isLoading = false;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> postCategory(Category categoryModel) async {
    try {
      isLoading = true;
      await categoryService.postCategory(categoryModel);
      notifyListeners();
      isLoading = false;
    } catch (e) {}
  }

  Future<void> delCategory(int? id) async {
    try {
      await categoryService.delCategory(id);
      await getCategory();
      notifyListeners();
    } catch (e) {}
  }
//Category section ends

//Product section starts

  Future<void> getProduct(int? number) async {
    try {
      _productList = await productService.getProduct(number);
      notifyListeners();
    } catch (e) {}
  }

  Future<void> delProduct(int? id) async {
    try {
      await productService.delProduct(id);
      await getProduct(page);
      notifyListeners();
    } catch (e) {}
  }

//Product section starts

  Future<void> refresh(int? number) async {
    try {
      await getCategory();
      await getProduct(number);
      notifyListeners();
    } catch (e) {}
  }
}
