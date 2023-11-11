import 'package:dio/dio.dart';
import 'package:nike_store/common/exceptions.dart';
import 'package:nike_store/data/product.dart';

abstract class IProductDataSource {
  Future<List<ProductEntity>> getAll(int sort);
  Future<List<ProductEntity>> search(String searchTerm);
}

class ProductRemoteDataSource implements IProductDataSource {
  final Dio httpClient;

  ProductRemoteDataSource(this.httpClient);
  @override
  Future<List<ProductEntity>> getAll(int sort) async {
    final Response response = await httpClient.get('product/list?sort=$sort');
    validateResponse(response);
    final products = <ProductEntity>[];
    for (var element in (response.data as List)) {
      products.add(ProductEntity.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductEntity>> search(String searchTerm) async {
    final Response response =
        await httpClient.get('/product/search?q=$searchTerm');
    validateResponse(response);
    final products = <ProductEntity>[];
    (response.data as List)
        .forEach((element) => products.add(ProductEntity.fromJson(element)));
    return products;
  }

  validateResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppExceptions();
    }
  }
}
