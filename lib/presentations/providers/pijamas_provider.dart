import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lena/infrastructure/datasources/simple_products_datasource.dart';
import 'package:lena/infrastructure/repositories/product_repository_impl.dart';

final pijamasRepositoryProvider = Provider((ref) {
  return ProductRepositoryImplementation(datasource: ProductsDataSource());
});
