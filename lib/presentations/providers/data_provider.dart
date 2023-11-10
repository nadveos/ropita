// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:ropijamas/data/models/products_model.dart';
//import 'package:ropijamas/data/models/products_model.dart';
//import 'package:ropijamas/data/models/testing_model.dart';

final pb = PocketBase('https://ropita.meapp.online');

class DataProvider extends ChangeNotifier {
  Future<AllProducts> getAdultClothes() async {
    final records = await pb.collection('products').getList();

    AllProducts pijamas = AllProducts.fromJson(records.toJson());

    notifyListeners();
    return pijamas;
  }

  
}
