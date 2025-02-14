import 'package:flutter_base_project/base/state_management/copyable.dart';

enum HomeStatus { initial }

class HomeState implements Copyable<HomeState> {
  const HomeState({
    this.status = HomeStatus.initial,
    this.number = 1,
  });

  final HomeStatus status;
  final int number;

  @override
  HomeState copy() {
    return HomeState(
      status: status,
      number: number,
    );
  }

  @override
  HomeState copyWith({HomeStatus? status, int? number}) {
    return HomeState(
      status: status ?? this.status,
      number: number ?? this.number,
    );
  }
}
