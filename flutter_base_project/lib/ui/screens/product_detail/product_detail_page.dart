import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list/product/product_star_rating.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_bloc.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_event.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_state.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/app_bar/product_detail_app_bar.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail/product_detail_description.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail/product_detail_image.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail/product_detail_price.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail/product_detail_title.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail_add_cart_button.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

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
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            ProductDetailImage(imageUrl: state.product?.image),
            ProductDetailTitle(title: state.product?.title),
            ProductDetailDescription(description: state.product?.description),
            ProductStarRating(rate: state.product?.rating?.rate),
            ProductDetailPrice(price: state.product?.price),
            Spacer(),
            ProductDetailAddCartButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }

  void _onChange(BuildContext context, ProductDetailState state) {}

  PreferredSizeWidget _buildAppbar(String? title, BuildContext context) {
    return ProductDetailAppBar(
      title: title,
      onBackPressed: () => Navigator.pop(context),
    );
  }
}
