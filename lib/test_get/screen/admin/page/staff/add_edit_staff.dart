import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/controller/staff_controller.dart';
import 'package:getx_1/test_get/model/staff.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getx_1/test_get/components/input_text_custom.dart';

class AddEditStaff extends StatelessWidget {
  AddEditStaff({super.key, required this.staff, required this.controller});

  final Staff? staff;
  final _formKey = GlobalKey<FormBuilderState>();
  final StaffController controller;

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
          heightFactor: 1,
          widthFactor: 1,
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
                            staff == null
                                ? const Text('Thêm Tài Khoản')
                                : const Text('Sửa Tài Khoản'),
                            const SizedBox(
                              height: 10,
                            ),
                            staff == null
                                ? const SizedBox()
                                : Text('ID: ${staff!.id}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextCustom(
                                      enabled: staff != null ? false : true,
                                      label: 'Tên nhân viên',
                                      textdata: staff != null
                                          ? staff!.name.toString()
                                          : null,
                                      name: 'name'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'address',
                                    label: 'Địa chỉ',
                                    textdata: staff != null
                                        ? staff!.address.toString()
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
                                      name: 'phone_number',
                                      textdata: staff != null
                                          ? staff!.phoneNumber!.toString()
                                          : null,
                                      label: 'Số điện thoại'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'brith_of_date',
                                    label: 'Ngày sinh',
                                    textdata: staff != null
                                        ? staff!.brithOfDate!.toString()
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
                                      name: 'id_image',
                                      textdata: staff != null
                                          ? staff!.idImage!.toString()
                                          : null,
                                      label: 'Id ảnh'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'position',
                                    label: 'Chức vụ',
                                    textdata: staff != null
                                        ? staff!.position!.toString()
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
                                    name: 'basic_salary',
                                    label: 'Lương cơ bản',
                                    textdata: staff != null
                                        ? staff!.basicSalary!.toString()
                                        : null,
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'start_work_date',
                                    label: 'Ngày vào làm',
                                    textdata: staff != null
                                        ? staff!.startWorkDate!.toString()
                                        : null,
                                  ),
                                )
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
                                      Staff a = Staff.fromJson(formData!);

                                      // ignore: prefer_typing_uninitialized_variables
                                      var response;
                                      if (staff == null) {
                                        response =
                                            await controller.saveStaffAdd(a);
                                      } else {
                                        a.id = staff!.id;
                                        response =
                                            await controller.saveStaffEdit(a);
                                        controller.updateStaffElement(a);
                                      }

                                      if (response is bool) {
                                        if (staff == null) {
                                          Get.back(result: true);
                                          Get.snackbar(
                                            snackPosition: SnackPosition.BOTTOM,
                                            titleText: Row(
                                              children: const [
                                                Text(
                                                  'Đã thêm đơn hàng thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            colorText: Colors.white,
                                            'Đã thêm đơn hàng thành công',
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
                                                  'Đã sửa đơn hàng thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            snackPosition: SnackPosition.BOTTOM,
                                            'Đã sửa đơn hàng thành công',
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
