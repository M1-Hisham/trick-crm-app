import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/trick_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/widgets/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const TrickApp());
}
