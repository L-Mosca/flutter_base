import 'package:flutter/material.dart';
import 'package:flutter_base_project/router/app_router.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_bloc.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_event.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_state.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/app_bar/product_detail_app_bar.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail/product_detail.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail_error.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail_loading.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail_add_cart_button.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(state.product?.title, context),
        body: _getPageBody(context, state),
      ),
    );
  }

  Widget _getPageBody(BuildContext context, ProductDetailState state) {
    switch (state.status) {
      case ProductDetailStatus.loading:
        return ProductDetailLoading();
      case ProductDetailStatus.error:
        return ProductDetailError(
          onReloadPressed: () => _onReloadPressed(context),
        );
      default:
        return _page(context, state);
    }
  }

  Widget _page(BuildContext context, ProductDetailState state) {
    return Column(
      children: [
        ProductDetail(product: state.product),
        ProductDetailAddCartButton(
          onPressed: () => _onAddToCartPressed(context, state),
        ),
      ],
    );
  }

  void _onAddToCartPressed(BuildContext context, ProductDetailState state) {
    Navigator.pushNamed(context, AppRouter.cartRoute);
  }

  void _onChange(BuildContext context, ProductDetailState state) {}

  PreferredSizeWidget _buildAppbar(String? title, BuildContext context) {
    return ProductDetailAppBar(
      title: title,
      onBackPressed: () => Navigator.pop(context),
    );
  }

  void _onReloadPressed(BuildContext context) =>
      context.read<ProductDetailBloc>().add(ProductDetailReloadEvent());
}
