import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/di/injector.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_bloc.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_event.dart';
import 'package:flutter_base_project/ui/screens/splash/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashRouter {
  const SplashRouter();

  static Widget get page => BlocProvider(
        create: (_) =>
            SplashBloc(userRepository: injector.get<UserRepository>())
              ..add(SplashInitEvent()),
        child: SplashPage(),
      );
}
