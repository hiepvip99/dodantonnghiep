import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/controller/product_controller.dart';
import 'package:getx_1/test_get/components/data_table/product_data_table.dart';
import 'package:getx_1/test_get/screen/admin/page/product/add_edit_product.dart';

class ProductManagerPage extends StatefulWidget {
  const ProductManagerPage({super.key});

  @override
  State<ProductManagerPage> createState() => _ProductManagerPageState();
}

class _ProductManagerPageState extends State<ProductManagerPage> {
  ProductController controller = ProductController();
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
    await controller.initProductList();
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
        controller.sortListByIdCategory(ascending);
        break;
      case 3:
        controller.sortListByPrice(ascending);
        break;
      case 4:
        controller.sortListByIdQuantity(ascending);
        break;
      case 5:
        controller.sortListByIdManufacturer(ascending);
        break;
      case 6:
        controller.sortListByIdSupplier(ascending);
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
        body: controller.productList.value.isEmpty
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
                                        controller.searchProduct(value);
                                      },
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 0),
                                        // hintText: ,
                                        label: Text('Tìm kiếm sản phẩm'),
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
                                          message: 'Thêm sản phẩm',
                                          child: InkWell(
                                            onTap: () async {
                                              bool response = await Get.dialog(
                                                  AddEditProduct(
                                                controller: controller,
                                                // save: controller.saveProduct(data),
                                                product: null,
                                              ));
                                              response
                                                  ? _key.currentState!.pageTo(
                                                      controller.productList
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
                                  source: ProductDataTableSource(
                                      controller: controller,
                                      productList:
                                          // ignore: invalid_use_of_protected_member
                                          controller.productList.value),
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
                                              'Tên SP',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Id Danh Mục',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    const DataColumn(
                                        label: SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Giá',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Id Số Lượng',
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
                                              'Id nhà sx',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: const SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Id cung cấp',
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
