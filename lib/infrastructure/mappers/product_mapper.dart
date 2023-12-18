import 'package:ropijamas/domain/entities/simple_product_entity.dart';
import 'package:ropijamas/infrastructure/models/simple_product_model.dart';

class ProductMapper {
  static SimpleProductEntity productToEntity(SimpleProduct prod) =>
      SimpleProductEntity(
          category: prod.category,
          collectionId: prod.collectionId,
          collectionName: prod.collectionName,
          created: prod.created,
          description: prod.description,
          id: prod.id,
          image: prod.image,
          name: prod.name,
          price: prod.price,
          size: prod.size,
          updated: prod.updated,
          hay: prod.hay);
}
