import 'package:getx_1/test_get/model/account.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/responsitory/account_responsitory.dart';

class AccountController extends GetxController {
  var account = Account().obs;
  var accountList = <Account>[].obs;
  final AccountResponsitory _responsitory = AccountResponsitory();

  void updateId(int id) => account.value = account.value..id = id;
  void updateUsername(String username) =>
      account.value = account.value..username = username;
  void updatePassword(String password) =>
      account.value = account.value..password = password;
  void updateDecentralization(int decentralization) =>
      account.value = account.value..decentralization = decentralization;
  void updateStatus(int status) =>
      account.value = account.value..status = status;

  void addAccount(Account s) => accountList.add(s);
  void removeAccount(Account s) => accountList.remove(s);
  void updateAccount(int index, Account s) => accountList[index] = s;

  void updateAccountElement(Account s) {
    accountList[accountList.indexWhere((p0) => p0.id == s.id)] = s;
  }

  /// Get account from api
  Future<void> initAccountList() async {
    accountList.value = await _responsitory.getAccountAll();
    // print('Load data:  ' + accountList.value[0].username!);
  }

  void initAccount(Account a) {
    account.value = a;
  }

  /// add account to api nodejs
  Future<dynamic> searchAccount(String keyword) async {
    // print('${data.id} ${data.username}');
    accountList.value = await _responsitory.getAccountFromKeyword(keyword);
  }

  /// add account to api nodejs
  Future<dynamic> saveAccountAdd(Account data) async {
    // print('${data.id} ${data.username}');
    var response = await _responsitory.addAccount(data);
    await initAccountList();
    return response;
  }

  /// edit account to api nodejs
  Future<dynamic> saveAccountEdit(Account data) async {
    // print('${data.id} ${data.username}');
    var response = await _responsitory.updateAccount(data);
    // await initAccountList();
    return response;
  }

  /// delete account api nodejs
  Future<dynamic> deleteAccount(Account data) async {
    // print('${data.id} ${data.username}');
    var response = await _responsitory.deleteAccount(data);
    // removeAccount(data);
    return response;
  }

  /// Sort account

  void sortListById(bool ascending) {
    if (ascending) {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => a.id!.compareTo(b.id!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    } else {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => b.id!.compareTo(a.id!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    }
  }

  void sortListByUserName(bool ascending) {
    if (ascending) {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => a.username!.compareTo(b.username!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    } else {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => b.username!.compareTo(a.username!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    }
  }

  void sortListByPassword(bool ascending) {
    if (ascending) {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => a.password!.compareTo(b.password!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    } else {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => b.password!.compareTo(a.password!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    }
  }

  void sortListByDecentralization(bool ascending) {
    if (ascending) {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => a.decentralization!.compareTo(b.decentralization!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    } else {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => b.decentralization!.compareTo(a.decentralization!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    }
  }

  void sortListByStatus(bool ascending) {
    if (ascending) {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => a.status!.compareTo(b.status!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    } else {
      accountList.value = accountList.toList()
        ..sort(
          (a, b) => b.status!.compareTo(a.status!),
        );
      // debugPrint(accountList.value[0].id!.toString());
    }
  }
}
