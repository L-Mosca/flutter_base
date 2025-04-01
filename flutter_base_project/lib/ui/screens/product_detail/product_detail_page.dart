import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_bloc.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_event.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_state.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<ProductDetailBloc, ProductDetailEvent, ProductDetailState>(
      listener: _onChange,
      builder: _pageContent,
    );
  }

  Widget _pageContent(BuildContext context, ProductDetailState state) {
    return SafeArea(child: Scaffold());
  }

  void _onChange(BuildContext context, ProductDetailState state) {}
}
