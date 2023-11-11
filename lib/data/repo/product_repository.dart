import 'package:nike_store/data/product.dart';

abstract class IProductRepository {
  Future<List<ProductEntity>> getAll(int sort);
  Future<List<ProductEntity>> search(String searchTerm);
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<ProductEntity>> getAll(int sort) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<List<ProductEntity>> search(String searchTerm) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
