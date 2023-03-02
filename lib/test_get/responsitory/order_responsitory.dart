import 'package:getx_1/test_get/model/order.dart';
import 'package:getx_1/test_get/services/http_service.dart';

import 'package:getx_1/test_get/constant.dart';

class OrderResponsitory {
  final HttpService _requestHttp = HttpService();

  static const allOrder = '/orderAll';
  static const order = '/order';

  Future<Order> getOrder(String id) async {
    final response = await _requestHttp.get('$domainName$order/$id');
    return Order.fromJson(response);
  }

  Future<List<Order>> getOrderFromKeyword(String keyword) async {
    var response = await _requestHttp.get('$domainName$order/$keyword');
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/OrderAll');
    // print(response);
    if (response == null || (response as List).isEmpty) {
      return await getOrderAll();
    }
    var orderList = (response).map((e) => Order.fromJson(e)).toList();
    // print(orderList[0].username);
    return orderList;
  }

  Future<List<Order>> getOrderAll() async {
    var response = await _requestHttp.getAll(domainName + allOrder);
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/OrderAll');
    // print(response);
    var orderList = (response as List).map((e) => Order.fromJson(e)).toList();
    // print(orderList[0].username);
    return orderList;
  }

  Future<dynamic> addOrder(Order data) async {
    final response = await _requestHttp.post(domainName + order, data.toJson());
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }

    return true;
  }

  Future<dynamic> updateOrder(Order data) async {
    final response = await _requestHttp.put(domainName + order, data.toJson());
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

  Future<dynamic> deleteOrder(Order data) async {
    final response =
        await _requestHttp.delete(domainName + order, data.toJson());
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
