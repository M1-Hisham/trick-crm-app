import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  final logger = Logger();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('🟢 Created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d('🔄 State Changed in ${bloc.runtimeType}:\n'
        'Current State: ${change.currentState}\n'
        'Next State: ${change.nextState}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.w('🛑 Closed: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('❌ Error in ${bloc.runtimeType}: $error\n$stackTrace');
  }
}
