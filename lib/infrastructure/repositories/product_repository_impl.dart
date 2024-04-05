import 'package:lena/domain/datasources/product_datasource.dart';
import 'package:lena/domain/entities/simple_product_entity.dart';
import 'package:lena/domain/repositories/product_repository.dart';

class ProductRepositoryImplementation extends SimpleProductRepository {
  final SimpleProductDataSource datasource;

  ProductRepositoryImplementation({required this.datasource});

  @override
  Future<List<SimpleProductEntity>> getAdultProducts() {
    return datasource.getAdultProducts();
  }

  @override
  Future<List<SimpleProductEntity>> getAllProducts() {
    return datasource.getAllProducts();
  }

  @override
  Future<List<SimpleProductEntity>> getKidsProducts() {
    return datasource.getKidsProducts();
  }

  @override
  Future<List<SimpleProductEntity>> getManProducts() {
    return datasource.getManProducts();
  }
}
