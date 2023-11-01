// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:LeNa/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DataProvider extends ChangeNotifier {
  List<SimpleProduct> items = [];
  Future<AllProducts> getAdultClothes() async {
    final records = await http.get(Uri.parse(
        'https://ropita.meapp.online/api/collections/products/records'));

    AllProducts pijamas = AllProducts.fromJson(json.decode(records.body));
    notifyListeners();
    return pijamas;
  }
}
