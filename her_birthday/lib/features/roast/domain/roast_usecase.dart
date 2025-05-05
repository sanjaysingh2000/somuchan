import 'package:her_birthday/features/roast/domain/repo/roast_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RoastUsecase {
  final RoastRepo _roastRepo;

  RoastUsecase(this._roastRepo);

  Future<String> getRoast() async {
    return await _roastRepo.getRoast();
  }
}