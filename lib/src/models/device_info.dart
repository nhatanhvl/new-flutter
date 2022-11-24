part of 'model.dart';

class DeviceInfo extends Equatable {
  final String? id;
  final String? token;
  final String? deviceName;
  final String? brand;
  final String? osName;
  final String? osVersion;

  const DeviceInfo({
    this.id,
    this.token,
    this.deviceName,
    this.brand,
    this.osName,
    this.osVersion,
  });

  @override
  List<Object?> get props => [
        id,
        token,
        deviceName,
        brand,
        osName,
        osVersion,
      ];

  static Future<DeviceInfo> load() async {
    DeviceInfo deviceInfo = const DeviceInfo();
    try {
      final plugin = DeviceInfoPlugin();

      if (defaultTargetPlatform == TargetPlatform.iOS) {
        IosDeviceInfo info = await plugin.iosInfo;
        deviceInfo = DeviceInfo(
          id: info.identifierForVendor,
          deviceName: info.name,
          brand: info.model,
          osName: 'ios',
          osVersion: info.systemVersion,
        );
      }
      if (defaultTargetPlatform == TargetPlatform.android) {
        AndroidDeviceInfo info = await plugin.androidInfo;
        deviceInfo = DeviceInfo(
          id: info.id,
          deviceName: info.model,
          brand: info.brand,
          osName: 'android',
          osVersion: info.version.release,
        );
      }
    } catch (_) {
      deviceInfo = const DeviceInfo();
    }
    return deviceInfo;
  }
}
