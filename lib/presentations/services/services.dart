import 'package:pocketbase/pocketbase.dart';
import 'package:lena/infrastructure/models/products_model.dart';

class Services {
  final pb = PocketBase('https://lena-db.meapp.com.ar');

  Future<AllProducts> getAllClothes() async {
    final records =
        await pb.collection('products').getList(filter: 'hay = true',perPage: 100);

    AllProducts pijamas = AllProducts.fromJson(records.toJson());

    return pijamas;
  }

  //kids

  Future<AllProducts> kidsClothes() async {
    final records = await pb.collection('products').getList(
          filter: 'hay = true && category = "Infantil"',
        );

    AllProducts kidPijamas = AllProducts.fromJson(records.toJson());

    return kidPijamas;
  }

//adult
  Future<AllProducts> adultClothes() async {
    final records = await pb
        .collection('products')
        .getList(filter: 'hay = true && category = "Adulto"');

    AllProducts adultPijamas = AllProducts.fromJson(records.toJson());

    return adultPijamas;
  }

//only mans
  Future<AllProducts> menClothes() async {
    final records = await pb
        .collection('products')
        .getList(filter: 'hay = true && category = "Hombre"');

    AllProducts manPijamas = AllProducts.fromJson(records.toJson());

    return manPijamas;
  }
}
