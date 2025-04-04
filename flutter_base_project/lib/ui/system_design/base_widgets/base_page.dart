import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// BasePage widget. Receive a Bloc with Event and State generic data, use as page base pattern.
///
/// Widget tree:
///
/// ```dart
/// BlocListener<Bloc, State>(
///   listener: void Function(BuildContext, S),
///   child: BlocBuilder<Bloc, State>(
///     builder: Widget Function(BuildContext, S),
///   ),
/// )
/// ```
///
/// [listener] Wrapped by a BlocListener[<BuildContext, State>]. Use to read page state changes
///
/// [builder] Wrapped by a BlocBuilder[<BuildContext, State>]. Use to return a widget reading page state changes
///
class BasePage<B extends Bloc<E, S>, E, S> extends StatelessWidget {
  const BasePage({
    super.key,
    required this.listener,
    required this.builder,
  });

  final void Function(BuildContext, S) listener;
  final Widget Function(BuildContext, S) builder;

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listener: listener,
      child: BlocBuilder<B, S>(builder: builder),
    );
  }
}
