import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/controller/account_controller.dart';
import 'package:getx_1/test_get/model/account.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getx_1/test_get/components/input_text_custom.dart';

class AddEditAccount extends StatelessWidget {
  AddEditAccount({super.key, required this.account, required this.controller});

  final Account? account;
  final _formKey = GlobalKey<FormBuilderState>();
  final AccountController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: false);
        return false;
      },
      child: GestureDetector(
        onTap: () async {
          Get.back(result: false);
        },
        child: FractionallySizedBox(
          heightFactor: 0.75,
          widthFactor: 0.75,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FormBuilder(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            account == null
                                ? const Text('Thêm Tài Khoản')
                                : const Text('Sửa Tài Khoản'),
                            const SizedBox(
                              height: 10,
                            ),
                            account == null
                                ? const SizedBox()
                                : Text('ID: ${account!.id}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextCustom(
                                      enabled: account != null ? false : true,
                                      label: 'Tài Khoản',
                                      textdata: account != null
                                          ? account!.username
                                          : null,
                                      name: 'username'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'password',
                                    label: 'Mật khẩu',
                                    textdata: account != null
                                        ? account!.password
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextCustom(
                                      enabled: true,
                                      name: 'decentralization',
                                      textdata: account != null
                                          ? account!.decentralization!
                                              .toString()
                                          : null,
                                      label: 'Phân quyền'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'status',
                                    label: 'Trạng thái',
                                    textdata: account != null
                                        ? account!.status!.toString()
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    Get.closeAllSnackbars();
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState?.save();
                                      final formData =
                                          _formKey.currentState?.value;
                                      // print(_formKey.currentState?.value.toString());
                                      Account a = Account.fromJson(formData!);

                                      // ignore: prefer_typing_uninitialized_variables
                                      var response;
                                      if (account == null) {
                                        response =
                                            await controller.saveAccountAdd(a);
                                      } else {
                                        a.id = account!.id;
                                        response =
                                            await controller.saveAccountEdit(a);
                                        controller.updateAccountElement(a);
                                      }

                                      if (response is bool) {
                                        if (account == null) {
                                          Get.back(result: true);
                                          Get.snackbar(
                                            snackPosition: SnackPosition.BOTTOM,
                                            titleText: Row(
                                              children: const [
                                                Text(
                                                  'Đã thêm tài khoản thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            colorText: Colors.white,
                                            'Đã thêm tài khoản thành công',
                                            'Ui xời không có lỗi gì cả',
                                            backgroundColor: Colors.blueAccent
                                                .withOpacity(0.5),
                                          );
                                        } else {
                                          Get.back(result: false);
                                          Get.snackbar(
                                            titleText: Row(
                                              children: const [
                                                Text(
                                                  'Đã sửa tài khoản thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            snackPosition: SnackPosition.BOTTOM,
                                            'Đã sửa tài khoản thành công',
                                            'Ui xời không có lỗi gì cả',
                                            colorText: Colors.white,
                                            backgroundColor: Colors.blueAccent
                                                .withOpacity(0.5),
                                          );
                                        }
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
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          backgroundColor: Colors.blueAccent
                                              .withOpacity(0.5),
                                        );
                                      }
                                    }
                                  },
                                  child: const Text('Lưu'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
