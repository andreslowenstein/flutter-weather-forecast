part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class TabChangedEvent extends HomeEvent {
  final int index;
  TabChangedEvent(this.index);
}

class GetWeatherEvent extends HomeEvent {
  final String lang;
  final String city;

  GetWeatherEvent({required this.city, required this.lang});
}

class SwitchLanguageEvent extends HomeEvent {
  final String lang;
  final int index;

  SwitchLanguageEvent({
    required this.lang,
    required this.index,
  });
}
