import 'package:demo/src/blocs/base/cubit.dart';
import 'package:demo/src/models/model.dart';
import 'package:flutter/material.dart';

class AppState extends BaseState {
  const AppState({
    super.isLoading,
    super.error,
    this.isInitialized = false,
    this.locale,
    this.appInfo,
    this.deviceInfo,
    this.enableShowUpdateVersion = true,
    this.hasInternetConnection = false,
  });

  final bool isInitialized;
  final Locale? locale;
  final AppInfo? appInfo;
  final DeviceInfo? deviceInfo;
  final bool enableShowUpdateVersion;
  final bool hasInternetConnection;

  @override
  AppState copyWith({
    bool? isLoading,
    dynamic error,
    bool? isInitialized,
    Locale? locale,
    AppInfo? appInfo,
    AppInfo? appStoreInfo,
    DeviceInfo? deviceInfo,
    bool? enableShowUpdateVersion,
    bool? hasInternetConnection,
  }) =>
      AppState(
        isLoading: isLoading ?? this.isLoading,
        isInitialized: isInitialized ?? this.isInitialized,
        error: error,
        locale: locale ?? this.locale,
        appInfo: appInfo ?? this.appInfo,
        deviceInfo: deviceInfo ?? this.deviceInfo,
        enableShowUpdateVersion:
            enableShowUpdateVersion ?? this.enableShowUpdateVersion,
        hasInternetConnection:
            hasInternetConnection ?? this.hasInternetConnection,
      );

  @override
  List<Object?> get props => [
        isLoading,
        isInitialized,
        locale,
        appInfo,
        deviceInfo,
        error,
        enableShowUpdateVersion,
        hasInternetConnection,
      ];
}
