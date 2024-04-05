import 'package:lena/domain/entities/simple_product_entity.dart';

abstract class SimpleProductDataSource {

  Future<List<SimpleProductEntity>> getKidsProducts();
  Future<List<SimpleProductEntity>> getManProducts();
  Future<List<SimpleProductEntity>> getAdultProducts();
  Future<List<SimpleProductEntity>> getAllProducts();

}
