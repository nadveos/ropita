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
  final bool hay;

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
    required this.hay,
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
      hay: true);

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
        "hay": hay,
      };
       getImageUrl() {
    if (image == '') {
      return 'https://miro.medium.com/max/500/0*-ouKIOsDCzVCTjK-.png';
    } else {
      return 'https://lena-db.meapp.com.ar/api/files/$collectionId/$id/$image';
    }
  }

}
