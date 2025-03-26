import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/domain/repositories/product_repository.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_event.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final ProductRepository productRepository;

  HomeBloc({required this.productRepository}) : super(const HomeState()) {
    on<HomeInitEvent>(_init);
    on<HomeFetchProductsEvent>(_fetchProducts);
    on<HomeResetListenerEvent>(_resetListener);
  }

  void _init(
    HomeInitEvent event,
    Emitter<HomeState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final products = await productRepository.getAllProducts();
        if (products.isNotEmpty) emitter(state.loadProducts(products));
      },
      loadingStatus: (isLoading) => emitter(state.isLoading(isLoading)),
      exceptionHandler: (exception) {},
    );
  }

  void _fetchProducts(
    HomeFetchProductsEvent event,
    Emitter<HomeState> emitter,
  ) async {}

  void _resetListener(
    HomeResetListenerEvent event,
    Emitter<HomeState> emitter,
  ) async {}
}
