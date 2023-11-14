import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:superapp_mobile/data/model/request/register_model.dart';
import 'package:superapp_mobile/data/model/response/register_response_model.dart';
import 'package:superapp_mobile/data/source/api.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiDataSource datasource;
  RegisterBloc(
    this.datasource
  ) : super(RegisterInitialState()) {
    on<StoreRegisterEvent>((event, emit) async {
      emit(RegisterLoadingState());
      Logger().i("TEST");
      final result = await datasource.register(event.request);
      Logger().i("DONE");
      emit(RegisterLoadedState(response: result));
    });
  }
}
