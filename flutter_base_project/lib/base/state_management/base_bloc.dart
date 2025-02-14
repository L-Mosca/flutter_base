import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ExceptionHandler = void Function(Exception exception);

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  S stateInstance;

  BaseBloc(this.stateInstance) : super(stateInstance);

  Future<void> defaultLaunch({
    ExceptionHandler? exceptionHandler,
    Future<void> Function()? function,
  }) async {
    if (function == null) return;
    try {
      await function();
    } catch (e, stackTrace) {
      if (kDebugMode) print(stackTrace);

      if (exceptionHandler != null) {
        exceptionHandler(Exception(e.toString()));
      } else {
        throw (Exception(e.toString()));
      }
    }
  }
}
