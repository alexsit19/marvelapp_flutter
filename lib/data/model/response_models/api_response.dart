import 'package:marvelapp_flutter/data/model/response_models/data.dart';

class ApiResponse {
  Data? data;

  ApiResponse({this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
