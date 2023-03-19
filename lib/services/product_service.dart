import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  bool isLoading = true;

  final String _baseUrl = "flutter-varios-11412-default-rtdb.firebaseio.com";

  ProductService() {
    loadProducs();
  }
  List<Product> products = [];
  late Product selectedproduct;

  Future<List<Product>> loadProducs() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "products.json");
    final resp = await http.get(url);

    Map<String, dynamic> data = json.decode(resp.body);

    data.forEach((k, v) {
      final tempProduct = Product.fromMap(v);
      tempProduct.id = k;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return products;
  }
}
