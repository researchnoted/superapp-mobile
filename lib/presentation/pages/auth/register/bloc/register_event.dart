part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class StoreRegisterEvent extends RegisterEvent {
  final RegisterModel request;
  StoreRegisterEvent({
    required this.request,
  });
}
