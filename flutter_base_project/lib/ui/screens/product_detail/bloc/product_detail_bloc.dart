import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/domain/repositories/product_repository.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_event.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailBloc
    extends BaseBloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository productRepository;

  ProductDetailBloc({required this.productRepository})
      : super(const ProductDetailState()) {
    on<ProductDetailInitEvent>(_init);
    on<ProductDetailReloadEvent>(_reload);
  }

  void _init(
    ProductDetailInitEvent event,
    Emitter<ProductDetailState> emitter,
  ) async {
    emitter(state.copyWith(productId: event.productId));
    await _fetchProduct(emitter);
  }

  void _reload(
    ProductDetailReloadEvent event,
    Emitter<ProductDetailState> emitter,
  ) async {
    await _fetchProduct(emitter);
  }

  Future<void> _fetchProduct(Emitter<ProductDetailState> emitter) async {
    await defaultLaunch(
      function: () async {
        final product =
            await productRepository.getProductById(id: state.productId);

        if (product != null) emitter(state.loadProduct(product));
      },
      loadingStatus: (isLoading) => emitter(state.isLoading(isLoading)),
      exceptionHandler: (exception) => emitter(state.showError(true)),
    );
  }
}
