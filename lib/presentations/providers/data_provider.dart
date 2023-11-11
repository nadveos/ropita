// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:ropijamas/data/models/products_model.dart';
//import 'package:ropijamas/data/models/products_model.dart';
//import 'package:ropijamas/data/models/testing_model.dart';

final pb = PocketBase('https://ropita.meapp.online');

class DataProvider extends ChangeNotifier {
  // Future<AllProducts> getAllClothes() async {
  //   final records =
  //       await pb.collection('products').getList(filter: 'hay = true');

  //   AllProducts pijamas = AllProducts.fromJson(records.toJson());

  //   notifyListeners();
  //   return pijamas;
  // }

  Future<AllProducts> kidsClothes() async {
    final records = await pb
        .collection('products')
        .getList(filter: 'hay = true && category = "Infantil"');

    AllProducts kidPijamas = AllProducts.fromJson(records.toJson());

    notifyListeners();
    return kidPijamas;
  }

  Future<AllProducts> adultClothes() async {
    final records = await pb
        .collection('products')
        .getList(filter: 'hay = true && category = "Adulto"');

    AllProducts adultPijamas = AllProducts.fromJson(records.toJson());

    notifyListeners();
    return adultPijamas;
  }

  Future<AllProducts> menClothes() async {
    final records = await pb
        .collection('products')
        .getList(filter: 'hay = true && category = "Hombre"');

    AllProducts manPijamas = AllProducts.fromJson(records.toJson());

    notifyListeners();
    return manPijamas;
  }
}
