import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/controller/order_controller.dart';
import 'package:getx_1/test_get/components/data_table/order_data_table.dart';
import 'package:getx_1/test_get/screen/admin/page/order/add_edit_order.dart';

class OrderManagerPage extends StatefulWidget {
  const OrderManagerPage({super.key});

  @override
  State<OrderManagerPage> createState() => _OrderManagerPageState();
}

class _OrderManagerPageState extends State<OrderManagerPage> {
  OrderController controller = OrderController();
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
    await controller.initOrderList();
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
        controller.sortListByOrderDate(ascending);
        break;
      case 2:
        controller.sortListByIdCustomer(ascending);
        break;
      case 3:
        controller.sortListByIdOrderStatus(ascending);
        break;
      case 4:
        controller.sortListByTotal(ascending);
        break;
      case 5:
        controller.sortListByPaymentMethods(ascending);
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
        body: controller.orderList.value.isEmpty
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
                              const Text('Danh sách Đơn Hàng'),
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
                                        controller.searchOrder(value);
                                      },
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 0),
                                        // hintText: ,
                                        label: Text('Tìm kiếm đơn hàng'),
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
                                          message: 'Thêm đơn hàng',
                                          child: InkWell(
                                            onTap: () async {
                                              bool response =
                                                  await Get.dialog(AddEditOrder(
                                                controller: controller,
                                                // save: controller.saveOrder(data),
                                                order: null,
                                              ));
                                              response
                                                  ? _key.currentState!.pageTo(
                                                      controller.orderList
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
                                  source: OrderDataTableSource(
                                      controller: controller,
                                      orderList:
                                          // ignore: invalid_use_of_protected_member
                                          controller.orderList.value),
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
                                              'Ngày đặt',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Id khách hàng',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    const DataColumn(
                                        label: SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Id chi tiết',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Trạng Thái Đh',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Tổng',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Phương thức thanh toán',
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
