import 'dart:io';
import 'package:api_gsg/data/sp_helper.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();

  Future<List<dynamic>> getAllCategories() async {
    String url = '$apiUrl/categories';
    Response response = await dio.get(url);
    List<dynamic> categories = response.data;
    return categories;
  }

  Future<List<dynamic>> getCategoryProducts(String categoryName) async {
    String url = $apiUrl/category/$categoryName';
    Response response = await dio.get(url);
    List<dynamic> products = response.data;
    return products;
  }

  Future<List<dynamic>> getAllProducts() async {
    String url = apiUrl;
    Response response = await dio.get(url);
    List<dynamic> products = response.data;
    return products;
  }

  Future<dynamic> getSpecificProduct(int id) async {
    String url = '$apiUrl/$id';
    Response response = await dio.get(url);
    return response.data;
  }

  login(String email, String password, String fcmToken) async {
    String url = '$dashboardUrl/login';
    Response response = await Dio().post(url, data: {
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
      'device_type': 'android'
    });
    SpHelper.spHelper.storeToken(response.data['data']['access_token']);
  }

  addOrRemoveFromFavourite(int productId) async {
    String url =
        '$dashboardUrl/add_or_remove_product_from_favourite/$productId';
    try {
      Response response = await Dio().post(url,
          options: Options(headers: {
            'Authorization': 'Bearer ${SpHelper.spHelper.getToken()}'
          }));
      print(response.data);
    } on Exception catch (e) {
      print(e);
    }
  }

  getFavourite() async {
    String url = 'https://dashboard.giftyonline.ae/api/v1/getFavourites';
    Response response = await Dio().get(url,
        options: Options(headers: {
          'Authorization': 'Bearer ${SpHelper.spHelper.getToken()}'
        }));
    print(response.data);
  }
}
