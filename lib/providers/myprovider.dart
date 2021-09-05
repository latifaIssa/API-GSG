import 'package:api_gsg/data/api_helper.dart';
import 'package:api_gsg/models/product_responsel.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  List<String> allCategories;
  List<Product> allProducts;
  List<Product> categoryProducts;
  Product selectedProduct;
  getAllCategories() async {
    List<dynamic> categories = await ApiHelper.apiHelper.getAllCategories();
    allCategories = categories.map((e) => e.toString()).toList();
    notifyListeners();
  }

  getAllProducts() async {
    List<dynamic> products = await ApiHelper.apiHelper.getAllProducts();
    allProducts = products.map((e) => Product.fromJson(e)).toList();
    notifyListeners();
  }

  getCategoryProducts(String categoryName) async {
    List<dynamic> products =
        await ApiHelper.apiHelper.getCategoryProducts(categoryName);
    categoryProducts = products.map((e) => Product.fromJson(e)).toList();
    notifyListeners();
  }

  getSelectedProduct(int id) async {
    dynamic product = await ApiHelper.apiHelper.getSingleProduct(id);
    selectedProduct = Product.fromJson(product);
    notifyListeners();
  }
}
