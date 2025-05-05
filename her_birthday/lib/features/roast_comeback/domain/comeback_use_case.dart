import 'package:her_birthday/features/roast_comeback/domain/repo/come_back_repo.dart';
import 'package:her_birthday/features/roast_comeback/presentation/bloc/comeback_bloc_event.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ComebackUseCase {
  final ComeBackRepo _comeBackRepo;
  ComebackUseCase(this._comeBackRepo);

  Future<String> getComeback(String roast) async {
    return await _comeBackRepo.getComeback(roast);
  }
}
