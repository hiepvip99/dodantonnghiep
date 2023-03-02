import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/controller/customer_controller.dart';
import 'package:getx_1/test_get/model/customer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getx_1/test_get/components/input_text_custom.dart';

class AddEditCustomer extends StatelessWidget {
  AddEditCustomer(
      {super.key, required this.customer, required this.controller});

  final Customer? customer;
  final _formKey = GlobalKey<FormBuilderState>();
  final CustomerController controller;

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
                            customer == null
                                ? const Text('Thêm Khách Hàng')
                                : const Text('Sửa Khách Hàng'),
                            const SizedBox(
                              height: 10,
                            ),
                            customer == null
                                ? const SizedBox()
                                : Text('ID: ${customer!.id}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextCustom(
                                      enabled: true,
                                      label: 'Tên KH',
                                      textdata: customer != null
                                          ? customer!.name
                                          : null,
                                      name: 'name'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: customer != null ? false : true,
                                    name: 'id_account',
                                    label: 'ID Tài Khoản',
                                    textdata: customer != null
                                        ? customer!.idAccount.toString()
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
                                      enabled: customer != null ? false : true,
                                      name: 'phone_number',
                                      textdata: customer != null
                                          ? customer!.phoneNumber!.toString()
                                          : null,
                                      label: 'Số điện thoại'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'date_of_birth',
                                    label: 'Ngày sinh',
                                    textdata: customer != null
                                        ? customer!.dateOfBirth!.toString()
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
                                      name: 'email',
                                      textdata: customer != null
                                          ? customer!.email!.toString()
                                          : null,
                                      label: 'Email'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'id_image',
                                    label: 'Id Hình ảnh',
                                    textdata: customer != null
                                        ? customer!.idImage!.toString()
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
                                      // print(_formKey.currentState?.value
                                      //     .toString());
                                      Customer a = Customer.fromJson(formData!);

                                      // ignore: prefer_typing_uninitialized_variables
                                      var response;
                                      if (customer == null) {
                                        // print('vao ham save');
                                        response =
                                            await controller.saveCustomerAdd(a);
                                      } else {
                                        a.id = customer!.id;
                                        response = await controller
                                            .saveCustomerEdit(a);
                                        controller.updateCustomerElement(a);
                                      }

                                      if (response is bool) {
                                        if (customer == null) {
                                          Get.back(result: true);
                                          Get.snackbar(
                                            snackPosition: SnackPosition.BOTTOM,
                                            titleText: Row(
                                              children: const [
                                                Text(
                                                  'Đã thêm khách hàng thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            colorText: Colors.white,
                                            'Đã thêm khách hàng thành công',
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
                                                  'Đã sửa khách hàng thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            snackPosition: SnackPosition.BOTTOM,
                                            'Đã sửa khách hàng thành công',
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
