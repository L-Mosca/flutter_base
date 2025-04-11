import 'package:flutter/material.dart';
import 'package:flutter_base_project/router/app_router.dart';
import 'package:flutter_base_project/ui/screens/home/home_cart/bloc/home_cart_bloc.dart';
import 'package:flutter_base_project/ui/screens/home/home_cart/bloc/home_cart_event.dart';
import 'package:flutter_base_project/ui/screens/home/home_cart/bloc/home_cart_state.dart';
import 'package:flutter_base_project/ui/screens/home/home_cart/widgets/home_cart_card.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCartContainer extends StatefulWidget {
  const HomeCartContainer({super.key});

  @override
  State<HomeCartContainer> createState() => _HomeCartContainerState();
}

class _HomeCartContainerState extends State<HomeCartContainer> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) AppRouter.routeObserver.subscribe(this, route);
  }

  @override
  void dispose() {
    AppRouter.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    context.read<HomeCartBloc>().add(HomeCartFetchCartEvent());
  }

  @override
  void didPopNext() {
    context.read<HomeCartBloc>().add(HomeCartFetchCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage<HomeCartBloc, HomeCartEvent, HomeCartState>(
      listener: _onChange,
      builder: _pageContent,
    );
  }

  void _onChange(BuildContext context, HomeCartState state) {}

  Widget _pageContent(BuildContext context, HomeCartState state) {
    if (state.cart == null) return const SizedBox();
    if (state.cart?.products.isEmpty == true) return const SizedBox();

    return Align(
      alignment: Alignment.bottomCenter,
      child: HomeCartCard(state: state, onSeeCartPressed: _onSeeCartPressed),
    );
  }

  void _onSeeCartPressed() => Navigator.pushNamed(context, AppRouter.cartRoute);
}
