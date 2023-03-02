import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/controller/staff_controller.dart';
import 'package:getx_1/test_get/components/data_table/staff_data_table.dart';
import 'package:getx_1/test_get/screen/admin/page/staff/add_edit_staff.dart';

class StaffManagerPage extends StatefulWidget {
  const StaffManagerPage({super.key});

  @override
  State<StaffManagerPage> createState() => _StaffManagerPageState();
}

class _StaffManagerPageState extends State<StaffManagerPage> {
  StaffController controller = StaffController();
  bool sort = true;
  int? column = 0;
  bool isLoading = true;

  final _key = GlobalKey<PaginatedDataTableState>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    await controller.initStaffList();
    isLoading = false;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void sortColumn(int columnIndex, bool ascending) {
    setState(() {
      column = columnIndex;
      sort = ascending;
    });
    switch (columnIndex) {
      case 0:
        controller.sortListById(ascending);
        break;
      case 1:
        controller.sortListByUserName(ascending);
        break;
      case 2:
        controller.sortListByIdAddress(ascending);
        break;
      case 3:
        controller.sortListByPhoneNumber(ascending);
        break;
      case 4:
        controller.sortListByIdBrithOfDate(ascending);
        break;
      case 5:
        controller.sortListByIdBasicSalary(ascending);
        break;
      case 6:
        controller.sortListByStartWorkDate(ascending);
        break;
      case 7:
        controller.sortListByPosition(ascending);
        break;
      default:
        controller.sortListById(ascending);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // ignore: invalid_use_of_protected_member
        body: controller.staffList.value.isEmpty
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isLoading
                          ? const CircularProgressIndicator()
                          : Column(
                              children: const [
                                Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                Text('Lỗi không thể lấy dữ liệu'),
                              ],
                            ),
                    ],
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text('Danh sách Tài Khoản'),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: TextField(
                                      onChanged: (value) {
                                        controller.searchStaff(value);
                                      },
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 0),
                                        // hintText: ,
                                        label: Text('Tìm kiếm nhân viên'),
                                        suffixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Tooltip(
                                          waitDuration:
                                              const Duration(seconds: 1),
                                          message: 'Thêm nhân viên',
                                          child: InkWell(
                                            onTap: () async {
                                              bool response =
                                                  await Get.dialog(AddEditStaff(
                                                controller: controller,
                                                // save: controller.saveStaff(data),
                                                staff: null,
                                              ));
                                              response
                                                  ? _key.currentState!.pageTo(
                                                      controller.staffList
                                                              .length -
                                                          1)
                                                  : null;
                                            },
                                            splashColor: Colors.blue[100],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.add_box_outlined,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Theme(
                                data:
                                    ThemeData(dividerColor: Colors.transparent),
                                child: PaginatedDataTable(
                                  key: _key,
                                  rowsPerPage:
                                      (MediaQuery.of(context).size.height -
                                              254) ~/
                                          kMinInteractiveDimension,
                                  source: StaffDataTableSource(
                                      controller: controller,
                                      staffList:
                                          // ignore: invalid_use_of_protected_member
                                          controller.staffList.value),
                                  sortAscending: sort,
                                  sortColumnIndex: column,
                                  horizontalMargin: 10,
                                  columnSpacing: 0,
                                  columns: [
                                    DataColumn(
                                      label: const SizedBox(
                                          width: 50, child: Text('ID')),
                                      onSort: sortColumn,
                                    ),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Tên NV',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Địa chỉ',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    const DataColumn(
                                        label: SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Số ĐT',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Ngày sinh',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Id ảnh',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Chức vụ',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Lương cơ bản',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Ngày vào làm',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    const DataColumn(
                                        label: SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Hành Động',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
