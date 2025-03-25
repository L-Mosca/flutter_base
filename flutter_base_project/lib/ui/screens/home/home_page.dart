import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_bloc.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_event.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_state.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';

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
    return Scaffold(
      body: SafeArea(
        child: ProductList(list: state.products),
      ),
    );
  }

  void _onPageChanged(BuildContext context, HomeState state) {}
}
