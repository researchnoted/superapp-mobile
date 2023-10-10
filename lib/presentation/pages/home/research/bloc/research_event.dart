part of 'research_bloc.dart';

abstract class ResearchEvent extends Equatable {
  const ResearchEvent();
}

class GetResearchEvent extends ResearchEvent {
  final String category;

  GetResearchEvent({required this.category});

  @override
  List<Object> get props => [category];
}
