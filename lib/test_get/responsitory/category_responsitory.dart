import 'package:getx_1/test_get/constant.dart';
import 'package:getx_1/test_get/model/category.dart';
import 'package:getx_1/test_get/services/http_service.dart';

class CategoryResponsitory {
  final HttpService _requestHttp = HttpService();

  static const allCategory = '/categoryAll';
  static const category = '/category';

  Future<MyCategory> getCategory(String id) async {
    final response = await _requestHttp.get('$domainName$category/$id');
    return MyCategory.fromJson(response);
  }

  Future<List<MyCategory>> getCategoryFromKeyword(String keyword) async {
    var response = await _requestHttp.get('$domainName$category/$keyword');
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/MyCategoryAll');
    // print(response);
    if (response == null || (response as List).isEmpty) {
      return await getCategoryAll();
    }
    var categoryList = (response).map((e) => MyCategory.fromJson(e)).toList();
    // print(MyCategoryList[0].username);
    return categoryList;
  }

  Future<List<MyCategory>> getCategoryAll() async {
    var response = await _requestHttp.getAll(domainName + allCategory);
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/MyCategoryAll');
    // print(response);
    var categoryList =
        (response as List).map((e) => MyCategory.fromJson(e)).toList();
    // print(MyCategoryList[0].username);
    return categoryList;
  }

  Future<dynamic> addCategory(MyCategory data) async {
    final response =
        await _requestHttp.post(domainName + category, data.toJson());
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }

    return true;
  }

  Future<dynamic> updateCategory(MyCategory data) async {
    final response =
        await _requestHttp.put(domainName + category, data.toJson());
    // print(response);
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }
    return true;
  }

  Future<dynamic> deleteCategory(MyCategory data) async {
    final response =
        await _requestHttp.delete(domainName + category, data.toJson());
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }
    return true;
  }
}
