import 'package:dio/dio.dart';
import 'package:nike_store/data/banner.dart';
import 'package:nike_store/data/common/http_response_validator.dart';

abstract class IBannerDataSource {
  Future<List<BannerEntity>> getAll();
}

class BannerRemoteDataSource
    with HttpResponseValidator
    implements IBannerDataSource {
  final Dio httpClient;

  BannerRemoteDataSource(this.httpClient);

  @override
  Future<List<BannerEntity>> getAll() async {
    final Response response = await httpClient.get('banner/slider');
    validateResponse(response);
    final banners = <BannerEntity>[];
    for (var element in (response.data as List)) {
      banners.add(BannerEntity.fromJson(element));
    }
    return banners;
  }
}
