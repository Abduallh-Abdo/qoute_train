import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_train/app.dart';
import 'package:qoute_train/bloc_observer.dart';
import 'package:qoute_train/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(const QouteApp());
}
 