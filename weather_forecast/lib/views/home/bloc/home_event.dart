part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class TabChangedEvent extends HomeEvent {
  final int index;
  TabChangedEvent(this.index);
}
