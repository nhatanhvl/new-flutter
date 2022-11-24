class AppConfig {
  AppConfig._();
  static const featureFlagsFetchInterval = Duration(minutes: 10);
  static const enableShowUpdateVersionPeriod = Duration(minutes: 20);

  static const String notificationChannelId = 'high_importance_channel';
  static const String notificationChannelName = 'High Importance Notifications';
}
