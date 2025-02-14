import 'package:flutter_base_project/ui/screens/home/bloc/home_event.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeState _homeState = const HomeState();

  HomeBloc() : super(const HomeState()) {
    on<HomeInitEvent>(_init);
    on<HomeCountEvent>(_count);
  }

  void _init(
    HomeInitEvent event,
    Emitter<HomeState> emitter,
  ) async {
    _homeState = _homeState.copyWith();
    emitter(_homeState);
  }

  void _count(
    HomeCountEvent event,
    Emitter<HomeState> emitter,
  ) async {
    _homeState = _homeState.copyWith(number: _homeState.number + 1);
    emitter(_homeState);
  }
}
