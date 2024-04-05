import 'package:lena/config/config.dart';
import 'package:lena/domain/datasources/product_datasource.dart';
import 'package:lena/infrastructure/models/products_model.dart';
import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase(Enviroment.apiUrl);

class ProductsDataSource extends SimpleProductDataSource {
  @override
  Future<AllProducts> getAdultProducts() async {
    final adults = await pb
        .collection('products')
        .getList(filter: 'hay == true && category = "Adulto"');
    AllProducts adultPijamas = AllProducts.fromJson(adults.toJson());
    return adultPijamas;
  }

  @override
  Future<AllProducts> getKidsProducts() async {
    final kids = await pb
        .collection('products')
        .getList(filter: 'hay == true && category = "Infantil"');
    AllProducts kidsPijamas = AllProducts.fromJson(kids.toJson());
    return kidsPijamas;
  }

  @override
  Future<AllProducts> getManProducts() async {
    final mans = await pb
        .collection('products')
        .getList(filter: 'hay == true && category = "Hombre"');
    AllProducts mansPijamas = AllProducts.fromJson(mans.toJson());
    return mansPijamas;
  }

  @override
  Future<AllProducts> getAllProducts() async {
    final records = await pb
        .collection('products')
        .getList(filter: 'hay = true', perPage: 100);

    AllProducts pijamas = AllProducts.fromJson(records.toJson());

    return pijamas;
  }
}
