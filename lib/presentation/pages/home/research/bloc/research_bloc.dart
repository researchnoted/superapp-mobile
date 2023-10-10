import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:superapp_mobile/common/internetCheck.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
import 'package:bloc/bloc.dart';
import 'package:superapp_mobile/domain/usecases/research/getResearchs.dart';

part 'research_event.dart';
part 'research_state.dart';

class ResearchBloc extends Bloc<ResearchEvent, ResearchState> {
  GetResearchs getResearchs;
  Logger log;
  InternetCheck internetCheck;

  ResearchBloc(
      {required this.getResearchs,
      required this.log,
      required this.internetCheck})
      : super(ResearchLoadingState()) {
    on<GetResearchEvent>(_getResearch);
  }

  void _getResearch(GetResearchEvent event, Emitter<ResearchState> emit) async {
    bool hasConnection = await internetCheck.hasConnection();
    if (hasConnection) {
      final result = await getResearchs.execute();
      await result.fold((failure) async {
        emit(ResearchErrorState());
      }, (researchList) async {
        emit(ResearchLoadedState(researchList: researchList));
      });
    } else {
      if (state is ResearchLoadedState) {
      } else {
        emit(ResearchNoInternetState());
      }
    }
  }

  bool isResearchListEmpty(ResearchList researchList) {
    return (researchList.data == 0);
  }
}
