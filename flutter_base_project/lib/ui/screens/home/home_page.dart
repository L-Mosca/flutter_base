import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_bloc.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_event.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_state.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/home_loading.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

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
        body: Container(
          color: AppColors.white,
          child: Stack(
            children: [
              ProductList(list: state.products),
              if (state.showLoading) HomeLoading(),
            ],
          ),
        ),
      ),
    );
  }

  void _onPageChanged(BuildContext context, HomeState state) {}
}
