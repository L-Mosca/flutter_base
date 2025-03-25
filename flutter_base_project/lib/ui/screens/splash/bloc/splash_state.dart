import 'package:flutter_base_project/base/state_management/copyable.dart';

enum SplashListener { nothing, showLogin, showHome }

class SplashState implements Copyable<SplashState> {
  const SplashState({this.listener = SplashListener.nothing});

  final SplashListener listener;

  @override
  SplashState copy() {
    return SplashState(listener: listener);
  }

  @override
  SplashState copyWith({SplashListener? listener}) {
    return SplashState(listener: listener ?? this.listener);
  }

  SplashState get showLogin => copyWith(listener: SplashListener.showLogin);

  SplashState get showHome => copyWith(listener: SplashListener.showHome);
}
