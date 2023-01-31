import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(S initialState) : super(initialState);

  void handleError(String errorMessage);

  Future<void> makeErrorHandledCall(AsyncCallback callback) async {
    try {
      await callback();
    } catch (e) {
      log(e.toString(), name: 'Base Service Error', error: e);
      handleError(e.toString());
    }
  }
}
