import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo/src/storages/storage.dart';
import 'package:flutter/material.dart';

part 'config_repository_imp.dart';

abstract class ConfigRepository {
  Future<void> saveLocale(Locale locale);
  Future<Locale?> loadLocale();
  Future<bool> hasInternetConnection();
  void addConfigChangeListener(VoidCallback callback);
  void addConnectionChangeListener(ValueChanged<bool> callback);
}

class FeatureFlags {
  FeatureFlags._();
  static const String appInfo = 'app_info';
}
