import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseStatelessPage<B extends Bloc<E, S>, E, S> extends StatelessWidget {
  const BaseStatelessPage({super.key});

  /// Retorne os widgets da tela nesta função.
  ///
  /// Esta função está encapsulada dentro de um BlocBuilder e fornece o contexto e o estado
  /// passado como tipo genérico para esta classe
  Widget pageContent(BuildContext context, S state);

  /// Está função esta encapisulada dentro do BlocListener.
  /// Ela é chamada sempre que o BLoC emite um novo estado.
  ///
  /// Use este espaço preferencialmente como um gatilho para eventos como: bottom sheets, dialogs, snackBars, navegação...
  void onPageChanged(BuildContext context, S state);

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listener: onPageChanged,
      child: BlocBuilder<B, S>(builder: pageContent),
    );
  }
}
