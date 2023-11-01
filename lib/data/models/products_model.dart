// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import 'package:LeNa/domain/entities/simple_product_entity.dart';



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

class SimpleProduct {
  final String category;
  final String collectionId;
  final String collectionName;
  final DateTime created;
  final String description;
  final String id;
  final String image;
  final String name;
  final String price;
  final String size;
  final DateTime updated;

  SimpleProduct({
    required this.category,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.description,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.size,
    required this.updated,
  });

  factory SimpleProduct.fromJson(Map<String, dynamic> json) => SimpleProduct(
        category: json['category'],
        collectionId: json['collectionId'],
        collectionName: json['collectionName'],
        created: DateTime.parse(json["created"]),
        description: json['description'],
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        size: json["size"],
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created.toIso8601String(),
        "description": description,
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "size": size,
        "updated": updated.toIso8601String(),
      };
  
  SimpleProductEntity toEntity() => SimpleProductEntity(
      category: category,
      collectionId: collectionId,
      collectionName: collectionName,
      created: created,
      description: description,
      id: id,
      image: image,
      name: name,
      price: price,
      size: size,
      updated: updated);
  getImageUrl() {
    if (image == '') {
      return 'https://miro.medium.com/max/500/0*-ouKIOsDCzVCTjK-.png';
    } else {
      return 'https://ropita.meapp.online/api/files/$collectionId/$id/$image';
    }
  }    
}
