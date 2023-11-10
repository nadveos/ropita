

class Testing {
    final int page;
    final int perPage;
    final int totalItems;
    final int totalPages;
    final List<SimpleItem> items;

    Testing({
        required this.page,
        required this.perPage,
        required this.totalItems,
        required this.totalPages,
        required this.items,
    });

    factory Testing.fromJson(Map<String, dynamic> json) => Testing(
        page: json["page"],
        perPage: json["perPage"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        items: List<SimpleItem>.from(json["items"].map((x) => SimpleItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "perPage": perPage,
        "totalItems": totalItems,
        "totalPages": totalPages,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class SimpleItem {
    final String collectionId;
    final String collectionName;
    final DateTime created;
    final String id;
    final List<String> image;
    final String title;
    final DateTime updated;

    SimpleItem({
        required this.collectionId,
        required this.collectionName,
        required this.created,
        required this.id,
        required this.image,
        required this.title,
        required this.updated,
    });

    factory SimpleItem.fromJson(Map<String, dynamic> json) => SimpleItem(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        image: List<String>.from(json["image"].map((x) => x)),
        title: json["title"],
        updated: DateTime.parse(json["updated"]),
    );

    Map<String, dynamic> toJson() => {
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created.toIso8601String(),
        "id": id,
        "image": List<dynamic>.from(image.map((x) => x)),
        "title": title,
        "updated": updated.toIso8601String(),
    };
    getImageUrlTest() {
    
      return 'https://ropita.meapp.online/api/files/$collectionId/$id/';
    }
  
}
