
import 'dart:convert';

import 'package:ropijamas/infrastructure/models/simple_product_model.dart';





AllProducts productsFromJson(String str) =>
    AllProducts.fromJson(json.decode(str));

String productsToJson(AllProducts data) => json.encode(data.toJson());

class AllProducts {
  final int page;
  final int perPage;
  final int totalItems;
  final int totalPages;
  final List<SimpleProduct> items;

  AllProducts({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
        page: json["page"],
        perPage: json["perPage"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        items: List<SimpleProduct>.from(
            json["items"].map((x) => SimpleProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "perPage": perPage,
        "totalItems": totalItems,
        "totalPages": totalPages,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}


  
  
 
  
      

