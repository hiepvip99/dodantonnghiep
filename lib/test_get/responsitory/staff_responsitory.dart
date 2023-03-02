import 'package:getx_1/test_get/services/http_service.dart';

import 'package:getx_1/test_get/constant.dart';
import 'package:getx_1/test_get/model/staff.dart';

class StaffResponsitory {
  final HttpService _requestHttp = HttpService();

  static const allStaff = '/staffAll';
  static const staff = '/staff';

  Future<Staff> getStaff(String id) async {
    final response = await _requestHttp.get('$domainName$staff/$id');
    return Staff.fromJson(response);
  }

  Future<List<Staff>> getStaffFromKeyword(String keyword) async {
    var response = await _requestHttp.get('$domainName$staff/$keyword');
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/StaffAll');
    // print(response);
    if (response == null || (response as List).isEmpty) {
      return await getStaffAll();
    }
    var staffList = (response).map((e) => Staff.fromJson(e)).toList();
    // print(staffList[0].username);
    return staffList;
  }

  Future<List<Staff>> getStaffAll() async {
    var response = await _requestHttp.getAll(domainName + allStaff);
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/StaffAll');
    // print(response);
    var staffList = (response as List).map((e) => Staff.fromJson(e)).toList();
    // print(staffList[0].username);
    return staffList;
  }

  Future<dynamic> addStaff(Staff data) async {
    final response = await _requestHttp.post(domainName + staff, data.toJson());
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }

    return true;
  }

  Future<dynamic> updateStaff(Staff data) async {
    final response = await _requestHttp.put(domainName + staff, data.toJson());
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

  Future<dynamic> deleteStaff(Staff data) async {
    final response =
        await _requestHttp.delete(domainName + staff, data.toJson());
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
