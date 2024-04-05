import 'package:lena/infrastructure/models/products_model.dart';

abstract class SimpleProductDataSource {

  Future<AllProducts> getKidsProducts();
  Future<AllProducts> getManProducts();
  Future<AllProducts> getAdultProducts();
  Future<AllProducts> getAllProducts();

}
