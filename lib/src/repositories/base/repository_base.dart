import 'package:demo/src/storages/storage.dart';
import 'package:demo/src/storages/storage_key.dart';
import 'package:dio/dio.dart';

class HttpBase {
  static Dio? _client;

  Future<Dio> _getInstance() async {
    final storageToken = await SecuredStorage().read(StorageKeys.token);

    _client ??= Dio();

    Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';
    if (storageToken != null) headers['Authorization'] = 'Bearer $storageToken';

    _client!.options.headers = headers;
    return _client ?? Dio();
  }

  Future<Response> get(String url) async {
    final instance = await _getInstance();
    return instance.get(url);
  }

  Future<Response> post(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.post(url, data: body);
  }

  Future<Response> put(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.put(url, data: body);
  }

  Future<Response> delete(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.delete(url);
  }
}
