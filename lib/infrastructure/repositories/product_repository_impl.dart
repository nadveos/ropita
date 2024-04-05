import 'package:lena/domain/datasources/product_datasource.dart';
import 'package:lena/domain/repositories/product_repository.dart';
import 'package:lena/infrastructure/models/products_model.dart';

class ProductRepositoryImplementation extends SimpleProductRepository {
  final SimpleProductDataSource datasource;

  ProductRepositoryImplementation({required this.datasource});

  @override
  Future<AllProducts> getAdultProducts() {
    return datasource.getAdultProducts();
  }

  @override
  Future<AllProducts> getAllProducts() {
    return datasource.getAllProducts();
  }

  @override
  Future<AllProducts> getKidsProducts() {
    return datasource.getKidsProducts();
  }

  @override
  Future<AllProducts> getManProducts() {
    return datasource.getManProducts();
  }
}
