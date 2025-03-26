import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/di/injector.dart';
import 'package:flutter_base_project/domain/repositories/product_repository.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_bloc.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_event.dart';
import 'package:flutter_base_project/ui/screens/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRouter {
  const HomeRouter._();

  static Widget get page => BlocProvider(
        create: (_) =>
            HomeBloc(productRepository: injector.get<ProductRepository>())
              ..add(HomeInitEvent()),
        child: HomePage(),
      );
}
