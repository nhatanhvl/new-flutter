part of 'config_repository.dart';

class ConfigRepositoryImpl extends ConfigRepository {
  ConfigRepositoryImpl(this.localStorage) : connectivity = Connectivity();

  static const _appLocaleKey = 'appLocaleKey';

  final Connectivity connectivity;
  final LocalStorage localStorage;

  ValueChanged<bool>? connectionChangeListener;
  VoidCallback? configChangeListener;

  @override
  void addConfigChangeListener(VoidCallback callback) {
    configChangeListener = callback;
  }

  @override
  void addConnectionChangeListener(ValueChanged<bool> callback) {
    connectionChangeListener = callback;
  }

  @override
  Future<Locale?> loadLocale() async {
    final sLocale = await localStorage.read(_appLocaleKey);
    if (sLocale == null || sLocale.isEmpty) return null;
    return Locale(sLocale);
  }

  @override
  Future<void> saveLocale(Locale locale) {
    return localStorage.write(_appLocaleKey, locale.languageCode);
  }

  @override
  Future<bool> hasInternetConnection() async {
    try {
      final status = await connectivity.checkConnectivity();
      return _isConnected(status);
    } catch (_) {
      return false;
    }
  }

  bool _isConnected(ConnectivityResult result) {
    return (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile);
  }
}
