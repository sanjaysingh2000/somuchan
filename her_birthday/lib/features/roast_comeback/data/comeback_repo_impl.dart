import 'package:her_birthday/features/roast_comeback/data/come_back_remote_source.dart';
import 'package:her_birthday/features/roast_comeback/domain/repo/come_back_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ComeBackRepo)
class ComebackRepoImpl extends ComeBackRepo{
  ComebackRepoImpl(this._remoteDataSource);
  final ComeBackRemoteSource _remoteDataSource;
  // @override
  // Future<String> getComeBack(String roast) {
  //   return _remoteDataSource.getComeback(roast);
  // }
  
  @override
  Future<String> getComeback(String roast) {
    // TODO: implement getComeback
    return _remoteDataSource.getComeback(roast);
  }

}