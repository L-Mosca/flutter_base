import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_event.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  final UserRepository userRepository;

  SplashBloc({required this.userRepository}) : super(const SplashState()) {
    on<SplashInitEvent>(_init);
  }

  void _init(SplashInitEvent event, Emitter<SplashState> emitter) async {
    await defaultLaunch(
      function: () async {
        final isLogged = await userRepository.isLogged();

        await Future.delayed(const Duration(seconds: 2));

        if (isLogged) {
          emitter(state.showHome);
        } else {
          emitter(state.showLogin);
        }
      },
    );
  }
}
