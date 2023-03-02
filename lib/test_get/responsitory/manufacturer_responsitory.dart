import 'package:getx_1/test_get/constant.dart';
import 'package:getx_1/test_get/model/manufacturer.dart';
import 'package:getx_1/test_get/services/http_service.dart';

class ManufacturerResponsitory {
  final HttpService _requestHttp = HttpService();

  static const allManufacturer = '/manufacturerAll';
  static const manufacturer = '/manufacturer';

  Future<Manufacturer> getManufacturer(String id) async {
    final response = await _requestHttp.get('$domainName$manufacturer/$id');
    return Manufacturer.fromJson(response);
  }

  Future<List<Manufacturer>> getManufacturerFromKeyword(String keyword) async {
    var response = await _requestHttp.get('$domainName$manufacturer/$keyword');
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/ManufacturerAll');
    // print(response);
    if (response == null || (response as List).isEmpty) {
      return await getManufacturerAll();
    }
    var manufacturerList =
        (response).map((e) => Manufacturer.fromJson(e)).toList();
    // print(ManufacturerList[0].username);
    return manufacturerList;
  }

  Future<List<Manufacturer>> getManufacturerAll() async {
    var response = await _requestHttp.getAll(domainName + allManufacturer);
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/ManufacturerAll');
    // print(response);
    var manufacturerList =
        (response as List).map((e) => Manufacturer.fromJson(e)).toList();
    // print(ManufacturerList[0].username);
    return manufacturerList;
  }

  Future<dynamic> addManufacturer(Manufacturer data) async {
    final response =
        await _requestHttp.post(domainName + manufacturer, data.toJson());
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }

    return true;
  }

  Future<dynamic> updateManufacturer(Manufacturer data) async {
    final response =
        await _requestHttp.put(domainName + manufacturer, data.toJson());
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

  Future<dynamic> deleteManufacturer(Manufacturer data) async {
    final response =
        await _requestHttp.delete(domainName + manufacturer, data.toJson());
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
