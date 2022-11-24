part of 'model.dart';

class AppInfo extends Equatable {
  final String? packageName;
  final Version? version;
  final Version? forceVersion;
  final String? storeUrl;
  final String? releaseNotes;

  const AppInfo({
    this.packageName,
    this.version,
    this.forceVersion,
    this.storeUrl,
    this.releaseNotes,
  });

  @override
  List<Object?> get props => [
        packageName,
        version,
        forceVersion,
        storeUrl,
        releaseNotes,
      ];

  factory AppInfo.fromJson(Map<String, dynamic> map) {
    return AppInfo(
      packageName: map['packageName'],
      version: Version.parse(map['version']),
      forceVersion: Version.parse(map['forceVersion']),
      storeUrl: Platform.isAndroid ? map['googlePlayUrl'] : map['appStoreUrl'],
      releaseNotes: map['releaseNotes'],
    );
  }

  static Future<AppInfo> load() {
    return PackageInfo.fromPlatform().then(
      (info) => AppInfo(
        packageName: info.packageName,
        version: Version.parse('${info.version}+${info.buildNumber}'),
      ),
      onError: (_) => const AppInfo(),
    );
  }
}
