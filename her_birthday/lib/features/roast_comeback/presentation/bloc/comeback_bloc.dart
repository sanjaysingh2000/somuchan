import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_birthday/features/roast_comeback/domain/comeback_use_case.dart';
import 'package:her_birthday/features/roast_comeback/presentation/bloc/comeback_bloc_event.dart';
import 'package:her_birthday/features/roast_comeback/presentation/bloc/comeback_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CombackBloc extends Bloc<ComebackEvent, ComebackState> {

  final ComebackUseCase _comebackUseCase;
  

  CombackBloc(this._comebackUseCase) : super(ComebackStateInitial()) {
    on<GetComebackRoasttt>((event, emit) async{
      try{
        emit(ComebackStateLoading());
        await _comebackUseCase.getComeback(event.roast).then((comeback) {
          print('comeback: $comeback');
          emit(ComebackStateLoaded(comeback));
        });
      } on DioException catch(e){
        emit(ComebackStateError(e.response?.statusMessage??''));
      }
    });
  }
}