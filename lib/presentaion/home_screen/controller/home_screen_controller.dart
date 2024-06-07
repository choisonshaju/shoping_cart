import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shpoing_cart/repository/api/model/datamodel.dart';

class Api with ChangeNotifier {
  List<Shop>? apilist = [];
  fetchdata() async {
    final uri = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(uri);
    if (response.statusCode == 200 && response.statusCode < 300) {
      var decodeddata = jsonDecode(response.body);
      apilist = decodeddata.map<Shop>((e) => Shop.fromJson(e)).toList();
      return apilist;
    }
    notifyListeners();
    return null;
  }
}
