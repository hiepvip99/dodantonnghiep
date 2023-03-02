import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getx_1/test_get/components/input_text_custom.dart';
import 'package:getx_1/test_get/controller/manufacturer_controller.dart';
import 'package:getx_1/test_get/model/manufacturer.dart';
import 'package:get/get.dart';

class AddEditManufacturer extends StatelessWidget {
  AddEditManufacturer({super.key, this.manufacturer, required this.controller});

  final Manufacturer? manufacturer;
  final _formKeyy = GlobalKey<FormBuilderState>();
  final ManufacturerController controller;

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
          heightFactor: 0.5,
          widthFactor: 0.5,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FormBuilder(
                      key: _formKeyy,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            manufacturer == null
                                ? const Text('Thêm Tài Khoản')
                                : const Text('Sửa Tài Khoản'),
                            const SizedBox(
                              height: 10,
                            ),
                            manufacturer == null
                                ? const SizedBox()
                                : Text('ID: ${manufacturer!.id}'),
                            const SizedBox(
                              height: 10,
                            ),
                            InputTextCustom(
                                enabled: true,
                                label: 'Tài Khoản',
                                textdata: manufacturer != null
                                    ? manufacturer!.name
                                    : null,
                                name: 'name'),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () async {
                                    Get.closeAllSnackbars();
                                    if (_formKeyy.currentState!.validate()) {
                                      _formKeyy.currentState?.save();
                                      final formData =
                                          _formKeyy.currentState?.value;
                                      // print(_formKey.currentState?.value.toString());
                                      Manufacturer cate =
                                          Manufacturer.fromJson(formData!);
                                      cate.name = cate.name!.capitalize;
                                      // ignore: prefer_typing_uninitialized_variables
                                      var response;
                                      if (manufacturer == null) {
                                        response = await controller
                                            .saveManufacturerAdd(cate);
                                      } else {
                                        cate.id = manufacturer!.id;
                                        response = await controller
                                            .saveManufacturerEdit(cate);
                                        controller
                                            .updateManufacturerElement(cate);
                                      }

                                      if (response is bool) {
                                        if (manufacturer == null) {
                                          Get.back(result: true);
                                          Get.snackbar(
                                            snackPosition: SnackPosition.BOTTOM,
                                            titleText: Row(
                                              children: const [
                                                Text(
                                                  'Đã thêm danh mục thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            colorText: Colors.white,
                                            '',
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
                                                  'Đã sửa danh mục thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            snackPosition: SnackPosition.BOTTOM,
                                            '',
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
