import 'package:getx_1/test_get/model/customer.dart';
import 'package:getx_1/test_get/services/http_service.dart';
import 'package:getx_1/test_get/constant.dart';

class CustomerResponsitory {
  final HttpService _requestHttp = HttpService();

  static const allCustomer = '/customerAll';
  static const customer = '/customer';

  Future<Customer> getCustomer(String id) async {
    final response = await _requestHttp.get('$domainName$customer/$id');
    return Customer.fromJson(response);
  }

  Future<List<Customer>> getCustomerFromKeyword(String keyword) async {
    var response = await _requestHttp.get('$domainName$customer/$keyword');
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/CustomerAll');
    // print(response);
    if (response == null || (response as List).isEmpty) {
      return await getCustomerAll();
    }
    var customerList = (response).map((e) => Customer.fromJson(e)).toList();
    // print(customerList[0].username);
    return customerList;
  }

  Future<List<Customer>> getCustomerAll() async {
    var response = await _requestHttp.getAll(domainName + allCustomer);
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/CustomerAll');
    // print(response);
    var customerList =
        (response as List).map((e) => Customer.fromJson(e)).toList();
    // print(customerList[0].username);
    return customerList;
  }

  Future<dynamic> addCustomer(Customer data) async {
    final response =
        await _requestHttp.post(domainName + customer, data.toJson());
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }

    return true;
  }

  Future<dynamic> updateCustomer(Customer data) async {
    // print('post len ' + data.toJson().toString());
    final response =
        await _requestHttp.put(domainName + customer, data.toJson());
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

  Future<dynamic> deleteCustomer(Customer data) async {
    final response =
        await _requestHttp.delete(domainName + customer, data.toJson());
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
