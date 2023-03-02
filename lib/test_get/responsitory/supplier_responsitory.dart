import 'package:getx_1/test_get/constant.dart';
import 'package:getx_1/test_get/model/supplier.dart';
import 'package:getx_1/test_get/services/http_service.dart';

class SupplierResponsitory {
  final HttpService _requestHttp = HttpService();

  static const allSupplier = '/supplierAll';
  static const supplier = '/supplier';

  Future<Supplier> getSupplier(String id) async {
    final response = await _requestHttp.get('$domainName$supplier/$id');
    return Supplier.fromJson(response);
  }

  Future<List<Supplier>> getSupplierFromKeyword(String keyword) async {
    var response = await _requestHttp.get('$domainName$supplier/$keyword');
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/SupplierAll');
    // print(response);
    if (response == null || (response as List).isEmpty) {
      return await getSupplierAll();
    }
    var supplierList = (response).map((e) => Supplier.fromJson(e)).toList();
    // print(SupplierList[0].username);
    return supplierList;
  }

  Future<List<Supplier>> getSupplierAll() async {
    var response = await _requestHttp.getAll(domainName + allSupplier);
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/SupplierAll');
    // print(response);
    var supplierList =
        (response as List).map((e) => Supplier.fromJson(e)).toList();
    // print(SupplierList[0].username);
    return supplierList;
  }

  Future<dynamic> addSupplier(Supplier data) async {
    final response =
        await _requestHttp.post(domainName + supplier, data.toJson());
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }

    return true;
  }

  Future<dynamic> updateSupplier(Supplier data) async {
    final response =
        await _requestHttp.put(domainName + supplier, data.toJson());
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

  Future<dynamic> deleteSupplier(Supplier data) async {
    final response =
        await _requestHttp.delete(domainName + supplier, data.toJson());
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
