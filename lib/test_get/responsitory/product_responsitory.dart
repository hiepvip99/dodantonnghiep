import 'package:getx_1/test_get/services/http_service.dart';

import 'package:getx_1/test_get/constant.dart';
import 'package:getx_1/test_get/model/product.dart';

class ProductResponsitory {
  final HttpService _requestHttp = HttpService();

  static const allProduct = '/productAll';
  static const product = '/product';

  Future<Product> getProduct(String id) async {
    final response = await _requestHttp.get('$domainName$product/$id');
    return Product.fromJson(response);
  }

  Future<List<Product>> getProductFromKeyword(String keyword) async {
    var response = await _requestHttp.get('$domainName$product/$keyword');
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/ProductAll');
    // print(response);
    if (response == null || (response as List).isEmpty) {
      return await getProductAll();
    }
    var productList = (response).map((e) => Product.fromJson(e)).toList();
    // print(productList[0].username);
    return productList;
  }

  Future<List<Product>> getProductAll() async {
    var response = await _requestHttp.getAll(domainName + allProduct);
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/ProductAll');
    // print(response);
    var productList =
        (response as List).map((e) => Product.fromJson(e)).toList();
    // print(productList[0].username);
    return productList;
  }

  Future<dynamic> addProduct(Product data) async {
    final response =
        await _requestHttp.post(domainName + product, data.toJson());
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }

    return true;
  }

  Future<dynamic> updateProduct(Product data) async {
    final response =
        await _requestHttp.put(domainName + product, data.toJson());
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

  Future<dynamic> deleteProduct(Product data) async {
    final response =
        await _requestHttp.delete(domainName + product, data.toJson());
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
