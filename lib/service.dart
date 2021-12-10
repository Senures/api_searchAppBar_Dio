import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http_3/model.dart';

class Service {
  Dio dio = Dio();

  Future<Model?> apiyiGetir() async {
    String url = "http://imsea.herokuapp.com/api/1?q=car";
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return Model.fromJson(jsonDecode(response.data));
    }
  }

  Future<Model?> aramaButonFonk(String kelime) async {
    String url = "http://imsea.herokuapp.com/api/1?q=$kelime";
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return Model.fromJson(response.data);
    }
  }
}
