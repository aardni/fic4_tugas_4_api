import 'dart:convert';

import 'package:fic4_tugas_4_api/belajar/product_model.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  Future<ProductModel> fetchProduct() async {
    final response = await http
        .get(Uri.parse('https://api.escuelajs.co/api/v1/products/79'));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.body);
    } else {
      throw Exception('failed to load product');
    }
  }

  Future<List<ProductModel>> fetchAllProduct() async {
    final response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products/'));

    if (response.statusCode == 200) {
      List<ProductModel> listData = List<ProductModel>.from(
          json.decode(response.body).map((e) => ProductModel.fromJson(e)));
      return listData;
    } else {
      throw Exception('failed to load product');
    }
  }
}
