import 'dart:convert';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shpoing_cart/repository/api/model/datamodel.dart';

class HomeController with ChangeNotifier {
  bool isLoading = false;

  static List productList = [];
  static List productkey = [];
  var mybox = Hive.box("testBox");
  void adddata({
    required String title,
    required String image,
    required String description,
    required String price,
    required String rating,
  }) {
    mybox.add({
      "title": title,
      "image": image,
      "description": description,
      "price": price,
      "rating": rating,
    });
    notifyListeners();
  }

  void delete(int index) {
    mybox.deleteAt(index);
    productkey = mybox.keys.toList();
    notifyListeners();
  }

  List<Shop>? productlist = [];
  fetchdata() async {
    isLoading = true;
    final uri = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(uri);
    if (response.statusCode == 200 && response.statusCode < 300) {
      var decodeddata = jsonDecode(response.body);
      productlist = decodeddata.map<Shop>((e) => Shop.fromJson(e)).toList();
      isLoading = false;
      return productlist;
    }
    notifyListeners();
    return null;
  }
}
