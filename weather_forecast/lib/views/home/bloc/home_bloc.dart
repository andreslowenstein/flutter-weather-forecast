import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/services/data_service.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataService _service;

  HomeBloc()
      : _service = DataService(),
        super(HomeState(currentTabIndex: 0)) {
    on<TabChangedEvent>((event, emit) => onTabChange(event, emit));
    on<GetWeatherEvent>(
      (event, emit) => getWeather(event, emit),
    );
    on<SwitchLanguageEvent>(
      (event, emit) => switchLanguage(event, emit),
    );
  }

  String currentLanguage = 'en';
  int currentTab = 0;

  Future<void> getWeather(
      GetWeatherEvent event, Emitter<HomeState> emit) async {
    emit(GetWeatherLoading(currentTabIndex: null));

    WeatherModel weather = await _service.getWeather('london', currentLanguage);

    emit(GetWeatherLoaded(weather: weather, currentTabIndex: null));
  }

  Future<void> onTabChange(
      TabChangedEvent event, Emitter<HomeState> emit) async {
    emit(this.state.copyWith(currentTabIndex: event.index));
    emit(TabChangeLoading(currentTabIndex: event.index));
    String city;
    switch (event.index) {
      case 0:
        city = 'London';
        break;
      case 1:
        city = 'Buenos Aires';
        break;
      case 2:
        city = 'New York';
        break;
      default:
        city = 'London';
    }
    WeatherModel weather = await _service.getWeather(city, currentLanguage);

    emit(TabChangeLoaded(weather: weather, currentTabIndex: event.index));
  }

  Future<void> switchLanguage(
      SwitchLanguageEvent event, Emitter<HomeState> emit) async {
    emit(this.state.copyWith(currentTabIndex: event.index));
    emit(TabChangeLoading(currentTabIndex: event.index));
    String city;
    switch (event.index) {
      case 0:
        city = 'London';
        break;
      case 1:
        city = 'Buenos Aires';
        break;
      case 2:
        city = 'New York';
        break;
      default:
        city = 'London';
    }
    currentLanguage = event.lang;
    WeatherModel weather = await _service.getWeather(city, currentLanguage);

    emit(TabChangeLoaded(weather: weather, currentTabIndex: event.index));
  }
}
