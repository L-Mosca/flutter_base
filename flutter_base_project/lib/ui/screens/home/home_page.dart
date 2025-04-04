import 'package:flutter/material.dart';
import 'package:flutter_base_project/router/app_router.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_bloc.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_event.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_state.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/header/home_header.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/home_loading.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<HomeBloc, HomeEvent, HomeState>(
      listener: _onPageChanged,
      builder: _pageContent,
    );
  }

  Widget _pageContent(BuildContext context, HomeState state) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HomeHeader(onSettingsPressed: () => _onSettingsPressed(context)),
            Expanded(
              child: Stack(
                children: [
                  ProductList(
                    list: state.products,
                    onProductPressed: (id) => _onProductPressed(context, id),
                  ),
                  if (state.showLoading) HomeLoading(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(BuildContext context, HomeState state) {
    _logoutSuccess(context, state);
  }

  void _onSettingsPressed(BuildContext context) =>
      Navigator.pushNamed(context, AppRouter.settingsRoute);

  void _onProductPressed(BuildContext context, int productId) {
    Navigator.pushNamed(
      context,
      AppRouter.productDetailRoute,
      arguments: {AppRouter.productDetailIdArgument: productId},
    );
  }

  void _logoutSuccess(BuildContext context, HomeState state) {
    if (state.listener == HomeListener.logoutSuccess) {
      Navigator.popAndPushNamed(context, AppRouter.loginRoute);
      context.read<HomeBloc>().add(HomeResetListenerEvent());
    }
  }
}
