import 'dart:async';

import 'package:demo/src/app_config.dart';
import 'package:demo/src/blocs/home/home_cubit.dart';
import 'package:demo/src/models/model.dart';
import 'package:demo/src/repositories/config/config_repository.dart';
import 'package:flutter/material.dart';

import 'app_state.dart';
import 'blocs/base/cubit.dart';

class AppCubit extends BaseCubit<AppState> {
  AppCubit(this.configRepo, HomeCubit homeCubit) : super(const AppState()) {
    configRepo.addConnectionChangeListener((connected) {
      emit(state.copyWith(hasInternetConnection: connected));
    });
  }

  final ConfigRepository configRepo;

  Future<void> onInit() async {
    try {
      if (state.isInitialized) return;
      emit(const AppState(isLoading: true, isInitialized: false));
      //Check app info & device info
      final appInfo = await AppInfo.load();
      final deviceInfo = await DeviceInfo.load();
      //Load saved locale
      final locale = await configRepo.loadLocale();
      //Check inernet connection
      final connected = await configRepo.hasInternetConnection();

      emit(
        state.copyWith(
          isLoading: false,
          appInfo: appInfo,
          deviceInfo: deviceInfo,
          locale: locale,
          hasInternetConnection: connected,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  void onInitialized() async {
    if (state.isInitialized) return;
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isInitialized: true));
  }

  void onDisableShowUpdateVersion() {
    emit(state.copyWith(enableShowUpdateVersion: false));
    Timer(
      AppConfig.enableShowUpdateVersionPeriod,
      () => emit(state.copyWith(enableShowUpdateVersion: true)),
    );
  }

  void onChangeLocale(Locale locale) async {
    emit(state.copyWith(locale: locale));
    await configRepo.saveLocale(locale);
  }
}
