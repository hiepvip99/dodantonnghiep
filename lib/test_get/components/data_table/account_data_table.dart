import 'package:flutter/material.dart';
import 'package:getx_1/test_get/model/account.dart';
import 'package:getx_1/test_get/controller/account_controller.dart';
import 'package:getx_1/test_get/components/custom_data_cell.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/screen/admin/page/account/add_edit_account.dart';

class AccountDataTableSource extends DataTableSource {
  AccountDataTableSource({
    required this.accountList,
    required this.controller,
  });

  List<Account> accountList;
  final AccountController controller;

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(CustomDataCell(
        // width: 20,
        value: accountList[index].id,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: accountList[index].username,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: accountList[index].password,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: accountList[index].decentralization,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: accountList[index].status,
      )),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Tooltip(
            waitDuration: const Duration(seconds: 1),
            message: 'Sửa tài khoản',
            child: InkWell(
                splashColor: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  await Get.dialog(AddEditAccount(
                    controller: controller,
                    account: accountList[index],
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                )),
          ),
          Tooltip(
            waitDuration: const Duration(seconds: 1),
            message: 'Xóa tài khoản',
            child: InkWell(
                splashColor: Colors.red[100],
                onTap: () async {
                  Get.closeAllSnackbars();
                  final response =
                      await controller.deleteAccount(accountList[index]);
                  if (response is bool) {
                    controller.removeAccount(accountList[index]);
                    Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      titleText: Row(
                        children: const [
                          Text(
                            'Đã xóa tài khoản thành công',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                      colorText: Colors.white,
                      '',
                      'Ui xời không có lỗi gì cả',
                      backgroundColor: Colors.blueAccent.withOpacity(0.5),
                    );
                  } else {
                    Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      '',
                      colorText: Colors.white,
                      '',
                      titleText: Column(
                        children: [
                          const Text(
                            'Lỗi',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            '$response',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.blueAccent.withOpacity(0.5),
                    );
                  }
                },
                borderRadius: BorderRadius.circular(10),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.red,
                  ),
                )),
          )
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => accountList.length;

  @override
  int get selectedRowCount => 0;
}
