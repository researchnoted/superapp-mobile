part of 'research_bloc.dart';

abstract class ResearchState extends Equatable {
  const ResearchState();
}

class ResearchLoadingState extends ResearchState {
  @override
  List<Object> get props => [];
}

class ResearchErrorState extends ResearchState {
  @override
  List<Object> get props => [];
}

class ResearchNoInternetState extends ResearchState {
  @override
  List<Object> get props => [];
}

class ResearchLoadedState extends ResearchState {
  final ResearchList researchList;

  ResearchLoadedState({required this.researchList});

  @override
  List<Object> get props => [researchList];
}
