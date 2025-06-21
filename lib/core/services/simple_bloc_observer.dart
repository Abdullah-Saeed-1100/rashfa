import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('onCreate -- bloc: $bloc');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log('onClose -- bloc: $bloc');
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("${bloc.runtimeType} $change");
    super.onChange(bloc, change);
  }
}
