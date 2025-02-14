import 'package:flutter_base_project/ui/screens/splash/bloc/splash_event.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashState _splashState = const SplashState();

  SplashBloc() : super(const SplashState()) {
    on<SplashInitEvent>(_init);
  }

  void _init(
    SplashInitEvent event,
    Emitter<SplashState> emitter,
  ) async {
    _splashState = _splashState.copyWith();
    emitter(_splashState);
  }
}
