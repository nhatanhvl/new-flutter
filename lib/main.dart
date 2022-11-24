import 'dart:async';

import 'package:demo/src/app.dart';
import 'package:demo/src/app_cubit.dart';
import 'package:demo/src/blocs/home/home_cubit.dart';
import 'package:demo/src/repositories/config/config_repository.dart';
import 'package:demo/src/shares/widgets/widgets.dart';
import 'package:demo/src/storages/storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeComponents();
    runApp(const DemoApp());
  }, (error, stack) {});
}

Future<void> initializeComponents() async {
  final localStorage = SecuredStorage();
  final topOverlay = TopOverlayNotifier();
  final configRepo = ConfigRepositoryImpl(localStorage);
  final homeRepo = HomeCubit();

  GetIt.instance
    ..registerLazySingleton<TopOverlayNotifier>(() => topOverlay)
    ..registerLazySingleton<LocalStorage>(() => localStorage)
    ..registerLazySingleton<ConfigRepository>(() => configRepo)
    ..registerLazySingleton(() => homeRepo)
    ..registerLazySingleton(() => AppCubit(
          GetIt.instance.get<ConfigRepository>(),
          GetIt.instance.get<HomeCubit>(),
        ));
}
