import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HttpService {
  final Dio dio = Dio();

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      }
      if (response.statusCode == 500) {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> getAll(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        // print(response.data.toString());
        return response.data;
      }
    } catch (e) {
      print(e.toString());
      return [];

      // print(e);
    }
  }

  Future<dynamic> post(String url, data) async {
    try {
      print(url);
      print(data);
      final response = await dio.post(url, data: data);

      print('ok res $response');
      if (response.statusCode == 200) {
        return response.data;
      }
      // return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> put(String url, data) async {
    try {
      final response = await dio.put(url, data: data);
      if (response.statusCode == 200) {
        return response.data;
      }
      // return false;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> delete(String url, data) async {
    try {
      print('delete');
      print(url);
      print(data);
      final response = await dio.delete(url, data: data);
      if (response.statusCode == 200) {
        return response.data;
      }
      print('complete');
      return false;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
