import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_birthday/features/roast/domain/roast_usecase.dart';
import 'package:her_birthday/features/roast/presentation/bloc/roast_event.dart';
import 'package:her_birthday/features/roast/presentation/bloc/roast_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class RoastBloc extends Bloc<RoastEvent, RoastState> {
  final RoastUsecase _roastUsecase;

  RoastBloc(this._roastUsecase) : super(const RoastStateInitial()) {
    on<RoastEvent>((event, emit) async {
      try {
        emit(const RoastStateLoading());
        await _roastUsecase.getRoast().then((roast) {
          print('roast: $roast');
          emit(RoastStateLoaded(roast));
        });
      } on DioException catch (e) {
        emit(RoastStateError(e.toString()));
      } catch (e) {
        emit(RoastStateError(e.toString()));
      }
    });
  }
}
