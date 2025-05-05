 import 'package:her_birthday/features/roast/data/roast_remote_data_source.dart';
import 'package:her_birthday/features/roast/domain/repo/roast_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RoastRepo)
class RoastRepoImpl extends RoastRepo{

  final RoastRemoteDataSource _remoteDataSource;

  RoastRepoImpl(this._remoteDataSource);

  @override
  Future<String> getRoast() {
    return _remoteDataSource.getRoast();
  }
}