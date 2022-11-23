part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int currentTabIndex;

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
