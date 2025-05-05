import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class RoastRemoteDataSource {
  Future<String> getRoast();
}

@LazySingleton(as: RoastRemoteDataSource)
class RoastRemoteDataSourceImpl extends RoastRemoteDataSource{
  RoastRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<String> getRoast() async {
    try {
      final response = await _dio.get(
        'https://evilinsult.com/generate_insult.php?lang=en&type=json',

      );
      return response.data['insult'];
    } catch (e) {
      print('error :: $e');
      return "Something went wrong. Please try again later.";
    }
  }
}