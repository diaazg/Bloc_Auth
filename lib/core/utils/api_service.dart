import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://localhost:3000/';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<int?> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post('$_baseUrl$endPoint', data: data);
    return response.statusCode;
  }
}
