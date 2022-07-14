import 'package:data/data_module.dart';

class ApiResponse {
  Data? data;

  ApiResponse({this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}
