import 'package:flutter_base_project/base/state_management/copyable.dart';

enum SplashStatus { initial }

class SplashState implements Copyable<SplashState> {
  const SplashState({this.status = SplashStatus.initial});

  final SplashStatus status;

  @override
  SplashState copy() {
    return SplashState(status: status);
  }

  @override
  SplashState copyWith({SplashStatus? status}) {
    return SplashState(status: status ?? this.status);
  }
}