import 'package:getx_1/test_get/services/http_service.dart';

import 'package:getx_1/test_get/constant.dart';
import 'package:getx_1/test_get/model/account.dart';

class AccountResponsitory {
  final HttpService _requestHttp = HttpService();

  static const allAccount = '/accountAll';
  static const account = '/account';

  Future<Account> getAccount(String id) async {
    final response = await _requestHttp.get('$domainName$account/$id');
    return Account.fromJson(response);
  }

  Future<List<Account>> getAccountFromKeyword(String keyword) async {
    var response = await _requestHttp.get('$domainName$account/$keyword');
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/AccountAll');
    // print(response);
    if (response == null || (response as List).isEmpty) {
      return await getAccountAll();
    }
    var accountList = (response).map((e) => Account.fromJson(e)).toList();
    // print(accountList[0].username);
    return accountList;
  }

  Future<List<Account>> getAccountAll() async {
    var response = await _requestHttp.getAll(domainName + allAccount);
    // final response =
    //     await _requestHttp.get('http://172.168.10.219:3000/AccountAll');
    // print(response);
    var accountList =
        (response as List).map((e) => Account.fromJson(e)).toList();
    // print(accountList[0].username);
    return accountList;
  }

  Future<dynamic> addAccount(Account data) async {
    final response =
        await _requestHttp.post(domainName + account, data.toJson());
    if (response == null) {
      return 'Không thể gửi yêu cầu http vui lòng kiểm tra sever hoặc kết nối của bạn';
    }
    var value = Map<String, dynamic>.from(response as Map);
    if (value['error'] == true) {
      return value['message'];
    }

    return true;
  }

  Future<dynamic> updateAccount(Account data) async {
    final response =
        await _requestHttp.put(domainName + account, data.toJson());
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

  Future<dynamic> deleteAccount(Account data) async {
    final response =
        await _requestHttp.delete(domainName + account, data.toJson());
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
