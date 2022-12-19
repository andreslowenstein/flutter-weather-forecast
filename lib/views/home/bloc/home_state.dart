part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int? currentTabIndex;

  HomeState({
    required this.currentTabIndex,
  }) {
    print("Home info Updated");
  }

  @override
  List<Object?> get props => [currentTabIndex];

  HomeState copyWith({
    int? currentTabIndex,
  }) {
    return HomeState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
    );
  }
}

class GetWeatherLoading extends HomeState {
  GetWeatherLoading({
    required super.currentTabIndex,
  });
}

class GetWeatherLoaded extends HomeState {
  final WeatherModelList weather;

  GetWeatherLoaded({
    required super.currentTabIndex,
    required this.weather,
  });
}

class TabChangeLoading extends HomeState {
  TabChangeLoading({
    required super.currentTabIndex,
  });
}

class TabChangeLoaded extends HomeState {
  final WeatherModelList weather;

  TabChangeLoaded({
    required super.currentTabIndex,
    required this.weather,
  });
}
