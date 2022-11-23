import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(currentTabIndex: 0)) {
    on<TabChangedEvent>(
      (event, emit) => emit(
        this.state.copyWith(currentTabIndex: event.index),
      ),
    );
  }
}
